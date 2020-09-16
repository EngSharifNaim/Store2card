<?php

namespace App\Http\Controllers\api\v1;

use App\Category;
use App\Http\Controllers\Controller;
use App\OrderDetail;
use App\Product;
use App\Market;
use App\ShippingTime;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!Market::where('id', $request->market_id)->first()) {
            return response()->json([
                'code' => '300',
                'status' => false,
                'message' => 'Market does not exist',
                'product' => []

            ]);

        }
        if (!Category::where('id', $request->category_id)->first()) {
            return response()->json([
                'code' => '300',
                'status' => false,
                'message' => 'Category does not exist',
                'product' => []

            ]);

        }
        $product = new Product();
        $product->name = $request->name;
        $product->category_id = $request->category_id;
        $product->market_id = $request->market_id;
        $product->price = $request->price;
        $product->price_list = $request->price_list;
        $product->description = $request->description;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/products');
            $image->move($destinationPath, $name);
            $product->image = $name;
        }

        if ($product->save()) {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'Product added successfully',
                'product' => $product

            ]);
        } else {
            return response()->json([
                'code' => '300',
                'status' => false,
                'message' => 'Process failed',
                'product' => []

            ]);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $per_page = 12;

        if (isset($request->product_id))
        {
            $products = DB::table('products')
                ->where('id', $request->product_id)
                ->select('id', 'name', 'price','state','offer','description', 'image','category_id')
                ->first();
            $others = Product::inRandomOrder()
            ->where('category_id',$products->category_id)
                ->take(5)->get();
            foreach ($others as $product) {
                $pro_data['id'] = $product->id;
                $pro_data['name'] = $product->name;
                $pro_data['price'] = $product->price;
                $pro_data['status'] = $product->state;
                $pro_data['offer'] = $product->offer;
                $pro_data['image'] = $product->image;
                $final_data[] = $pro_data;
            }

            if ($products) {
                $data['code'] = '200';
                $data['status'] = true;
                $data['message'] = 'Product found';
                $data['data'] = $products;
                $data['others'] = $final_data;
            } else {
                $data['code'] = '400';
                $data['status'] = 'Empty';
                $data['message'] = 'Product not found';
            }
            return response($data);

        }
        if(isset($request->keyword))
        {
            $products = Product::where('name','like','%' . $request->keyword . '%')->get();
            if(count($products) > 0)
            {
                foreach ($products as $product) {
                    $pro_data['id'] = $product->id;
                    $pro_data['name'] = $product->name;
                    $pro_data['price'] = $product->price;
                    $pro_data['category_id'] = $product->category_id;
                    $pro_data['price_list'] = json_decode($product->price_list, true);
                    $pro_data['image'] = $product->image;
                    $final_data[] = $pro_data;
                }

                return response([
                    'code' => 200,
                    'status' => true,
                    'message' => 'search result list',
                    'data' => $final_data
                ]);
            }
            else
            {
                return response([
                    'code' => 400,
                    'status' => false,
                    'message' => 'There is no results',
                ]);
            }

        }
        if (isset($request->category)) {
            $category_id = Category::where('name',$request->category)->first()->id;
            $final_data = [];
            if (Category::where('name',$request->category)->first()) {
                $products = DB::table('products')
                    ->where('category_id', $request->category)
                    ->select('id', 'name', 'price', 'image','state','offer')
                    ->paginate($per_page);

                $total_count = DB::table('products')
                    ->where('category_id', $request->category)
                    ->count();

                foreach ($products as $product) {
                    $pro_data['id'] = $product->id;
                    $pro_data['name'] = $product->name;
                    $pro_data['price'] = $product->price;
                    $pro_data['category'] = $request->category;
                    $pro_data['status'] = $product->state;
                    $pro_data['offer'] = $product->offer;
                    $pro_data['image'] = $product->image;
//                    if (in_array($product->id, json_decode(Auth::user()->favorits, true))) {
//                        $pro_data['favorit'] = true;
//                    } else {
//                        $pro_data['favorit'] = false;
//                    }
                    $final_data[] = $pro_data;
                }
                if (count($products) > 0) {
                    $data['code'] = '200';
                    $data['status'] = true;
                    $data['message'] = 'Products List for category ' . $request->category;
                    $data['category_id'] = $request->category;
                    $data['pagination']['total_count'] = $total_count;
                    $data['pagination']['item_per_page'] = $per_page;
                    if (isset($request->page))
                        $data['pagination']['current_page'] = $request->page;
                    else
                        $data['pagination']['current_page'] = 1;

                    $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
                    $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

                    if ($total_count <= $per_page) {
                        $data['pagination']['total_pages'] = 1;

                    } else {
                        $data['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
                    }

                    $data['data'] = $final_data;
                } else {
                    $data['code'] = '400';
                    $data['status'] = 'Empty';
                    $data['message'] = 'Category not found';
                    $data['data'] = $final_data;
                }
                return response($data);
            } else {
                return response(['code' => 404, 'status' => false, 'message' => 'Category not found']);
            }


        }
        if (isset($request->offer)) {
            $final_data = [];

                $products = DB::table('products')
                    ->where('offer', 1)
                    ->select('id', 'name', 'price', 'image','state','offer')
                    ->paginate($per_page);

                $total_count = DB::table('products')
                    ->where('category_id', $request->category_id)
                    ->count();

                foreach ($products as $product) {
                    $pro_data['id'] = $product->id;
                    $pro_data['name'] = $product->name;
                    $pro_data['price'] = $product->price;
                    $pro_data['status'] = $product->state;
                    $pro_data['offer'] = $product->offer;
                    $pro_data['image'] = $product->image;
//                    if (in_array($product->id, json_decode(Auth::user()->favorits, true))) {
//                        $pro_data['favorit'] = true;
//                    } else {
//                        $pro_data['favorit'] = false;
//                    }
                    $final_data[] = $pro_data;
                }
                if (count($products) > 0) {
                    $data['code'] = '200';
                    $data['status'] = true;
                    $data['message'] = 'offers list';
                    $data['pagination']['total_count'] = $total_count;
                    $data['pagination']['item_per_page'] = $per_page;
                    if (isset($request->page))
                        $data['pagination']['current_page'] = $request->page;
                    else
                        $data['pagination']['current_page'] = 1;

                    $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
                    $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

                    if ($total_count <= $per_page) {
                        $data['pagination']['total_pages'] = 1;

                    } else {
                        $data['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
                    }

                    $data['data'] = $final_data;
                } else {
                    $data['code'] = '400';
                    $data['status'] = 'Empty';
                    $data['message'] = 'Offers list is empty';
                    $data['data'] = $final_data;
                }
                return response($data);

            }

        if (isset($request->favorits)) {
            $favorits = Auth::User()->favorits;
            $products = DB::table('products')
                ->whereIn('id', json_decode($favorits))
                ->select('id', 'name', 'price', 'price_list', 'image')
                ->paginate($per_page);

            $total_count = DB::table('products')
                ->whereIn('id', json_decode($favorits))
                ->count();

            foreach ($products as $product) {
                $pro_data['id'] = $product->id;
                $pro_data['name'] = $product->name;
                $pro_data['price'] = $product->price;
                $pro_data['price_list'] = json_decode($product->price_list, true);
                $pro_data['image'] = $product->image;
                if (in_array($product->id, json_decode(Auth::user()->favorits, true))) {
                    $pro_data['favorit'] = true;
                } else {
                    $pro_data['favorit'] = false;
                }

                $final_data[] = $pro_data;
            }
            if (count($products) > 0) {
                $data['code'] = '200';
                $data['status'] = true;
                $data['message'] = 'Favoti list';
                $data['pagination']['total_count'] = $total_count;
                $data['pagination']['item_per_page'] = $per_page;
                if (isset($request->page))
                    $data['pagination']['current_page'] = $request->page;
                else
                    $data['pagination']['current_page'] = 1;

                $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
                $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

                if ($total_count <= $per_page) {
                    $data['pagination']['total_pages'] = 1;

                } else {
                    $data['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
                }

                $data['data'] = $final_data;
            } else {
                $data['code'] = '400';
                $data['status'] = 'Empty';
                $data['message'] = 'Favorit list is empry';
            }
            return response($data);
        }

        $products = Product::paginate(10);

        $total_count = count($products);
        foreach ($products as $product) {
            $pro_data['id'] = $product->id;
            $pro_data['name'] = $product->name;
            $pro_data['price'] = $product->price;
            $pro_data['price_list'] = json_decode($product->price_list, true);
            $pro_data['image'] = $product->image;
            $final_data[] = $pro_data;
        }
        if (count($products) > 0) {
            $data['code'] = '200';
            $data['status'] = true;
            $data['message'] = 'Favoti list';
            $data['pagination']['total_count'] = $total_count;
            $data['pagination']['item_per_page'] = $per_page;
            if (isset($request->page))
                $data['pagination']['current_page'] = $request->page;
            else
                $data['pagination']['current_page'] = 1;

            $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
            $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

            if ($total_count <= $per_page) {
                $data['pagination']['total_pages'] = 1;

            } else {
                $data['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
            }

            $data['data'] = $final_data;
        } else {
            $data['code'] = '400';
            $data['status'] = 'Empty';
            $data['message'] = 'Favorit list is empry';
        }
        return response($data);

    }

    public function favorits(Request $request)
    {
        $per_page = 10;
            $favorits = Auth::User()->favorits;
            $products = DB::table('products')
                ->whereIn('id', json_decode($favorits))
                ->select('id', 'name', 'price', 'price_list', 'image')
                ->paginate($per_page);

            $total_count = DB::table('products')
                ->whereIn('id', json_decode($favorits))
                ->count();

            foreach ($products as $product) {
                $pro_data['id'] = $product->id;
                $pro_data['name'] = $product->name;
                $pro_data['price'] = $product->price;
                $pro_data['price_list'] = json_decode($product->price_list, true);
                $pro_data['image'] = $product->image;
                if (in_array($product->id, json_decode(Auth::user()->favorits, true))) {
                    $pro_data['favorit'] = true;
                } else {
                    $pro_data['favorit'] = false;
                }

                $final_data[] = $pro_data;
            }
            if (count($products) > 0) {
                $data['code'] = '200';
                $data['status'] = true;
                $data['message'] = 'Favoti list';
                $data['pagination']['total_count'] = $total_count;
                $data['pagination']['item_per_page'] = $per_page;
                if (isset($request->page))
                    $data['pagination']['current_page'] = $request->page;
                else
                    $data['pagination']['current_page'] = 1;

                $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
                $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

                if ($total_count <= $per_page) {
                    $data['pagination']['total_pages'] = 1;

                } else {
                    $data['pagination']['total_pages'] = floor($total_count / $per_page) + 1;
                }

                $data['data'] = $final_data;
            } else {
                $data['code'] = '400';
                $data['status'] = 'Empty';
                $data['message'] = 'Favorit list is empry';
            }
            return response($data);


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $product = Product::where('id', $request->product_id)->first();
        if ($product) {
            if (isset($request->name)) {
                $product->name = $request->name;
            }
            if (isset($request->description)) {
                $product->description = $request->description;
            }
            if (isset($request->price)) {
                $product->price = $request->price;
            }
            if (isset($request->price_list)) {
                $product->price_list = $request->price_list;
            }
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $name = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/images/products');
                $image->move($destinationPath, $name);
                $product->image = $name;
            }
            if ($product->save()) {
                $data['id'] = $product->id;
                $data['name'] = $product->name;
                $data['description'] = $product->description;
                $data['category_id'] = $product->category_id;
                $data['price'] = $product->price;
                $data['price_list'] = json_decode($product->price_list, true);
                $data['image'] = $product->image;
                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'Product updated successfully',
                    'product' => $data,

                ]);
            } else {
                return response()->json([
                    'code' => '300',
                    'status' => false,
                    'message' => 'Process failed',
                    'product' => []

                ]);
            }

        } else {
            return response()->json([
                'code' => '400',
                'status' => false,
                'message' => 'product not found',
                'product' => []
            ]);
        }


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (Product::where('id', $id)->delete()) {
            return response([
                'code' => '200',
                'status' => true,
                'message' => 'Product deleted',
                'product_id' => $id

            ]);
        } else {
            return response([
                'code' => '404',
                'status' => false,
                'message' => 'Product not found'
            ]);
        }

    }

    public function make_favorit(Request $request)
    {
        $favorits = json_decode(Auth::User()->favorits);
        $product = Product::where('id',$request->product_id)->first();
        if (!in_array((int)$request->product_id, $favorits)) {
            $message = 'Product now in favorits';
            $favorits[] = (int)$request->product_id;
            $state = true;
        }
        else
            {
            for ($i = 0; $i < count($favorits); $i++) {
                if ($favorits[$i] == $request->product_id) {
                    $message = 'Product now not in favorits';
                    unset($favorits[$i]);
                }
                $state = false;
            }
        }

        $data['id'] = $product->id;
        $data['name'] = $product->name;
        $data['price'] = $product->price;
        $data['price_list'] = json_decode($product->price_list,true);
        $data['image'] = $product->image;
        $data['category_id'] = $product->category_id;
        $data['description'] = $product->description;
        $data['favorit'] = $state;
        Auth::User()->favorits = $favorits;
        Auth::User()->save();

        return response([
            'code' => '200',
            'status' => true,
            'message' => $message,
            'data' => $data
        ]);
        return $favorits;
    }

    //Cart functions

    //Add new product to Cart function

    public function addToCart(Request $request)
    {
        if(isset($request->delete))
        {
            OrderDetail::where('product_id',$request->product_id)
                ->where('user_id',Auth::user()->id)
                ->where('status',0)
                ->delete();

            $Cart = OrderDetail::where('user_id',Auth::user()->id)
                ->where('order_id',0)
                ->get();
            return response([
                'code' => 200,
                'status' => true,
                'Message' => 'product deleted from Cart',
                'Cart' =>$Cart
                ]);

        }
        $Cart_product = OrderDetail::where('product_id',$request->product_id)
            ->where('user_id',Auth::user()->id)
            ->where('size',$request->size)
            ->first();
        if(!$Cart_product)
        {
            $product = new OrderDetail();
            $product->product_id = $request->product_id;
            $product->product_name = $request->product_name;
            $product->order_id = 0;
            $product->user_id = Auth::user()->id;
            $product->quantity = $request->quantity;
            $product->price = $request->price;
            $product->size = $request->size;
            $product->status = 'pending';
            $product->total_price = (int)$request->price * (int)$request->quantity;
            $product->save();

        }
        else
        {
            $Cart_product->quantity += (int)$request->quantity;
            $Cart_product->total_price = (int)$Cart_product->price * (int)$Cart_product->quantity;
            $Cart_product->save();


        }
        $Cart = OrderDetail::where('user_id',Auth::user()->id)
            ->where('order_id',0)
            ->get();
        return response([
            'code' => 200,
            'status' => true,
            'Message' => 'added to Cart',
            'Cart' =>$Cart
        ]);
    }

    //delete product from Cart
    public function DeleteFromCart(Request $request)
    {
        if(isset($request->product_id))
        {
            OrderDetail::where('product_id',$request->product_id)
                ->where('size',$request->size)
                ->where('user_id',Auth::user()->id)
                ->where('status',0)
                ->delete();
        }
        else
        {
            OrderDetail::where('user_id',Auth::user()->id)
                ->where('status',0)
                ->delete();

        }
        $Cart = OrderDetail::where('user_id',Auth::user()->id)
            ->where('order_id',0)
            ->get();

        return response([
            'code' => 200,
            'status' => true,
            'message' => 'Cart empty now',
            'Cart' => $Cart
        ]);

    }
    public function GetCart()
    {
        $Cart = OrderDetail::where('user_id',Auth::user()->id)
            ->where('order_id',0)
            ->get();

        $data = [];
        $final_data = [];
        foreach ($Cart as $item)
        {
            $data['id']= $item['id'];
            $data['product_id']= $item['product_id'];
            $data['product_name']= $item['product_name'];
            $data['price']= $item['price'];
            $data['size']= $item['size'];
            $data['quantity']= $item['quantity'];
            $data['total_price']= $item['total_price'];
            $final_data[] = $data;
        }
        $total_amount = OrderDetail::where('user_id',Auth::User()->id)
            ->where('order_id',0)
            ->sum('total_price');
        $shippingTimes = ShippingTime::all();
        $points = Auth::User()->points;
        return response([
            'code' => 200,
            'status' => true,
            'message' => 'Cart Components',
            'total_price' => $total_amount,
            'points' => $points,
            'shipping' => 5,
            'shipping_times' => $shippingTimes,
            'tax' => 5,
            'Cart' => $final_data
        ]);

    }

    public function UpdateCart(Request $request)
    {
        $products = json_decode($request->product_list,true);
        foreach ($products as $product)
        {
            OrderDetail::where('product_id',$product['product_id'])
                ->where('user_id',Auth::user()->id)
                ->where('order_id',0)
                ->where('size',$product['size'])
                ->update([
                    'quantity' => $product['quantity'],
                    'price' => $product['price'],
                    'total_price' => (int)$product['quantity'] * (int)$product['price']
                ]);
        }
        return $this->GetCart();
    }
}
