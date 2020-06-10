<?php include "test.php";
    $query = 'SELECT UPPER(nom) n
              FROM jeux_video
              ORDER BY n' ;
    $resulSet = $pdo -> query($query);
    while ($noms = $resulSet -> fetch()) {
        echo $noms['n'] . "<br />";
    }
?>