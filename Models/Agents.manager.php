<?php

require_once "Models/Model.php";

class AgentsManager extends Model {
  
  public function  getAllAgents() {
    $req = "
      SELECT a.id, a.lastname, a.firstname, a.birthDate, a.codeName, a.nationality, a.imageUrl, r.level, GROUP_CONCAT(s.skill) AS skills
      FROM Agents a
      LEFT JOIN Roles r ON r.id = a.roleId
      LEFT JOIN Skills s ON s.id IN (SELECT GROUP_CONCAT(ags.skillsId) FROM Agents_Skills ags WHERE ags.agentsId = a.id GROUP BY ags.skillsId)
      GROUP BY a.id
    ";
    $stmt = $this->getBdd()->prepare($req);
    $stmt->execute();
    $agents = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return $agents;
  }

  public function  getAgentById($id) {
    $req = "
      SELECT a.id, a.lastname, a.firstname, a.birthDate, a.codeName, a.nationality, a.imageUrl, r.level, GROUP_CONCAT(s.skill) AS skills
      FROM Agents a
      LEFT JOIN Roles r ON r.id = a.roleId
      LEFT JOIN Skills s ON s.id IN (SELECT GROUP_CONCAT(ags.skillsId) FROM Agents_Skills ags WHERE ags.agentsId = a.id GROUP BY ags.skillsId)
      WHERE a.id = :idAgent
      GROUP BY a.id
    ";
    $stmt = $this->getBdd()->prepare($req);
    $stmt->bindValue(':idAgent', $id, PDO::PARAM_INT);
    $stmt->execute();
    $agent = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return $agent;
  }

  public function deleteAgentById($id) {
    $req = "DELETE FROM Agents WHERE id = :idAgent";
    $stmt = $this->getBdd()->prepare($req);
    $stmt->bindValue(':idAgent', $id, PDO::PARAM_INT);
    $stmt->execute();
    $row = $stmt->rowCount();
    $stmt->closeCursor();
    return $row;
  }

  public function createAgent($Agent) {
    $req = "
      INSERT INTO Agents (lastname, firstname, birthDate, codeName, nationality, imageUrl, roleId)
      VALUES(:lastname, :firstname, :birthDate, :codeName, :nationality, :imageUrl, :roleId)
    ";
    $stmt = $this->getBdd()->prepare($req);
    $stmt->bindValue(':lastname', $Agent->getLastname(), PDO::PARAM_STR);
    $stmt->bindValue(':firstname', $Agent->getFirstname(), PDO::PARAM_STR);
    $stmt->bindValue(':birthDate', $Agent->getBirthDate(), PDO::PARAM_STR);
    $stmt->bindValue(':codeName', $Agent->getCodeName(), PDO::PARAM_STR);
    $stmt->bindValue(':nationality', $Agent->getNationality(), PDO::PARAM_STR);
    $stmt->bindValue(':imageUrl', $Agent->getImageUrl(), PDO::PARAM_STR);
    $stmt->bindValue(':roleId', $Agent->getRoleId(), PDO::PARAM_INT);
    $stmt->execute();
    $stmt->closeCursor();
    return $this->getBDD()->lastInsertId();
  }

  public function addAgentSkills($Agent) {
    foreach(explode(',', $Agent->getSkills()) as $value) {
      $req = "
        INSERT INTO Agents_Skills (agentsId, skillsId)
        VALUES (:agentsId, :skillsId)
      ";
      $stmt = $this->getBdd()->prepare($req);
      $stmt->bindValue(':agentsId', $Agent->getId(), PDO::PARAM_INT);
      $stmt->bindValue(':skillsId', $value, PDO::PARAM_INT);
      $stmt->execute();
      $stmt->closeCursor();
    }
  }

}

