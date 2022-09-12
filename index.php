<?php

define("URL", str_replace("index.php", "", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]"));


require_once "Controllers/Agents.ctrl.php";
$agentsCtrl = new AgentsController();

try {
  $url = explode("/", filter_var($_SERVER['REQUEST_URI'], FILTER_SANITIZE_URL));
  array_shift($url);

  $method = $_SERVER['REQUEST_METHOD'];

  if(empty($url[0]) || $url[0] !== "api" || empty($url[1])) {
    throw new Exception("No resources available at this url !");
  } else {
    switch($url[1]){
      case "agents":
        if(empty($url[2]) && $method === 'GET') {
          $agentsCtrl->displayAllAgents(); 
        } elseif((int)$url[2] && $method === 'GET') {
          $agentsCtrl->displayOneAgent($url[2]);
        } elseif((int)$url[2] && $method === 'DELETE') {
          $agentsCtrl->removeOneAgent($url[2]);
        } elseif($url[2] === 'newAgent' && $method === 'POST') {
          $agentsCtrl->newAgent();
        } elseif($url[2] === 'modifyAgent' && (int)$url[3] && $method === 'POST') {
          $agentsCtrl->modifyAgent((int)$url[3]);
        } else {
          throw new Exception("No resources available at this url !");
        }
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
  // echo "<pre>";
  // print_r($url);
  // echo "</pre>";

  // echo "La page demandée est : " . $_SERVER['REQUEST_URI'];
  // ***** End test dev ***** //

} catch(Exception $e) {
  $message = $e->getMessage();
  http_response_code(401);
  echo json_encode($message);
  // echo "<a href='" . URL . "/back/login'>Login</a>";
}