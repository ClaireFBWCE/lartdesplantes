<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserLoginType;
use App\Form\UserRegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends AbstractController
{
    /**
     * @Route("/add", name="add_user")
     */
    public function add(Request $request, EntityManagerInterface $manager, UserPasswordEncoderInterface $encoder)
    {

        $user = new User();
        $form = $this->createForm(UserRegisterType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            
            $hash = $encoder->encodePassword($user,$user->getPassword());
            $user->setPassword($hash);
            $user->setRole("ROLE_USER");
            $user->setCreatedAt(new \DateTime());

            $manager->persist($user);
            $manager->flush();

            $this->addFlash('success', 'Vous êtes bien inscrit');
            return $this->redirectToRoute('homepage');
        }


        return $this->render('user/form.html.twig', [
            'form' => $form->createView()
        ]);
    }

    // // avec REACT
    // /**
    //  * @Route("/connect", name="form_login")
    //  */
    // public function connect()
    // {
        
    //     return $this->render('user/form_login.html.twig');
    // }

    

    // avec symfony (il faut un Form/UserLoginType)
    
    /**
     * @Route("/connect", name="form_login")
     */
    public function connect()
    {
        /*$form = $this->createForm(UserLoginType::class);
        
        return $this->render('user/form_login.html.twig', [
            'connectionForm' => $form->createView()
        ]);*/

    } //NE SERT PLUS A RIEN


    /**
    * @Route("/disconnect", name="disconnect")
    */
    public function disconnect()
    {
    }
 

}
