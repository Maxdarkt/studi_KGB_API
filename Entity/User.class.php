<?php

class User {
  private $id = null;
  private $lastname = null;
  private $firstname = null;
  private $birthDate = null;
  private $codeName = null;
  private $nationality = null;
  private $imageUrl = null;

  public function getId(): int {
    return $this->id;
  }

  public function setId(string $id): self {
    $this->id = $id;

    return $this;
  }

  public function getLastname(): string {
    return $this->lastname;
  }

  public function setLastname(string $lastname): self {
    $this->lastname = $lastname;

    return $this;
  }

  public function getFirstname(): string {
    return $this->firstname;
  }

  public function setFirstname(string $firstname): self {
    $this->firstname = $firstname;

    return $this;
  }

  public function getBirthDate(): string {
    return $this->birthDate;
  }

  public function setBirthDate(string $birthDate): self {
    $this->birthDate = $birthDate;

    return $this;
  }

  public function getCodeName(): string {
    return $this->codeName;
  }

  public function setCodeName(string $codeName): self {
    $this->codeName = $codeName;

    return $this;
  }

  public function getNationality(): string {
    return $this->nationality;
  }

  public function setNationality(string $nationality): self {
    $this->nationality = $nationality;

    return $this;
  }

  public function getImageUrl(): string {
    return $this->imageUrl;
  }

  public function setImageUrl(string $imageUrl): self {
    $this->imageUrl = $imageUrl;

    return $this;
  }

}