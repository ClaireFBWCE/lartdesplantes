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

class AccountController extends AbstractController
{
    /**
     * @Route("/account", name="account")
     */
    public function index(Request $request, EntityManagerInterface $manager, UserPasswordEncoderInterface $encoder)
    {
        $user = new User();
        $subscribeForm = $this->createForm(UserRegisterType::class, $user);
        $subscribeForm->handleRequest($request);

        if($subscribeForm->isSubmitted() && $subscribeForm->isValid()){
            
            $hash = $encoder->encodePassword($user,$user->getPassword());
            $user->setPassword($hash);
            $user->setRole("ROLE_USER");
            $user->setCreatedAt(new \DateTime());

            $manager->persist($user);
            $manager->flush();

            $this->addFlash('success', 'Vous êtes bien inscrit');
            return $this->redirectToRoute('homepage');
        }

        $connectionForm = $this->createForm(UserLoginType::class, [
            //'action' => $this->generateUrl('form_login'),
        ]);

        return $this->render('account/index.html.twig', [
            'subscribeForm' => $subscribeForm->createView(),
            'connectionForm' => $connectionForm->createView()
        ]);
    }
}
