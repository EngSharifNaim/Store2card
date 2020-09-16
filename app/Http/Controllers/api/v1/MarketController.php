<?php

namespace App\Http\Controllers\api\v1;

use App\Contract;
use App\Http\Controllers\Controller;
use App\Market;
use App\MarketReview;
use App\Product;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Prophecy\Prophecy\Revealer;

class MarketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $market = new Market();
        $market->name = $request->name;
        $market->owner_id = $request->owner_id;
        $market->address = $request->address;
        $market->phone = $request->phone;
        $market->total_balance = 0;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images/market_logo');
            $image->move($destinationPath, $name);
            $market->image = $name;
        }

        if($market->save())
        {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'market created',
                'market' => $market
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $per_page = 10;
        $markets = Market::paginate($per_page);
        $total_count = Market::count();

        if(isset($request->with_products))
        {
            $markets = Market::with('product')->paginate($per_page);
        }
        $data = [];
        $final_data = [];
        $response = [];


        $response['code'] = 200;
        $response['status'] = true;
        $response['message'] = 'Markets list';
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

        foreach ($markets as $market)
        {
            $data['id'] = $market->id;
            $data['name'] = $market->name;
            $data['image'] = $market->image;
            $data['state'] = $market->state;
            $data['rate'] = $market->review;
            $data['product'] = $market->product;
            $final_data[] = $data;
        }
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
        $market = Market::where('id',$request->market_id)->first();
        if(!$market)
        {
            return response()->json([
                'code' => '404',
                'status' => false,
                'message' => 'market not found',
            ]);

        }
        if(isset($request->name))
        {
            $market->name = $request->name;
        }
        if(isset($request->address))
        {
            $market->address = $request->address;
        }
        if(isset($request->phone))
        {
            $market->phone = $request->phone;
        }

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images/market_logo');
            $image->move($destinationPath, $name);
            $market->image = $name;
        }

        if($market->save())
        {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'market updated',
                'market' => $market
            ]);
        }
        else
        {
            return response()->json([
                'code' => '500',
                'status' => false,
                'message' => 'Server error',
            ]);

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function reviews(Request $request)
    {
        $reviews = MarketReview::where('market_id',$request->market_id)->get();
        return response([
            'code' => 200,
            'status' => true,
            'message' => 'reviews list',
            'data' => $reviews
        ]);
    }
    public function add_review(Request $request)
    {
        $review = new MarketReview();
        $review->market_id = $request->market_id;
        $review->rate = $request->rate;
        $review->review = $request->review;
        $review->user_id = Auth::user()->id;
        $review->save();

        $sum = MarketReview::where('market_id',$request->market_id)->sum('rate');
        $count = MarketReview::where('market_id',$request->market_id)->count();

        $review = round($sum/$count,2);

        $market = Market::where('id',$request->market_id)->first();
        $market->review = $review;
        $market->save();

        return response([
            'code' => 200,
            'status' => true,
            'message' => 'market rated',
            'data' => $market
        ]);
    }
    public function destroy($id)
    {
        Market::where('id',$id)->delete();

        return response([
            'code' => 200,
            'status' =>true,
            'message' => 'تم حذف المتجر',
            'market_id' => $id
        ]);
    }
    public function search(Request $request){
        $markets = Market::where('name','like','%' . $request->serach_key . '%')->get();

        return response([
            'code' => '200',
            'status' => true,
            'message' => 'markets list',
            'markets' => $markets
        ]);
    }
}
