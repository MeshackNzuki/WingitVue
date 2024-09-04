<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Inventory\Category;
use App\Http\Requests\Category\StoreCategoryRequest;
use App\Http\Requests\Category\UpdateCategoryRequest;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Str;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::where("user_id", auth()->id())->get();

        return $this->ResSuccess($categories);
    }

    public function store(StoreCategoryRequest $request)
    {
        $category = Category::create([
            "user_id" => auth()->id(),
            "name" => $request->name,
            "slug" => Str::slug($request->name)
        ]);

        return $this->ResSuccess($category, 'Category has been created!');
    }

    public function show(Category $category)
    {
        return $this->ResSuccess($category);
    }

    public function update(UpdateCategoryRequest $request, Category $category)
    {
        $category->update([
            "name" => $request->name,
            "slug" => Str::slug($request->name)
        ]);

        return $this->ResSuccess($category, 'Category has been updated!');
    }

    public function destroy(Category $category)
    {
        $category->delete();

        return $this->ResSuccess(null, 'Category has been deleted!');
    }
}
