<?php

namespace App\Http\Controllers;

use App\Contract;
use Illuminate\Http\Request;

class ContractController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contracts = Contract::all();

        return view('dashboard.contracts.index',compact('contracts'));
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
        $contract = new Contract();
        $contract->user_id = $request->user_id;
        $contract->market_id = $request->market_id;
        $contract->max_amount = $request->max_amount;

        if($contract->save())
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public function contract_requests($id)
    {
        $contracts = Contract::where('market_id',$id)
            ->with('user')
            ->where('status','انتظار')
            ->get();

        if($contracts)
        {
            return response()->json([
                'code' => '200',
                'status' => 'OK',
                'message' => '',
                'contratcs' => $contracts
            ]);
        }
    }
    public function approve_contract(Request $request)
    {
        $contract = Contract::where('id',$request->contract_id)->first();
        $contract->status = 'فعال';
        $contract->max_amount = $request->max_amount;


        if($contract->save())
        {
            return response()->json([
                'code' => '200',
                'status' => 'OK',
                'message' => 'Contract approved',
                'contract' => $contract
            ]);
        }
        else
        {
            return false;
        }
    }
    public function cancel_contract($id)
    {
        $contract = Contract::where('id',$id)->first();
        $contract->status = 'غير فعال';

        if($contract->save())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Contract  $contract
     * @return \Illuminate\Http\Response
     */
    public function show(Contract $contract)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Contract  $contract
     * @return \Illuminate\Http\Response
     */
    public function edit(Contract $contract)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Contract  $contract
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contract $contract)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Contract  $contract
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contract $contract)
    {
        //
    }
}
