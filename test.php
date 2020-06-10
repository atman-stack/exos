<?php
  try {
    $base = new PDO('mysql:host=localhost; dbname=jeux_video', 'root', '');
  }
  catch(exception $e) {
    die('Erreur '.$e->getMessage());
  }

  $retour = $base->query('SELECT * FROM user');
  while($affichage=$retour->fetch());
?><?php

//    Connexion à la base de données
$pdo = new PDO
(
    'mysql:host=localhost;dbname=blog;charset=UTF8',
    'root',
    '',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]
);

