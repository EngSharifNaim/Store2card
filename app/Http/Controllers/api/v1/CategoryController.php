<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Market;
use App\Product;
use Illuminate\Http\Request;
use App\Category;
use DB;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if(isset($request->market_id))
        {
            if(!Category::where('market_id',$request->market_id)->first())
            {
                return response([
                    'code' => 404,
                    'status' =>false,
                    'message' => 'market has no categories'
                ]);
            }
            if(Market::where('id',$request->market_id)->first()->state)
            {
                $first = Category::where('market_id',$request->market_id)
                    ->orderBy('id','ASC')
                    ->first();
                $categoris = Category::where('market_id',$request->market_id)
                    ->orderBy('id','ASC')
                    ->get();

                    $products = DB::table('products')
                        ->where('category_id',$first->id)
                        ->select('id','name','price','price_list','image','category_id')
                        ->paginate(10);

                    $total_count =  DB::table('products')
                        ->where('category_id',$request->category_id)
                        ->count();

                    foreach ($products as $product)
                    {
                        $pro_data['id'] = $product->id;
                        $pro_data['name'] = $product->name;
                        $pro_data['price'] = $product->price;
                        $pro_data['price_list'] = json_decode($product->price_list,true);
                        $pro_data['image'] = $product->image;
                        $pro_data['category_id'] = $product->category_id;
//                        if(in_array($product->id,json_decode(Auth::user()->favorits,true)))
//                        {
//                            $pro_data['favorit'] = true;
//                        }
//                        else
//                        {
//                            $pro_data['favorit'] = false;
//                        }
                        $final_data[] = $pro_data;
                    }
                    if(count($products) > 0)
                    {
                        $data['code'] = '200';
                        $data['status'] = true;
                        $data['message'] = 'Categories list ';
                        $data['pagination']['total_count'] = $total_count;
                        $data['pagination']['item_per_page'] = 10;
                        if(isset($request->page))
                            $data['pagination']['current_page'] = $request->page ;
                        else
                            $data['pagination']['current_page'] = 1;

                        $data['pagination']['next_page'] = $data['pagination']['current_page'] + 1;
                        $data['pagination']['prev_page'] = $data['pagination']['current_page'] - 1;

                        if($total_count <= 10)
                        {
                            $data['pagination']['total_pages'] = 1;

                        }
                        else
                        {
                            $data['pagination']['total_pages'] = floor($total_count/10) + 1;
                        }

                        $data['data'] = $final_data;
                        $data['category'] = $categoris;

                    return response($data);
                }

            }

        }
        else
        {
            return response([
                'code' => 404,
                'status' => false,
                'message' => 'invalid market',
            ]);

        }
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
        if(!Market::where('id',$request->market_id)->first())
        {
            return response()->json([
                'code' => '404',
                'status' => false,
                'message' => 'Market dos not exist',

            ]);

        }
        if(Category::where('name',$request->name)->where('market_id',$request->market_id)->first())
        {
            return response()->json([
                'code' => '409',
                'status' => false,
                'message' => 'Category name is exist',

            ]);

        }
        $category = new Category();
        $category->name = $request->name;
        $category->market_id = $request->market_id;
        $category->description = $request->description;
        $category->parent = 0;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images/products');
            $image->move($destinationPath, $name);
            $category->image = $name;
        }

        if($category->save())
        {
            return response()->json([
                'code' => '200',
                'status' => true,
                'message' => 'Category added successfully',
                'category' => $category

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
    public function update(Request $request)
    {

        $category = Category::where('id',$request->category_id)->first();
        if($category)
        {
            if(isset($request->name))
            {
                $category->name = $request->name;
            }
            if(isset($request->description))
            {
                $category->description = $request->description;
            }

            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $name = time().'.'.$image->getClientOriginalExtension();
                $destinationPath = public_path('/images/products');
                $image->move($destinationPath, $name);
                $category->image = $name;
            }

            if($category->save())
            {
                return response()->json([
                    'code' => '200',
                    'status' => true,
                    'message' => 'Category updated successfully',
                    'category' => $category

                ]);
            }

        }
        else
        {
            return response()->json([
                'code' => '404',
                'status' => false,
                'message' => 'Category not found',
            ]);

        }


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::where('id',$id)->first();
        $name = $category->name;
        if(Product::where('category_id',$name)->first())
        {
            return response([
                'code' => 300,
                'status' => false,
                'message' => 'لا يمكن حذف التصنيف لأنه يحتوى على منتجات'

            ]);

        }
        if(Category::where('id',$id)->delete())
        {
            return response([
                'code' => 200,
                'status' => true,
                'message' => 'تم حذف التصنيف بنجاح',
                'category_id' => $id

            ]);
        }

    }

}
