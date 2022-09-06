<?php 

function addImage($file, $dir) {
  try {
    // we check if the file exists
    if(!isset($file['name']) || empty($file['name'])) {
      throw new Exception('An image is required.');
    }
    // we check if the directory exists
    if(!file_exists($dir)) {
      mkdir($dir, 0777);
    }

    $extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $filename = time() .  "_" . $file['name'];
    $target_file = $dir . $filename;

    if(!getimagesize($file['tmp_name'])) {
      throw new Exception('The file is not an image.');
    }
    if($extension !== 'jpg' && $extension !== 'jpeg' && $extension !== 'png') {
      throw new Exception('The extension is incorrect.');
    }
    if(file_exists($target_file)) {
      throw new Exception('The file already exists.');
    }
    if($file['size'] > 500000) {
      throw new Exception('The file is too large.');
    }
    if(!move_uploaded_file($file['tmp_name'], $target_file)) {
      throw new Exception('The file could not be saved.');
    } else {
      return $filename;
    }

  } catch(Exception $e) {
    $message = $e->getMessage();
    http_response_code(401);
    echo json_encode($message);
    return;
  }
  
}