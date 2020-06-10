<?php
{
$bdd = new PDO('mysql:host=localhost;dbname=jeux_video;charset=utf8', 'root', '');}
$reponse = $bdd->query('SELECT UPPER(nom) AS nom_maj, prix FROM jeux_video ORDER BY prix');

while ($donnees = $reponse->fetch())
{
    echo $donnees['nom_maj'] . ' coûte ' . $donnees['prix'] . ' EUR<br />';
}

$reponse->closeCursor();





?>