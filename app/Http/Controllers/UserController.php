<?php

namespace App\Http\Controllers;

use App\Copon;
use App\Mail\SendCode;
use App\Order;
use App\User;
use Carbon\Carbon;
use http\Env\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class UserController extends Controller
{
    public function index()
    {
        $users = User::where('type',0)->paginate(20);
        return view('dashboard.users.index',compact('users'));
    }
    public function admins()
    {
        $users = User::where('type',2)->get();
        return view('dashboard.admins.index',compact('users'));
    }
    public function add_admin()
    {
        return view('dashboard.admins.create');
    }

    public function save_admin(Request $request)
    {
        $user = User::where('email',$request->email)->first();
        if(!$user)
        {
            $admin = new User();
            $admin->name = $request->name;
            $admin->email = $request->email;
            $admin->type = 'admin';
            $admin->password = Hash::make($request->password);
            $admin->save();

            return true;
        }
        else
        {
            return false;
        }
    }
    public function save_master(Request $request)
    {
        $user = User::where('email',$request->email)->first();
        if(!$user)
        {
            $admin = new User();
            $admin->name = $request->name;
            $admin->email = $request->email;
            $admin->type = 'master';
            $admin->password = Hash::make($request->password);
            $admin->save();

            return true;
        }
        else
        {
            return false;
        }
    }
    public function add_master()
    {
        return view('dashboard.masters.create');
    }
    public function masters()
    {
        $users = User::where('type','master')->get();
        return view('dashboard.masters.index',compact('users'));
    }
    public function owners()
    {
        $users = User::where('type',1)->paginate(20);
        return view('dashboard.owner.index',compact('users'));

    }
    public function get_users()
    {
        $users = User::all();
        return response()->json([
            'users' => $users
        ]);
    }
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

    public function login(Request $request)
    {
        $mobile = $request->mobile;
        $password = $request->password;

        $user = User::where('mobile',$mobile)->orWhere('email',$mobile)->first();
        if($user)
        {
            if(Hash::check($request->password,$user->password))
            {
                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'login successful',
                    'access_token' => $user->remember_token,
                    'user' => $user,
                ]);
            }
            else
            {
                return response()->json([
                    'code' => '401',
                    'status' => false,
                    'message' => 'Login failed',
                    'user' => [],
                ]);

            }
        }
        else
        {
            return response()->json([
                'code' => '402',
                'status' => false,
                'message' => 'Account not exist ',
                'user' => [],
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
            $new_user->mobile_verify = rand(9999,0);
            $new_user->type = 'user';
            $new_user->password = Hash::make($request->password);
            $new_user->save();

            $user = User::find($new_user->id);
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'register successful',
                'user' => $user,
            ]);
        }
        else
        {
            return response()->json([
                'code' => '401',
                'status' => false,
                'message' => 'Data is exist',
                'user' => [],
            ]);
        }
    }

    public function sendcode(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->first();

        if($user)
        {
            return response()->json([
                'user' => $user,
                'error' => false,
                'message' => 'لقد تم ارسال كلمة المرور الجديدة الى هاتفك المحمود'
            ]);
        }
        else
        {
            return response()->json([
                'error' => true,
                'message' => 'ارقم الهاتف غير موجود'
            ]);

        }
    }

    public function verify_mobile(Request $request)
    {
        $user = User::where('mobile',$request->mobile)
            ->where('mobile_verify',$request->code)
            ->first();
        if($user)
        {
            $user->status = 'verified';
            $user->save();
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'mobile verified',
                'user' => $user,
            ]);

        }
        else
        {
            return response()->json([
                'code' => '401',
                'status' => false,
                'message' => 'mobile not verified',
                'user' => $user,
            ]);

        }
    }
    public function forget_password(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->first();
        if($user)
        {
            $user->mobile_verify = rand(9999,0);
            $user->save();
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'Code sent',
                'data' => $user
            ]);

        }
    }
    public function reset_password(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->where('mobile_verify',$request->code)->first();
        if($user)
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
        else
        {
            return response()->json([
                'code' => '401',
                'status' => false,
                'message' => 'wrong data',
                'data' => []
                ]);
        }
    }
    public function user_profile($id)
    {
        $user = User::where('id',$id)->first();
        $orders = Order::where('user_id',$id)->paginate(10);
        return view('dashboard.users.profile',compact('user','orders'));
    }
    public function send_promo(Request $request)
    {
        $copon = Copon::where('status',0)->where('category_id',$request->category)->orderBy('id','DESC')->first();
        $copon->status =1;
        $copon->save();
        $data = [];
        $user = User::where('id',$request->user_id)->first();
        $data['name'] = $user->name;
        $data['email'] = $user->email;
        $data['message'] = 'مبروك لقد حصل على كوبون خصم رقم : ' . $copon->code . 'بنسبة خصم ' . $copon->discount . '%';

        Mail::to($data['email'])->send(new SendCode($data));

            return response([
                'code' => 200,
                'status' => true,
                'message' => 'لقد تم ارسال البرومو كود بنجاح'
            ]);


    }

    public function get_user_profile($market,$id)
    {
        $user = User::where('id',$id)
            ->with(array('order' => function($query) use ($market) {
            $query->where('market_id', $market);
            }))
            ->with(array('payment' => function($query) use ($market) {
            $query->where('market_id', $market);
            }))
            ->with(array('contract' => function($query) use ($market) {
            $query->where('market_id', $market);
            }))
            ->first();

        return $user;

    }
    public function my_profile($id)
    {
        $user = User::where('id',$id)
            ->with('order')
            ->with('payment')
            ->with('favorit')
            ->first();

        return $user;

    }

    public function set_location(Request $request)
    {
        $user = User::where('mobile',$request->mobile)->first();
        $user->address_latitude = $request->address_latitude;
        $user->address_longitude = $request->address_longitude;
        if($user->save())
        {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'location updated',
                'user' => $user,
            ]);

        }
    }

    public function update_user(Request $request)
    {
        $user = User::where('id',$request->user_id)->first();
        $user->mobile = $request->mobile;
        $user->email = $request->email;
        if($user->save())
        {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'data updated',
                'user' => $user,
            ]);

        }

    }
    public function edit($userId)
    {
        $user = User::find($userId);
        return view('dashboard.user.edit',compact('user'));

    }

    public function add_promo(Request $request)
    {
        $promo = Copon::where('code',$request->code)->first();
        $promo->user_id = Auth::user()->id;
        $promo->expire_date = Carbon::now()->addDays(15);
        $promo->save();
        return response([
            'code' => 200,
            'status' => true,
            'message' => 'تم شحن البرومو لحسابك'
        ]);
    }
}
