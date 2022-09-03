<?php

define("URL", str_replace("index.php", "", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]"));

try {
  $url = explode("/", filter_var($_SERVER['REQUEST_URI'], FILTER_SANITIZE_URL));
  array_shift($url);

  if(empty($url[0]) || $url[0] !== "api" || empty($url[1])) {
    throw new Exception("No resources available at this url !");
  } else {
    switch($url[1]){
      case "agents":
        echo "agents";
        break;
      case "targets":
        echo "targets";
        break;
      case "missions":
        echo "missions";
        break;
      case "contacts":
        echo "contacts";
        break;
      case "stakeouts":
        echo "stakesouts";
        break;
      case "manage":
        echo "manage";
        break;
      default:  throw new Exception("No resources available at this url !");
    }
  }

  // ***** test dev ***** //
  echo "<pre>";
  print_r($url);
  echo "</pre>";

  echo "La page demandée est : " . $_SERVER['REQUEST_URI'];
  // ***** End test dev ***** //

} catch(Exception $e) {
  $message = $e->getMessage();
  http_response_code(404);
  echo json_encode($message);
  // echo "<a href='" . URL . "/back/login'>Login</a>";
}