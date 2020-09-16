<?php

namespace App\Http\Controllers;

use App\Copon;
use App\CoponCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CoponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $copon_categories = CoponCategory::with('copon')->get();
        return view('dashboard.copons.index',compact('copon_categories'));
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

    /**
     * Display the specified resource.
     *
     * @param  \App\Copon  $copon
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $copons = Copon::where('category_id',$id)->get();
        return view('dashboard.copons.list',compact('copons'));
    }

    public function generate_cote()
    {
        return view('dashboard.copons.create');
    }
    public function store_cote(Request $request)
    {
        $cote = new CoponCategory();
        $cote->name = $request->name;
        $cote->discount = $request->discount;
        $cote->copons_count = $request->copons_count;
        $cote->save();

        for($i = 0;$i<$request->copons_count;$i++)
        {
            $code =Str::random(8);
            $copon = new Copon();
            $copon->code = $code;
            $copon->discount = $request->discount;
            $copon->category_id = $cote->id;
            $copon->save();
        }

        $copon_categories = CoponCategory::with('copon')->get();
        return view('dashboard.copons.index',compact('copons'));

    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Copon  $copon
     * @return \Illuminate\Http\Response
     */
    public function edit(Copon $copon)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Copon  $copon
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Copon $copon)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Copon  $copon
     * @return \Illuminate\Http\Response
     */
    public function destroy(Copon $copon)
    {
        //
    }
}
