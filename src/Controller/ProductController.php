<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use App\Repository\SkinneedRepository;
use App\Repository\IngredientRepository;
use Doctrine\ORM\Query;
use phpDocumentor\Reflection\Types\Null_;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{
    /**
     * @Route("/produit", name="product") ////////// 'url' on met ce qu'on veut / 'name' on ne change pas, ça nous sert pour twig
     */
    public function index()
    {
        $repo = $this->getDoctrine()->getRepository(Product::class);
        $products = $repo->findAll(); // pour avoir tous les produits
        // $products = $repo->findByFeature(1); // faire un querybuilder 
        // // http://www.thisprogrammingthing.com/2017/Finding-Things-With-Symfony-3/
        // // regarder Find With a Join
        // // from product::class à la place de AppBundle:Ticket

        // $qb = $em->createQueryBuilder();

        // // this returns an array 
        // $products = $qb->select(array('p'))
        //     ->from('Product::class', 'p')
        //     ->join('Product::class\\Skinneed', 'sn')
        //     ->where('p.id = sn.id')
        //     ->andWhere('sn.user = :userName')
        //     ->setParameter('userName', 'scott')
        //     ->orderBy('e.created', 'ASC')
        //     ->getQuery()
        //     ->getResult();


        return $this->render('product/viewAll.html.twig', [
            'products' => $products,
        ]);
    }

    /**
     * @Route("/fiche-produit-{id}", name="view_product")
     */

    public function viewOneProduct(int $id, ProductRepository $repo)
    {

        $product = $repo->findOneById($id); 
        $products = $repo->findAll();
        $ingredients = $repo->findIngredientsByProductId($id);

        $skinneeds = $repo->findSkinneedsByProductId($id);

        
        // die(var_dump ($products));


        // die('toto');
        return $this->render('product/viewOneProduct.html.twig', [
            'product'       => $product,
            'products'      => $products,
            'ingredients'   => $ingredients,
            'skinneeds'     => $skinneeds,

        ]);
    }

    /**
     * @Route("/produit/categorie-{category_id}/{full}", name="view_product_category", requirements={"full"="0|1"})
     */
    public function view_category(Request $request, int $category_id, int $full, ProductRepository $repo, CategoryRepository $repoCategory)
    {

        $skinneedParam = $request->query->get('skinneed');
        // $repo = $this->getDoctrine()->getRepository(Product::class);
        //$products = $repo->findBy(["category" => $category_id]); // pour avoir tous les produits d'1 catég sans faire dans le Category Repositry
        
        if(!is_null($skinneedParam)){
            $products = $repo->findByCategAndSkinneed($category_id, $skinneedParam);
        }else{
            $products = $repo->findByCategory($category_id); // pour avoir tous les produits d'1 catég
        }
        
        // // // verifer ce qu'on a dans products, 2 façons de faire
        // // // 1. avec foreach (avec ou sans $key)
        // foreach($products as $key => $product){
        //      var_dump("le product: ". $product->getName() . "a pour key: ". $key);
        // }
        // // //2; avec for
        // // for($i = 0; $i < count($products) ; $i++){
        // //     var_dump($products[$i]->getName());
        // // }
        // die();


        $category = $repoCategory->findOneById($category_id);


        // die(var_dump($products[0]->getCategory()->getName()));
        // return $this->render('product/index.html.twig', [
        //     'products' => $products,
            // 'title' => $products[0]->getCategory()
        // ]);

        // voir tout ce qu'il y a dans $products pourvérifier si j'ai bien que les produits cheveux par ex    
            // foreach($products as $product){
            //     var_dump($product->getName() . PHP_EOL);
            // }
            // die("end");

        if ($full === 1) {
            return $this->render('product/viewAllByCateg.html.twig', [
                'products' => $products,
                'category'  => $category,
        
            ]);
        }

        return $this->render('product/viewCateg.html.twig', [
            'products' => $products,
            'category'  => $category,
            'full' => $full
        ]);
}
        

    /**
     * @Route("/produit/besoin-{skinneed_id}", name="view_product_skinneed")
     */
    public function view_skinneed($skinneed_id, ProductRepository $repo, SkinneedRepository $repoSkinneed)
    {
        $products = $repo->findBySkinneed($skinneed_id);
        $skinneed = $repoSkinneed->findOneById($skinneed_id);
        
        // Pour récupérer le nom du Skinneed
        $title = '';
        if($skinneed) {
            $title = $skinneed->getName();
        }
        // dump($title);

        return $this->render('product/viewNeeds.html.twig', [
            'products' => $products,
            'title'  => $title
        ]);
    }

    /**
     * @Route("/produit/mustHave", name="view_must_have")
     */
    public function mustHave(ProductRepository $repo)
    {
        
        $products = $repo->findByMustHave(1);
        // die(var_dump($products));

            return $this->render('product/viewMustHave.html.twig', [
            'products' => $products,
        ]);
    }


    // /**
    //  * @Route("/produit/ingredients", name="view_product_ingredients")
    //  */
    // public function viewIngredients($ingredient_id, ProductRepository $repo, IngredientRepository $repoIngredient)
    // {
    //     $products = $repo->findByIngredient($ingredient_id);
    

    //     return $this->render('product/viewOneProduct.html.twig', [
    //         'product' => $product,
    //         'products' => $products,
    //     ]);
    // }


}
