<?php

namespace App\Controller;

use App\Entity\Product;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomepageController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index()
    {

        /*$string = "claire;mika;sam;ali";
        $res= explode(";", $string);
        $imp = implode("_", $res);

        var_dump($res);
        var_dump("////////");
        var_dump($imp);*/

        // $str = "Hello World Wakanda Toto Willy Sam Ali!!!";
        // preg_match_all("#W\w*  S\w*#", $str, $match);
        // die(var_dump($match));

        $repo = $this->getDoctrine()->getRepository(Product::class);
        $products = $repo->findAll(); // pour avoir tous les produits
        // // $products = $repo->findByFeature(1); // faire un querybuilder 
        // // // http://www.thisprogrammingthing.com/2017/Finding-Things-With-Symfony-3/
        // // // regarder Find With a Join
        // // // from product::class à la place de AppBundle:Ticket

        return $this->render('homepage/index.html.twig', [
            'products' => $products,
        ]);
    }


     /**
     * @Route("/homepage/valeurs", name="valeurs")
     */
    public function valeurs()
    {
        return $this->render('maintenance/maintenance.html.twig');
    }

         /**
     * @Route("/homepage/blog", name="blog")
     */
    public function blog()
    {
        return $this->render('maintenance/maintenance.html.twig');
    }
}
