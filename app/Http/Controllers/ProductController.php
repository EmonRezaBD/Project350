<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(){
        return view('home', ['page_title'=> 'Home']);
    }
    
    public function show($id){
        return view('product', ['page_title' => 'Product ID - ' . $id, 'product_id' => $id]);
    }
}
