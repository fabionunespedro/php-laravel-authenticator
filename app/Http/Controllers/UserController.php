<?php

namespace App\Http\Controllers;

use App\Http\Requests\CheckDataRequest;
use App\Services\UserService;
use App\Http\Requests\StorePostRequest;
class UserController extends Controller
{
  protected UserService $service;

  public function __construct(UserService $service)
  {
    $this->service = $service;
  }

  public function store(StorePostRequest $request)
  {
    $data = $request->validated();
    try {
      $user = $this->service->create($data);
      return response()->json($user, 201);
    } catch (\Exception $e) {
      return response()->json([
        'error' => 'could not create a user.',
        'message' => $e->getMessage()
      ], 500);
    }

    return response()->json($user, 201);
  }

  public function checkData(CheckDataRequest $request)
  {
    return response()->json([
      'id' => $request->user()->id,
      'name' => $request->user()->name,
      'email' => $request->user()->email,
      'password' => $request->user()->password,
    ]);
  }
}
