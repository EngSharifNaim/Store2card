<?php

namespace App\Http\Controllers;

use App\Market;
use App\Product;
use App\User;
use Carbon\Carbon;
use http\Env\Response;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkauth($key)
    {
        if($key != '$2y$10$juGL/PPtb9t5pFgWN8SECuSkKddo2dzhsElzK0TXbHsQvoQPCKO9u')
        {
            return response()->json([
                'code' => '401',
                'status' => 'failed',
                'message' => '401 Unauthorized',
                'product' => []
            ]);

        }

    }
    public function index()
    {
        $products = Product::where('deleted_at',NULL)->get();
        return view('dashboard.products.index',compact('products'));
    }
    public function show($category)
    {
        $products = Product::where('deleted_at',NULL)
            ->where('category_id',$category)
            ->get();
        return view('dashboard.products.index',compact('products'));
    }
    public function offers()
    {
        $products = Product::where('deleted_at',NULL)->where('offer',1)->paginate(12);
        return view('dashboard.products.index',compact('products'));
    }
    public function get_products($id='',Request $request)
    {
       if($this->checkauth($request->header('Authorization')))
           return $this->checkauth($request->header('Authorization'));


        $data = [];
        if($id == '')
        {
            $products = Product::where('state','فعال')->with('market')->get();
        }
        else
        {
            $products = Product::where('state','فعال')
                ->where('market_id',$id)
                ->get();
        }

        if(count($products) > 0)
        {
            $data['code'] = '200';
            $data['status'] = 'success';
            $data['message'] = '';
            $data['products'] = $products;
            return $data;
        }
        else
        {
            $data['code'] = '300';
            $data['status'] = 'failed';
            $data['message'] = 'Empty product list';
            $data['products'] = $products;
            return $data;

        }

    }
    public function get_product($id,Request $request)
    {
        if($this->checkauth($request->header('Authorization')))
            return $this->checkauth($request->header('Authorization'));

        $data = [];
            $product = Product::where('id',$id)->first();
            $others = Product::inRandomOrder()
                ->where('id','<>',$id)
                ->where('category_id',$product->category_id)
                ->where('market_id',$product->market_id)
                ->get();
            return response()->json([
                'code' => '200',
                'status' => 'success',
                'message' => 'OK',
                'product' => $product,
                'others' => $others
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
        $product = new Product();
        $product->name = $request->name;
        $product->category_id = $request->category;
        $product->price = $request->price;
        if(isset($request->offer))
        $product->offer = 1;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images/products');
            $image->move($destinationPath, $name);
            $product->image = $name;
        }
        $product->save();
        $message = 'تم اضافة منتج جديد بنجاح';
        return view('dashboard.products.create',compact('message'));

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::where('id',$id)->first();
        return view('dashboard.products.edit',compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $product = Product::where('id',$request->product_id)->first();
        $product->name = $request->name;
        $product->category_id = $request->category;
        $product->price = $request->price;
        if(isset($request->offer))
            $product->offer = 1;
        else
            $product->offer = 0;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images/products');
            $image->move($destinationPath, $name);
            $product->image = $name;
        }
        $product->save();
        $message = 'تم تعديل منتج جديد بنجاح';
        return view('dashboard.products.edit',compact('message','product'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if($this->checkauth($request->header('Authorization')))
            return $this->checkauth($request->header('Authorization'));

        $product = Product::where('id',$request->product_id)->first();
        $product->deleted_at = Carbon::now();
        if($product->save())
        {
            return response()->json([
                'code' => '200',
                'status' => 'success',
                'message' => 'Product deleted successfully',
                'product' => $product
            ]);
        }
        else
        {
            return false;
        }
    }
}
