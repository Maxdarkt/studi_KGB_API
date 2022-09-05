<?php

require_once "Entity/User.class.php";

class Agent extends User {

  private $roleId = null;

  public function getRoleId(): string {
    return $this->roleId;
  }

  public function setRoleId(string $roleId): self {
    $this->roleId = $roleId;

    return $this;
  }

}