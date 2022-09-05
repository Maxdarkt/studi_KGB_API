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

  public function  findAgentById($id) {
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

  public function deleteOneAgent($id) {
    $req = "DELETE FROM Agents WHERE id = :idAgent";
    $stmt = $this->getBdd()->prepare($req);
    $stmt->bindValue(':idAgent', $id, PDO::PARAM_INT);
    $stmt->execute();
    $stmt->closeCursor();
  }

}

