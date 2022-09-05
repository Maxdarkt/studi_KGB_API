<?php

require_once "Helpers/Security.class.php";
require_once "Models/Agents.manager.php";
require_once "Entity/Agent.class.php";

class AgentsController {

  private $AgentsManager;

  public function __construct() {
    $this->AgentsManager = new AgentsManager();
  }

  public function displayAllAgents() {
    // we call the function to the manager
    $agents = $this->AgentsManager->getAllAgents();
    // we check if the return is empty
    if(empty($agents)) {
      $response = [
        'message' => 'no data found'
      ];
  
      http_response_code(404);
      echo json_encode($response);
      return;
    }
    // we send the data
    $message = "The agents have been found.";
    $response = [
      'message' => $message,
      'data' => $agents
    ];
    http_response_code(200);
    echo json_encode($response);
    return;
    // echo "<pre>";
    // print_r($agents);
    // echo "</pre>";
  }

  public function displayOneAgent($id) {
    // security
    $agentId = (int)Security::secureHTML($id);
    // we call the function to the manager
    $agent = $this->AgentsManager->findAgentById($agentId);
    // we check if the return is empty
    if(empty($agent)) {
      $response = [
        'message' => 'no data found'
      ];
  
      http_response_code(404);
      echo json_encode($response);
      return;
    }

    // we send the data
    $message = "The agent has been found.";
    $response = [
      'message' => $message,
      'data' => $agent
    ];
    http_response_code(200);
    echo json_encode($response);
    return;
  }

  public function removeOneAgent($id) {
    // security
    $agentId = (int)Security::secureHTML($id);
    // we call the function to the manager
    $isAgentExist = $this->AgentsManager->findAgentById($agentId);
    if(count($isAgentExist) === 0) {
      // we send the data
      $message = "The agent has not found.";
      $response = [
        'message' => $message,
      ];
      http_response_code(404);
      echo json_encode($response);
      return;
    }
    // we call the function to the manager
    $this->AgentsManager->deleteOneAgent($agentId);

    // we send the data
    $message = "The agent has been deleted.";
    $response = [
      'message' => $message
    ];
    http_response_code(200);
    echo json_encode($response);
    return;
  }

  public function createAgent() {
    // ...
  }
  

}