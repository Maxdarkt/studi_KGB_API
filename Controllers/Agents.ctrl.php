<?php

require_once "Helpers/Security.class.php";
require_once "Models/Agents.manager.php";
require_once "Entity/Agent.class.php";
require_once "Helpers/images.utils.php";

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
    Model::sendJSON($response, 200);
    return;
  }

  public function displayOneAgent($id) {
    // security
    $agentId = (int)Security::secureHTML($id);
    // we call the function to the manager
    $agent = $this->AgentsManager->getAgentById($agentId);
    // we check if the return is empty
    if(empty($agent)) {
      $response = [
        'message' => 'no data found'
      ];
      Model::sendJSON($response, 404);
      return;
    }

    // we send the data
    $message = "The agent has been found.";
    $response = [
      'message' => $message,
      'data' => $agent
    ];
    Model::sendJSON($response, 200);
    return;
  }

  public function removeOneAgent($id) {
    // security
    $agentId = (int)Security::secureHTML($id);
    // we call the function to the manager
    $isAgentExist = $this->AgentsManager->getAgentById($agentId);
    if(!$isAgentExist) {
      // we send the data
      $message = "The agent has not found.";
      $response = [
        'message' => $message,
      ];
      Model::sendJSON($response, 404);
      return;
    }
    // we call the function to the manager
    $row = $this->AgentsManager->deleteAgentById($agentId);

    // if no agent has deleted
    if ($row === 0) {
      $message = "The agent was found but the deletion failed.";
      $response = [
        'message' => $message,
      ];
      Model::sendJSON($response, 404);
      return;
    }
    // if an agent has been deleted and imageUrl !== null
    if($isAgentExist['imageUrl'] !== null) {
      $filename = explode('Public/images/', $isAgentExist['imageUrl']);
      unlink("Public/images/" . $filename[1]);
    }

    // we send the data
    $message = "The agent has been deleted.";
    $response = [
      'message' => $message,
      'row' => $row
    ];
    Model::sendJSON($response, 200);
    return;
  }

  public function newAgent() {
    // we declare variables (data)
    $lastname = $_POST['lastname'] ? Security::secureHTML($_POST['lastname']) : null;
    $firstname = $_POST['firstname'] ? Security::secureHTML($_POST['firstname']) : null;
    $birthDate = $_POST['birthDate'] ? Security::secureHTML($_POST['birthDate']) : null;
    $codeName = $_POST['codeName'] ? Security::secureHTML($_POST['codeName']) : null;
    $nationality = $_POST['nationality'] ? Security::secureHTML($_POST['nationality']) : null;
    $roleId = $_POST['roleId'] ? Security::secureHTML($_POST['roleId']) : null;
    $skills = $_POST['skills'] ? Security::secureHTML($_POST['skills']) : null;
    // we check all datas
    if($lastname === null || $firstname === null || $birthDate === null || $codeName === null || $nationality === null || $roleId === null) {
      $message = "A data is missing or invalid.";
      Model::sendJSON($message, 401);
    }

    // if a file is uploaded
    if($_FILES && $_FILES['image']['size'] > 0) {
      $directory = "Public/images/";
      $filename = addImage($_FILES['image'], $directory);
      $imageUrl = URL . '/' . $directory . $filename;
    } else {
      $imageUrl = null;
    }

    // we create a class Agent
    $Agent = new Agent();
    $Agent->setLastname($lastname);
    $Agent->setFirstName($firstname);
    $Agent->setbirthDate($birthDate);
    $Agent->setCodeName($codeName);
    $Agent->setNationality($nationality);
    $Agent->setImageUrl($imageUrl);
    $Agent->setRoleId($roleId);
    $Agent->setSkills($skills);
    
    // create a new Agent
    $agentId = $this->AgentsManager->createAgent($Agent);

    // we define the id
    $Agent->setId($agentId);

    //create the agent's skills
    if($Agent->getSkills()) {
      $this->AgentsManager->addManySkillsToAgent($Agent);
    }

    // we retrieve the Agent object
    $agent = $this->AgentsManager->getAgentById($agentId);

    // we send the data
    $message = "The agent has been created.";
    $response = [
      'message' => $message,
      'Agent' => $agent
    ];
    Model::sendJSON($response, 200);
    return;
  }


  public function modifyAgent($id) {
    // security
    $agentId = (int)Security::secureHTML($id);
    // we call the function to the manager
    $agentExist = $this->AgentsManager->getAgentById($agentId);
    if(!$agentExist) {
      // we send the data
      $message = "The agent has not found.";
      $response = [
        'message' => $message,
      ];
      Model::sendJSON($response, 404);
      return;
    }

    // we declare variables (data)
    $lastname = $_POST['lastname'] ? Security::secureHTML($_POST['lastname']) : $agentExist['lastname'];
    $firstname = $_POST['firstname'] ? Security::secureHTML($_POST['firstname']) : $agentExist['firstname'];
    $birthDate = $_POST['birthDate'] ? Security::secureHTML($_POST['birthDate']) : $agentExist['birthDate'];
    $codeName = $_POST['codeName'] ? Security::secureHTML($_POST['codeName']) : $agentExist['codeName'];
    $nationality = $_POST['nationality'] ? Security::secureHTML($_POST['nationality']) : $agentExist['nationality'];
    $roleId = $_POST['roleId'] ? Security::secureHTML($_POST['roleId']) : $agentExist['roleId'];

    // if a file is uploaded
    if($_FILES['image']['size'] > 0) {
      // if an image is already saved
      if($agentExist['imageUrl'] !== null) {
        $filename = explode('Public/images/', $agentExist['imageUrl']);
        unlink("Public/images/" . $filename[1]);
      }
      $directory = "Public/images/";
      $filename = addImage($_FILES['image'], $directory);
      $imageUrl = URL . '/' . $directory . $filename;
    } else {
      $imageUrl = $agentExist['imageUrl'] ?? null;
    }
    // we create a class Agent
    $Agent = new Agent();
    $Agent->setId($agentId);
    $Agent->setLastname($lastname);
    $Agent->setFirstName($firstname);
    $Agent->setbirthDate($birthDate);
    $Agent->setCodeName($codeName);
    $Agent->setNationality($nationality);
    $Agent->setImageUrl($imageUrl);
    $Agent->setRoleId($roleId);

    // we saved the agent
    $this->AgentsManager->updateAgent($Agent);

    // we update the agent's skills
    if(!empty($_POST['skills'])) {
      $oldSkills = $this->AgentsManager->getSkills($agentId);
      // we declare array
      $oldSkillsArray = explode(',', $oldSkills);
      $newSkillsArray = explode(',', $_POST['skills']);

      // we compare newSkillsArray vs oldSkillsArray
      foreach($newSkillsArray as $value) {
        // if the skill does not exist, it is added
        if(array_search($value, $oldSkillsArray) === false) {
          $this->AgentsManager->addOneSkillToAgent($agentId, $value);
        }
      }
      $row = 0;
      // we compare oldSkillsArray vs newSkillsArray
      foreach($oldSkillsArray as $value) {
        // if the skill does not exist, it is deleted
        if(array_search($value, $newSkillsArray) === false) {
          $row = $this->AgentsManager->deleteOneSkillToAgent($agentId, $value);
          echo "delete" . $value . "<br/>";
        }
      }
      echo $row;
    }

    // we retrieve agent
    $agent = $this->AgentsManager->getAgentById($agentId);

    // we send the data
    $message = "The agent has been uploaded.";
    $response = [
      'message' => $message,
      'Agent' => $agent
    ];
    Model::sendJSON($response, 200);
    return;
  }
  
}