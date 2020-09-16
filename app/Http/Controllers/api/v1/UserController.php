<?php

namespace App\Http\Controllers\api\v1;

use App\Category;
use App\Contract;
use App\Copon;
use App\Http\Controllers\Controller;
use App\Mail\OrderStatus;
use App\Market;
use App\MarketReview;
use App\OauthAccessToken;
use App\Order;
use App\Product;
use App\Setting;
use App\ShippingTime;
use App\Slider;
use App\UpgradeRequst;
use Carbon\Carbon;
use http\Env\Response;
use Illuminate\Http\Request;
use App\User;
use App\Welcome;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendCode;
use DB;
use phpDocumentor\Reflection\DocBlock\Tags\Reference\Url;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add_promo(Request $request)
    {
        $promo = Copon::where('code',$request->code)->first();
        $promo->user_id = Auth::user()->id;
        $promo->expire_date = Carbon::now()->addDays(15);
        $promo->status = 1;
        $promo->save();
        return response([
            'code' => 200,
            'status' => true,
            'message' => 'تم شحن البرومو لحسابك'
        ]);
    }


    public function logout()
    {
        $accessToken = Auth::user()->token();
        DB::table('oauth_refresh_tokens')
            ->where('access_token_id', $accessToken->id)
            ->update([
                'revoked' => true
            ]);

        $accessToken->revoke();
        return response()->json(null, 204);
    }

    public function index()
    {
        return User::all();
    }

    public function cart(Request $request)
    {
//        return $request->product_list;
        $list = json_decode($request->product_list,true);
        $cart = [];
        $total = 0;
//        return $list;
        foreach ($list as $id)
        {
            $qty = $id['quantity'];
            $item =[];
            $product = Product::where('id',$id['product_id'])->first();
            $item['product_id'] = $id['product_id'];
            $item['product_name'] = $product->name;
            $item['price'] = (double)$product->price;
            $item['quantity'] = (double)$id['quantity'];
            $item['image'] = $product->image;
            if($product->state == 0)
                $item['available'] = false;
            else
                $item['available'] = true;

            $total += (int)$product->price;

            $cart[] = $item;

        }
        $times = ShippingTime::all();
        $promo = Copon::where('user_id',Auth::user()->id)
            ->where('status',1)
            ->where('expire_date','>',Carbon::now())
            ->orderBy('id','DESC')
            ->first();

        if($promo)
        {
            $discount = $total * $promo->discount / 100;
        }
        else
        {
            $discount = 0;
        }

        return response([
            'code' => 200,
            'statues' => true,
            'message' => 'Cart contents',
            'tax' => number_format((double)Setting::where('key','tax')->first()->value,2,'.',''),
            'delavery' => (double)Setting::where('key','delavery')->first()->value,
            'discount' => (double)number_format((double)$discount, 2, '.', ''),
            'points' => (int)Auth::user()->points,
            'total_price' => $total,
            'shipping_time' => $times,
            'data' => $cart
        ]);
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
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);

        if($user->save())
        {
            return response()->json([
                'msg' => 'added'
            ]);
        }

    }

    public function register(Request $request)
    {
        $user = User::where('email',$request->email)
            ->orWhere('mobile',$request->mobile)
            ->first();

        if(!$user)
        {
            $new_user = new User();
            $new_user->email = $request->email;
            $new_user->name = $request->name;
            $new_user->mobile = $request->mobile;
            $new_user->mobile_verify_code = mt_rand(2000,9000);
            $new_user->type = 0;
            $new_user->password = Hash::make($request->password);
            $new_user->save();

            $user = User::find($new_user->id);
            $data = [];
            $data['name'] = $new_user->name;
            $data['email'] = $new_user->email;
            $data['message'] = 'كود التحقق الخاص بك هو : ' . $new_user->mobile_verify_code;

            Mail::to($data['email'])->send(new SendCode($data));

            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'register successful',
                'data' => $user,
            ]);
        }
        else
        {
            return response()->json([
                'code' => '409',
                'status' => false,
                'message' => 'Data is exist',
            ]);
        }
    }

    public function send_code(Request $request)
    {
        $code = mt_rand(2000,9000);
        $user = User::where('mobile',$request->mobile)->first();
        $user->mobile_verify_code = $code;
        $user->save();

        return response([
            'code' => 200,
            'status' => true,
            'message' => 'new verification code',
            'mobile_verify_code' => $code
        ]);
    }
    public function add_user(Request $request)
    {
        $user = User::where('email',$request->email)
            ->orWhere('mobile',$request->mobile)
            ->first();

        if(!$user)
        {
            $new_user = new User();
            $new_user->email = $request->email;
            $new_user->name = $request->name;
            $new_user->mobile = $request->mobile;
            $new_user->mobile_verify_code = rand(9999,0);
            $new_user->type = 'user';
            $new_user->password = Hash::make($request->password);
            $new_user->save();

            $user = User::find($new_user->id);
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'register successful',
                'data' => $user,
            ]);
        }
        else
        {
            return response()->json([
                'code' => '409',
                'status' => false,
                'message' => 'Data is exist',
            ]);
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::where('id',$id)->delete();

        return response([
            'code' => 200,
            'status' => true,
            'message' => 'User deleted successfully',
            'user_id' => $id
        ]);
    }

    public function my_profile(Request $request)
    {
        if(isset($request->user_id) && Auth::User()->type == 'admin')
        {
            $user = User::where('id',$request->user_id)
                ->with('order')
                ->first();

        }
        else
        {
            $user = User::where('id',Auth::user()->id)
                ->with('order')
                ->first();
//            $markets = Contract::where('user_id',$user->id)
//                ->join('markets','contracts.market_id','markets.id')
//                ->select('markets.id','markets.name','contracts.max_amount','contracts.current_amount','markets.image')
//                ->get();

        }

        if($user)
        {
            $data = [];
            $data['name'] = $user->name;
            $data['email'] = $user->email;
            $data['mobile'] = $user->mobile;
            $data['address'] = $user->address;
            return response([
                'code' => '200',
                'status' => true,
                'message' => 'user profile data',
                'user' => $data,
            ]);
        }
        else
        {
            return response([
                'code' => '404',
                'status' => false,
                'message' => 'user not found',
            ]);
        }


    }

    public function verify_mobile(Request $request)
    {
        $user = User::where('mobile',$request->mobile)
            ->where('mobile_verify_code',$request->code)
            ->first();
        if($user)
        {
            $user->status = 1;
            $user->save();
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'mobile verified',
                'data' => $user,
            ]);

        }
        else
        {
            return response()->json([
                'code' => '400',
                'status' => false,
                'message' => 'mobile not verified, error activation code',
            ]);

        }
    }
    public function forget_password(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->first();
        if($user)
        {
            $user->mobile_verify_code = rand(9999,0);
            $user->save();
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'Code sent',
                'data' => $user
            ]);

        }
        else
        {
            return response([
                'code' => '400',
                'status' => false,
                'message' => 'Mobile not found'
            ]);
        }
    }
    public function reset_password(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->first();
        if($user)
        {
            if(isset($request->code) && $user->mobile_verify_code == $request->code)
            {
                $user->password = Hash::make($request->password);
                $user->save();
                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'password reset',
                    'data' => $user
                ]);
            }
            else{
                $user->mobile_verify_code = rand(9999,0);
                $user->save();
                //send sms code

                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'Code send as SMS',
                    'data' => $user
                ]);

            }


        }
        else
        {
            return response()->json([
                'code' => '400',
                'status' => false,
                'message' => 'Invalid code',
            ]);
        }
    }
    public function change_password(Request $request)
    {
        $user = User::where('id',$request->user_id)->first();
        if($user)
        {
            $user->password = Hash::make($request->password);
            $user->save();
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'password changed',
                'data' => $user
            ]);

        }
        else
        {
            return response()->json([
                'code' => '400',
                'status' => false,
                'message' => 'user not exist',
            ]);
        }
    }
    public function update_user(Request $request)
    {
            $user = User::where('id',Auth::user()->id)->first();
            if(isset($request->mobile))
            {
                $user->mobile = $request->mobile;
            }
            if(isset($request->email))
            {
                $user->email = $request->email;
            }
            if(isset($request->name))
            {
                $user->name = $request->name;
            }
            if ($request->hasFile('image'))
            {
                $image = $request->file('image');
                $name = 'users/' . time().'.'.$image->getClientOriginalExtension();
                $destinationPath = public_path('images/users');
                $image->move($destinationPath, $name);
                $user->image = $name;
            }


            if($user->save())
            {
                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'data updated',
                    'user' => $user,
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
    public function welcome()
    {
        return response()->json([
            'code' => '200',
            'status' => true,
            'message' => 'Welcome page',
            'logo' => 'logo.png',
        ]);
    }
    public function constants(Request $request)
    {
        if($request->key)
        {
            $setting = Setting::where('key',$request->key)->get();
        }
        else
        {
            $setting = Setting::all();
        }
        return response()->json([
            'code' => '200',
            'status' => true,
            'message' => 'Constants list',
            'constants' => $setting,
        ]);
    }
    public function home(Request $request)
    {
        $final_data = [];
        $per_page = 10;
        $sliders = Slider::all();
        if(!isset($request->search_key)) {
            $categories = Category::all();
        }
//            foreach ($categories as $category)
//            {
//                $market_data['id'] = $market->id;
//                $market_data['name'] = $market->name;
//                $market_data['image'] = $market->image;
//                $market_data['total_balance'] = $market->total_balance;
//                $market_data['address'] = $market->address;
//                $market_data['delivery_cost'] = $market->delivery_cost;
//                $market_data['tax'] = $market->tax;
//                $market_data['rate'] = number_format((float)$market->review, 1, '.', '');
//                $market_data['reviews'] = $market->reviews;
//
//                $reviewed = MarketReview::where('market_id',$market->id)->where('user_id',Auth::user()->id)->first();
//                if($reviewed)
//                    $market_data['has_review'] = true;
//                else
//                    $market_data['has_review'] = false;
//                $final_data[] = $market_data;
//            }


        return response([
            'code' => 200,
            'status' => true,
            'message' => 'home page',
            'data' => $categories,
            'sliders' => $sliders
        ]);
    }
    public function statistics(Request $request)
    {
        $data['total_orders'] = Order::where('market_id',$request->market_id)->sum('total_price');
        $data['not_paid_orders'] = Order::where('market_id',$request->market_id)
            ->where('status',1)
            ->sum('total_price');
        $data['paid_orders'] = Order::where('market_id',$request->market_id)
            ->where('status',2)
            ->sum('total_price');

        return response(
            [
                'code' => '200',
                'status' => true,
                'message' => 'statistics details',
                'data' => $data
            ]
        );
    }

    public function activate(Request $request)
    {
//        return $request;
        $user = User::where('id',$request->user_id)->first();
            $user->status =(int)$request->status;

        $user->save();
        if($user->status == 0)
            $msg = 'تم تعطيل الحساب';
        else
            $msg = 'تم تفعيل الحساب';

        return response([
            'code' => '200',
            'status' => true,
            'message' => $msg,
            'data' => $user
        ]);
    }

    public function upgrade(){
        if(Auth::User()->type == 0)
        {
            Auth::User()->type = 1;
            Auth::User()->save();
            $message = 'Upgrade request sent';
        }
        elseif(Auth::User()->type == 1)
        {
            Auth::User()->type = 2;
            Auth::User()->save();
            $message = 'User Acount upgraded to market owner...';

        }
        else
        {
            $message = 'Account already upgraded...';

        }

        return response([
            'code' => 200,
            'status' => true,
            'message' => $message,
            'user' => Auth::User()
        ]);
    }

    public function points()
    {
        return response([
            'code' => 200,
            'status' => true,
            'message' => 'my points',
            'points' => 35,
            'image' => 'points.png',
            'details' => 'مع خدمة نقاطي بتحصل على 5% من قيمة مشترياتك بتكون رصيد ليك و لما توصل نقاطك 50 جنيه بتقدر تستبدلها برصيد مشتريات من كابتوتشا'
        ]);
    }

}
