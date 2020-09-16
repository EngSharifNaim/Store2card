<?php

namespace App\Http\Controllers;

use App\Order;
use App\Product;
use App\Setting;
use App\Slider;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function sliders()
    {
        $sliders = Slider::all();
        return view('dashboard.sliders.index',compact('sliders'));
    }
    public function fetch()
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "http://api.alquran.cloud/v1/edition",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "Cache-Control: no-cache",
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);
        foreach (json_decode($response,true)['data'] as $name)
        {
            echo $name['name'] . '<br>';

        }
        return json_decode($response,true)['data'][1]['name'];
        curl_close($curl);

    }
    public function dashboard()
    {
        return view('dashboard.index');
    }
    public function index()
    {
        return view('home');



    }

    public function apis()
    {
        return view('apis');
    }
    public function import(Request $request)
    {
        $file = fopen(base_path() . '/public/bank.txt','r');

        while (!feof($file))
        {
            echo str_replace(' ','',fgets($file)) .'<br>';
        }
    }

    public function xteam_test(Request $request)
    {
        $new_user = new User();

        $new_user->name = $request->name;
        $new_user->mobile = $request->mobile;
        $new_user->mobile_verify = rand(9999,0);
        $new_user->type = 'user';
        $new_user->password = Hash::make($request->password);
        $new_user->address_longitude = $request->address_longitude;
        $new_user->address_latitude = $request->address_latitude;
        $new_user->save();

        $user = User::find($new_user->id);
        $market = [];
        $market[0]['address_longitude'] = '31.522119';
        $market[0]['address_latitude'] = '34.444869';
        $market[0]['name'] = 'Meat City';
        $market[0]['address'] = 'Gaza';
        $market[0]['rate'] = 4;

        $market[1]['address_longitude'] = '31.31194';
        $market[1]['address_latitude'] = '34.27050';
        $market[1]['name'] = 'Palestine Stadium';
        $market[1]['address'] = 'Gaza';
        $market[1]['rate'] = 5;
        return response()->json([
            'code' => '200',
            'status' => true,
            'message' => 'successfull',
            'data' => $new_user,
            'markets' => $market

        ]);
    }
    public function settings()
    {
        return view('dashboard.settings.index');
    }
}
