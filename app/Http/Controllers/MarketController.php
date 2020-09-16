<?php

namespace App\Http\Controllers;

use App\Contract;
use App\Market;
use App\Product;
use App\User;
use Illuminate\Http\Request;

class MarketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $markets = Market::all();
        return view('dashboard.markets.index',compact('markets'));
    }
    public function all_markets()
    {
        $markets = Market::where('state','فعال')
            ->with('product')
            ->with('category')
            ->get();
        return response()->json([
            'code' => '200',
            'status' => 'OK',
            'message' => '',
            'markets' => $markets
        ]);

    }

    public function activate_market(Request $request)
    {
        $market = Market::where('id',$request->id)->first();
        $market->state = $request->state;

        if($market->save())
        {
           return true;
        }
        else
        {
            return false;
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.markets.create');
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
                'status' => 'OK',
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
     * @param  \App\Market  $market
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $market = Market::where('id',$id)
            ->with('product')
            ->with('category')
            ->first();
        return json_decode($market,true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Market  $market
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $market = Market::find($id);
        return view('dashboard.markets.edit',compact('market'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Market  $market
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $market = Market::where('id',$request->id)->first();
        $market->name = $request->name;
        $market->owner_id = $request->owner_id;
        $market->address = $request->address;
        $market->phone = $request->phone;

        if($market->save())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Market  $market
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $market = Market::find($id);
        if(Market::where('id',$id)->delete())
        {
            return response()->json([
                'market' => $market,
                'msg' => 'success'
            ]);
        }
        else
        {
            return response()->json([
                'market' => $market,
                'msg' => 'fail'
            ]);
        }

    }

    /*
     * List of the products for specific market.
     * @param  $id is the market id
     */
    public function market_products($id)
    {
        $products = Product::where('market_id',$id)->get();
        $market = Market::where('id',$id)->first()->name;

        return view('dashboard.products.index',compact('products','market'));
    }
    public function market_users($id)
    {
        $market = Market::where('id',$id)->first();
        $contracts = Contract::where('market_id',$id)->get();
        return view('dashboard.contracts.index',compact('contracts','market'));


    }
    public function get_market_products($id)
    {
        $market = Market::where('id',$id)
            ->with('product')
            ->first();

        return response()->json([
            'code' => '200',
            'status' => 'OK',
            'message' => '',
            'market' => $market
        ]);
            return $market;
    }

    public function get_market_customers($id)
    {
        $total_dept = Contract::where('market_id',$id)->sum('current_amount');

        $contracts = Contract::where('market_id',$id)
            ->where('status','فعال')
            ->with('user')->get();
        return response()->json([
            'code' => '200',
            'status' =>'OK',
            'message'=> '',
            'total_dept' => $total_dept,
            'contract' => $contracts
        ]);
    }

    public function owner_markets($id)
    {
        $owner = User::where('id',$id)->with('market')->first();

        return response()->json([
            'code' => '200',
            'status' => 'OK',
            'message' => '',
            'owner' => $owner

        ]);
    }
}
