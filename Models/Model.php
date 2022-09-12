<?php
abstract class Model {
  private static $pdo;

  private static function setBdd() {
    self::$pdo = new PDO("mysql:host=127.0.0.1;dbname=missions_KGB;charset=utf8", "root", "");
    self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
  }

  protected function getBdd(){
    if(self::$pdo === null) {
      self::setBdd();
    }
    return self::$pdo;
  }

  public static function sendJSON($response, $codeStatus) {
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json");
    http_response_code($codeStatus);
    echo json_encode($response);
  }

}