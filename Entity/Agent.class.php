<?php

require_once "Entity/User.class.php";

class Agent extends User {

  private $roleId = null;
  private $skills = null;

  public function getRoleId(): ?string {
    return $this->roleId;
  }

  public function setRoleId(string $roleId): self {
    $this->roleId = $roleId;

    return $this;
  }
  public function getSkills(): ?string {
    return $this->skills;
  }

  public function setSkills(?string $skills): self {
    $this->skills = $skills;

    return $this;
  }

}