<?php

namespace App\Http\Controllers\Inventory\Product;

use App\Http\Controllers\Controller;
use App\Http\Requests\Product\StoreProductRequest;
use App\Http\Requests\Product\UpdateProductRequest;
use App\Models\Inventory\Category;
use App\Models\Inventory\Product;
use App\Models\Inventory\Unit;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Http\Request;
use Picqer\Barcode\BarcodeGeneratorHTML;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ProductController extends Controller{


    /**
     * Display a listing of the products.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        $products = Product::where("user_id", auth()->id())->get();

        return $this->ResSuccess($products, 'Products retrieved successfully.');
    }

    /**
     * Show the form for creating a new product.
     *
     * @return JsonResponse
     */
    public function create(Request $request): JsonResponse
    {
        $categories = Category::where("user_id", auth()->id())->get(['id', 'name']);
        $units = Unit::where("user_id", auth()->id())->get(['id', 'name']);

        if ($request->has('category')) {
            $categories = Category::where("user_id", auth()->id())
                ->whereSlug($request->get('category'))
                ->get();
        }

        if ($request->has('unit')) {
            $units = Unit::where("user_id", auth()->id())
                ->whereSlug($request->get('unit'))
                ->get();
        }

        return $this->ResSuccess([
            'categories' => $categories,
            'units' => $units
        ], 'Product creation data retrieved successfully.');
    }

    /**
     * Store a newly created product.
     *
     * @param StoreProductRequest $request
     * @return JsonResponse
     */
    public function store(StoreProductRequest $request): JsonResponse
    {
        $image = "";
        if ($request->hasFile('product_image')) {
            $image = $request->file('product_image')->store('products', 'public');
        }

        Product::create([
            "code" => IdGenerator::generate([
                'table' => 'products',
                'field' => 'code',
                'length' => 4,
                'prefix' => 'PC'
            ]),
            'product_image' => $image,
            'name' => $request->name,
            'category_id' => $request->category_id,
            'unit_id' => $request->unit_id,
            'quantity' => $request->quantity,
            'buying_price' => $request->buying_price,
            'selling_price' => $request->selling_price,
            'quantity_alert' => $request->quantity_alert,
            'tax' => $request->tax,
            'tax_type' => $request->tax_type,
            'notes' => $request->notes,
            "user_id" => auth()->id(),
            "slug" => Str::slug($request->name, '-'),
            "uuid" => Str::uuid()
        ]);

        return $this->ResSuccess([], 'Product has been created successfully.');
    }

    /**
     * Display the specified product.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function show($uuid): JsonResponse
    {
        $product = Product::where("uuid", $uuid)->firstOrFail();
        $generator = new BarcodeGeneratorHTML();
        $barcode = $generator->getBarcode($product->code, $generator::TYPE_CODE_128);

        return $this->ResSuccess([
            'product' => $product,
            'barcode' => $barcode
        ], 'Product details retrieved successfully.');
    }

    /**
     * Show the form for editing the specified product.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function edit($uuid): JsonResponse
    {
        $product = Product::where("uuid", $uuid)->firstOrFail();
        $categories = Category::where("user_id", auth()->id())->get();
        $units = Unit::where("user_id", auth()->id())->get();

        return $this->ResSuccess([
            'categories' => $categories,
            'units' => $units,
            'product' => $product
        ], 'Product edit data retrieved successfully.');
    }

    /**
     * Update the specified product.
     *
     * @param UpdateProductRequest $request
     * @param string $uuid
     * @return JsonResponse
     */
    public function update(UpdateProductRequest $request, $uuid): JsonResponse
    {
        $product = Product::where("uuid", $uuid)->firstOrFail();
        $product->update($request->except('product_image'));

        $image = $product->product_image;
        if ($request->hasFile('product_image')) {
            if ($product->product_image) {
                unlink(public_path('storage/') . $product->product_image);
            }
            $image = $request->file('product_image')->store('products', 'public');
        }

        $product->name = $request->name;
        $product->slug = Str::slug($request->name, '-');
        $product->category_id = $request->category_id;
        $product->unit_id = $request->unit_id;
        $product->quantity = $request->quantity;
        $product->buying_price = $request->buying_price;
        $product->selling_price = $request->selling_price;
        $product->quantity_alert = $request->quantity_alert;
        $product->tax = $request->tax;
        $product->tax_type = $request->tax_type;
        $product->notes = $request->notes;
        $product->product_image = $image;
        $product->save();

        return $this->ResSuccess([], 'Product has been updated successfully.');
    }

    /**
     * Remove the specified product.
     *
     * @param string $uuid
     * @return JsonResponse
     */
    public function destroy($uuid): JsonResponse
    {
        $product = Product::where("uuid", $uuid)->firstOrFail();
        if ($product->product_image) {
            if (file_exists(public_path('storage/') . $product->product_image)) {
                unlink(public_path('storage/') . $product->product_image);
            }
        }

        $product->delete();

        return $this->ResSuccess([], 'Product has been deleted successfully.');
    }
}
