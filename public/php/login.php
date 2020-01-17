<?php

/*
 * Arrivée ici en HTTP POST, les données se trouvent dans $_POST :
 * $_POST['email] et $_POST['password']
 */


require 'data.php';


// Récupération de tous les emails.
$emails = array_column($users, 'email');

// Recherche de l'email dans la liste
$index = array_search($_POST['email'], $emails);

if($index === false)
{
    // En cas d'erreur : email inconnu
    $result = 
    [
        'status'  => 'login_error',
        'details' => 'unknown_email'
    ];
}
else
{
    if($users[$index]['password'] != $_POST['password'])
    {
        // En cas d'erreur : mot de passe incorrect
        $result = 
        [
            'status'  => 'login_error',
            'details' => 'bad_password'
        ];
    }
    else
    {
        // En cas de succès : email et mot de passe corrects
        $result = 
        [
            'status'  => 'login_ok',
            'details' => null
        ];
    }
}



// Sérialisation en JSON.
echo json_encode($result);

// Rappel :
// json_encode = sérialisation en JSON
// json_decode = désérialisation de JSON