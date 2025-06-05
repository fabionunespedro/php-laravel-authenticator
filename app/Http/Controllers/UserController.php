<?php

namespace App\Http\Controllers;

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
      $user = $this->service->create($data);

      return response()->json($user, 201);
    }
}