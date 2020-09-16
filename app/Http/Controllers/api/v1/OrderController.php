<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Market;
use App\Order;
use App\OrderDetail;
use App\Product;
use App\Setting;
use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use const http\Client\Curl\AUTH_ANY;

class OrderController extends Controller
{
    public function getTax(){
        return Setting::where('key','tax')->first()->value;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::where('user_id',Auth::user()->id)
            ->with('details')
            ->get();
        return $orders;
    }
    public function order_status(Request $request)
    {
        $order = Order::where('id',$request->order_id)->first();
        $products = OrderDetail::where('order_id',$request->order_id)->get();
        return response(
            [
                'code' => 200,
                'status' => true,
                'status_code' => $order->status_code,
                'order_id' => $request->order_id,
                'data' => $products
            ]
        );
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $list = json_decode($request->product_list,true);
        $sum = 0;
        foreach ($list as $item)
        {
            $sum += Product::where('id',$item['product_id'])->first()->price * $item['quantity'];
        }

        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->total_price = $sum;
        $order->delivery_cost = Setting::where('key','delavery')->first()->value;
        $order->tax = Setting::where('key','tax')->first()->value;
        $order->status = 'انتظار';
        $order->status_code = 0;
        switch ($request->day) {
            case 0:
                $order->day = 'الاثنين';
                break;
            case 1:
                $order->day = 'الثلاثاء';
                break;
            case 2:
                $order->day = 'الأربعاء';
                break;
            case 3:
                $order->day = 'الخميس';
                break;
            case 4:
                $order->day = 'الجمعة';
                break;
            case 5:
                $order->day = 'السبت';
                break;
            case 6:
                $order->day = 'الأحد';
                break;
        }

        $order->time = $request->time;
        $order->callme = $request->callme;
        $order->notes = $request->notes;
        $order->address = $request->address;



        if($order->save())
        {
            foreach ($list as $product) {
                $item = new OrderDetail();
                $item->user_id = Auth::user()->id;
                $item->product_id = $product['product_id'];
                $item->product_name = Product::where('id',$product['product_id'])->first()->name;
                $item->price = Product::where('id',$product['product_id'])->first()->price;
                $item->total_price = Product::where('id',$product['product_id'])->first()->price * $product['quantity'];
                $item->quantity = $product['quantity'];
                $item->order_id = $order->id;
                $item->save();
            }
            return response()->json([
                'code' => 200,
                'status' => true,
                'message' => 'تم اضافة الطلب بنجاح',
                'order_id' => $order->id
            ]);
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $per_page = 10;
        if(isset($request->order_id))
        {
            $orders = Order::where('id',$request->order_id)
                ->with('market')
                ->with('user')
                ->with('details')
                ->first();
            $data['market'] = $orders->market->name;
            $data['order_id'] = $orders->id;
            $data['date'] = date('Y-m-d',strtotime($orders->created_at ." UTC"));
            $data['time'] = date('H:i:m',strtotime($orders->created_at ." UTC"));
            $data['total_price'] = $orders->total_price;
            $data['delivery_cost'] = $orders->delivery_cost	;
            $data['tax'] = $orders->tax	;
            $data['products'] = $orders->details;
            return response([
                'code' => '200',
                'status' => true,
                'orders' => $data
            ]);

        }
        if(isset($request->user_id) && isset($request->market_id))
        {
            $total_dept = Order::where('user_id',Auth::User()->id)->sum('total_price');
            $orders = Order::where('user_id',$request->user_id)
                ->where('market_id',$request->market_id)
                ->with('market')
                ->orderBy('id','DESC')
                ->paginate(10);

            $total_count = Order::where('user_id',Auth::user()->id)->count();
            $data = [];
            $final_data = [];
            $response = [];


            $response['code'] = 200;
            $response['status'] = true;
            $response['message'] = 'Orders list';
            $response['pagination']['total_count'] = $total_count;
            $response['pagination']['item_per_page'] = $per_page;
            if (isset($request->page))
                $response['pagination']['current_page'] = $request->page;
            else
                $response['pagination']['current_page'] = 1;

            $response['pagination']['next_page'] = $response['pagination']['current_page'] + 1;
            $response['pagination']['prev_page'] = $response['pagination']['current_page'] - 1;

            if ($total_count <= $per_page) {
                $response['pagination']['total_pages'] = 1;

            } else {
                $response['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
            }

            foreach ($orders as $order)
            {
                $data['id'] = $order->id;
                $data['market'] = $order->market->name;
                $data['total_price'] = $order->total_price;
                $data['status'] = $order->status;
                $data['date'] = date('Y-m-d H:i:m',strtotime($order->created_at ." UTC"));
                $final_data[] = $data;
            }
            $response['total_amount'] = $total_dept;
            $response['orders'] = $final_data;

            return $response;


        }
        if(isset($request->user_id))
        {
            $total_dept = Order::where('user_id',Auth::User()->id)->sum('total_price');
            $orders = Order::where('user_id',$request->user_id)
            ->with('market')
                ->orderBy('id','DESC')
            ->paginate(10);

            $total_count = Order::where('user_id',Auth::User()->id)->count();
            $data = [];
            $final_data = [];
            $response = [];


            $response['code'] = 200;
            $response['status'] = true;
            $response['message'] = 'Orders list';
            $response['pagination']['total_count'] = $total_count;
            $response['pagination']['item_per_page'] = $per_page;
            if (isset($request->page))
                $response['pagination']['current_page'] = $request->page;
            else
                $response['pagination']['current_page'] = 1;

            $response['pagination']['next_page'] = $response['pagination']['current_page'] + 1;
            $response['pagination']['prev_page'] = $response['pagination']['current_page'] - 1;

            if ($total_count <= $per_page) {
                $response['pagination']['total_pages'] = 1;

            } else {
                $response['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
            }

            foreach ($orders as $order)
            {
                $data['id'] = $order->id;
                $data['market'] = $order->market->name;
                $data['total_price'] = $order->total_price;
                $data['status'] = $order->status;
                $data['date'] = date('Y-m-d H:i:m',strtotime($order->created_at ." UTC"));
                $final_data[] = $data;
            }
            $response['total_amount'] = $total_dept;
            $response['orders'] = $final_data;

            return $response;


        }
        if(isset($request->market_id))
        {
            $orders = Order::where('market_id',$request->market_id)
            ->paginate($per_page);
            $total_count = Order::where('user_id',Auth::user()->id)->count();
            $total_price = Order::where('user_id',Auth::User()->id)->sum('total_price');
            $data = [];
            $final_data = [];
            $response = [];


            $response['code'] = 200;
            $response['status'] = true;
            $response['message'] = 'Orders list';
            $response['pagination']['total_count'] = $total_count;
            $response['pagination']['item_per_page'] = $per_page;
            if (isset($request->page))
                $response['pagination']['current_page'] = $request->page;
            else
                $response['pagination']['current_page'] = 1;

            $response['pagination']['next_page'] = $response['pagination']['current_page'] + 1;
            $response['pagination']['prev_page'] = $response['pagination']['current_page'] - 1;

            if ($total_count <= $per_page) {
                $response['pagination']['total_pages'] = 1;

            } else {
                $response['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
            }

            foreach ($orders as $order)
            {
                $data['id'] = $order->id;
                $data['market'] = $order->market->name;
                $data['total_price'] = $order->total_price;
                $data['status'] = $order->status;
                $data['date'] = date('Y-m-d H:i:m',strtotime($order->created_at ." UTC"));
                $final_data[] = $data;
            }
            $response['total_amount'] = $total_price;
            $response['orders'] = $final_data;

            return $response;

        }

        $total_count = Order::where('user_id',Auth::user()->id)->count();
        $total_price = Order::where('user_id',Auth::User()->id)->sum('total_price');

        $my_markets = DB::Table('contracts')
            ->join('markets','markets.id','contracts.market_id')
            ->where('contracts.user_id',Auth::User()->id)
            ->select('markets.name','markets.id','markets.image')
            ->get();
        $orders = Order::where('user_id',Auth::user()->id)
            ->where('market_id',$my_markets[0]->id)
            ->paginate($per_page);

        $data = [];
        $final_data = [];
        $response = [];


        $response['code'] = 200;
        $response['status'] = true;
        $response['message'] = 'Orders list';
        $response['pagination']['total_count'] = $total_count;
        $response['pagination']['item_per_page'] = $per_page;
        if (isset($request->page))
            $response['pagination']['current_page'] = $request->page;
        else
            $response['pagination']['current_page'] = 1;

        $response['pagination']['next_page'] = $response['pagination']['current_page'] + 1;
        $response['pagination']['prev_page'] = $response['pagination']['current_page'] - 1;

        if ($total_count <= $per_page) {
            $response['pagination']['total_pages'] = 1;

        } else {
            $response['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
        }

        foreach ($orders as $order)
        {
            $data['id'] = $order->id;
            $data['market'] = $order->market->name;
            $data['total_price'] = $order->total_price;
            $data['date'] = date('Y-m-d H:i:m',strtotime($order->created_at ." UTC"));
            $final_data[] = $data;
        }
        $response['total_amount'] = $total_price;
        $response['markets'] = $my_markets;
        $response['orders'] = $final_data;

        return $response;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        if(isset($request->order_id))
        {
            $order = Order::where('id',$request->order_id)->first();
            if(isset($request->status))
            {
                if($request->status == 0)
                {
                    $order->status = 'pending';
                }
                if($request->status == 1)
                {
                    $order->status = 'received';
                }
                if($request->status == 2)
                {
                    $order->status = 'paid';
                }
                $order->status_code = (int)$request->status;
                $order->save();
                return response([
                    'code' => '200',
                    'status' => true,
                    'message' => 'Order status updated',
                    'data' => $order
                ]);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function change_status(Request $request)
    {
        $order = Order::where('id',$request->order_id)->first();
        if($request->status == '0')
            $order->status = 'انتظار';
        if($request->status == '1')
            $order->status = 'قيد التجهيز';
        if($request->status == '2')
            $order->status = 'قيد التوصيل';
        if($request->status == '3')
            $order->status = 'تم التسليم';
        $order->save();
        return response([
            'code' => 200,
            'status' => true,
            'message' =>  'تم تعديل حالة الطلب ',
            'order_id' =>  $request->order_id
        ]);
    }
}
