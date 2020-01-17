<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ApiController extends AbstractController
{
    /**
     * @Route("/api/login.php", name="api")
     */
    // public function login($email, $password) // exactement le nom de la données en POST (login.php)
    // {
    //     return $this->render('api/index.html.twig', [
    //         'controller_name' => 'ApiController',
    //     ]);
    // }

    public function index(Request $request, UserRepository $userRespository, UserPasswordEncoderInterface $encoder) // exactement le nom de la données en POST (login.php)
    {
        $email = $request->get('email');
        $password = $request->get('password');

        $user = $userRespository->findOneByEmail($email);
        
        if($user == null){
            // user (email) n'existe pas
            return new JsonResponse([
                    'status'  => 'login_error',
                    'details' => 'unknown_email'
                ]); // renvoi une réponse Json dans un format valide récupéré de $results dans login.ph

        }    

        // est-ce que le mdp spécifié correspond au mdp hashé du user dans la bdd
        if($encoder->isPasswordValid($user, $password) == true){
            // user existe ET mdp valide
            return new JsonResponse([
                'status'  => 'ok',
                'details' => 'ok'
            ]); 
        }
        else{
            // user existe MAIS mdp invalide
            return new JsonResponse([
                'status'  => 'login_error',
                'details' => 'unknown_password'
            ]); 
        }
     
        // // récupérer les arguments du Repository
        // $user = $userRespository->findOneByEmailAndPassword($email, $passwordHash);
        // // var_dump($user);

        // var_dump($email, $password); // --> regarder outil de dév F12 et onglet reseau et sur POST
        // die();
        
    }



}



/* on peut faire de é façons pur se connecter à la bdd:
- soit avec la méthode Request (voir User Controller)


*/

