<?php

namespace App\Interfaces;

Interface InterfaceRepository
{
  public function create(array $data);
  public function delete(int $id);
}