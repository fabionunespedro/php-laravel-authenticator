<?php

namespace App\Repositories;

use App\Interfaces\InterfaceRepository;
use App\Models\User;

class UserRepository implements InterfaceRepository
{
  public function create(array $data)
  {
    return User::create($data);
  }

  public function delete(int $id)
  {
    $user = User::find($id);
    return $user 
    ? $user->delete() 
    : false;
  }
}