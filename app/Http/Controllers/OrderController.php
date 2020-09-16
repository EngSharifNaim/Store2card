<?php

namespace App\Http\Controllers;

use App\Contract;
use App\Order;
use App\User;
use App\OrderDetail;
use Illuminate\Http\Request;
use DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::where('status','انتظار')->get();
        return view('dashboard.orders.index',compact('orders'));
    }
    public function index_filter($status)
    {
        if($status == 1)
            $st = 'قيد التجهيز';
        if($status == 2)
            $st = 'قيد التوصيل';
        if($status == 3)
            $st = 'تم التسليم';
        $orders = Order::where('status',$st)->get();
        return view('dashboard.orders.index',compact('orders'));
    }
    public function customer_orders($id)
    {

            $orders =  Order::where('user_id',$id)
                ->with('market')
                ->with('details')
                ->get();

        $user = User::where('id',$id)->first();


        $markets = DB::table('contracts')->where('user_id',$id)
        ->join('markets','markets.id','contracts.market_id')
        ->select('markets.id as market_id','markets.name as market_name','markets.image as logo')
        ->get();

        $balance = Order::where('user_id',$id)->where('status','غير مسدد')->sum('total_price');
        return response()->json([
            'code' => '200',
            'status' => 'OK',
            'message' => '',
            'user' => $user,
            'total_dept' => $balance,
            'orders' => $orders,
            'markets' => $markets
        ]);
    }
    public function customer_market_orders($market,$id)
    {
            $orders =  DB::table('orders')->where('user_id',$id)
                ->join('markets','orders.market_id','markets.id')
                ->where('markets.id',$market)
                ->select('markets.id as market_id','markets.name as market_name','orders.created_at as time','orders.total_price as total','orders.id as order_id')
                ->get();

        $user = User::where('id',$id)->first();


        $markets = DB::table('contracts')->where('user_id',$id)
        ->join('markets','markets.id','contracts.market_id')
        ->select('markets.id as market_id','markets.name as market_name','markets.image as logo')
        ->get();

        $balance = Order::where('user_id',$id)->where('status','غير مسدد')->sum('total_price');
        return response()->json([
            'code' => '200',
            'status' => 'OK',
            'message' => '',
            'user' => $user,
            'total_dept' => $balance,
            'orders' => $orders,
            'markets' => $markets
        ]);
    }
    public function owner_orders($id)
    {
        return Order::where('market_id',$id)->with('details')->with('user')->get();
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
        //
    }

    public function send_order(Request $request)
    {
        $order = new Order();
        $order->user_id = $request->user_id;
        $order->market_id = $request->market_id;
        $order->total_price = $request->total_price;
        $order->status = 'pending';

        $order_details = json_decode($request->details,true);
//        return $order_details;
        if($order->save())
        {
            foreach ($order_details as $product) {
                $details = new OrderDetail();
                $details->order_id = $order->id;
                $details->product_id = $product['product_id'];
                $details->quantity = $product['quantity'];
                $details->price = $product['price'];
                $details->total_price = (int)$product['quantity'] * (int)$product['price'] ;
                $details->status = 'pending';
                $details->save();
            }
            return response()->json([
                'code' => '200',
                'status' => 'OK',
                'message' => 'تم ارسال الطلب بنجاح',
                'order' => $order
            ]);
        }
        else
        {
            return false;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }

    public function pay_order($id)
    {
        $order = Order::where('id',$id)->first();
        $order->status = 'مسدد';
        $order->save();

        return response()->json([
            'order' => $order
        ]);
    }
    public function cancel_pay($id)
    {
        $order = Order::where('id',$id)->first();
        $order->status = 'غير مسدد';
        $order->save();

        return response()->json([
            'order' => $order
        ]);
    }
    public function process_order($id)
    {
        $order = Order::where('id',$id)->first();
        $order->status = 'غير مسدد';
        $order->save();

        return response()->json([
            'order' => $order
        ]);
    }
}
