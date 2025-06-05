<?php

namespace App\Services;

use App\Repositories\UserRepository;

class UserService 
{
  protected UserRepository $repository;

  public function __construct(UserRepository $repository)
  {
    $this->repository = $repository;
  }

  public function create(array $data)
  {
    return $this->repository->create($data);
  }

  public function delete(int $id)
  {
    return $this->repository->delete($id);
  }
}