<?php

// fichier pour importer les produits dans le bdd
// une fois ce fichier pret, aller dans le terminal
// faire un cd avec le chemin d'où se trouve le fichier
// taper : php connexionBDD.php
// --> les produits sont insérés en bdd

$pdo = new PDO('mysql:dbname=cosmeplanet_bdd;host=127.0.0.1;port=3308', 'root', '');
$pdo->exec("set names utf8");

// On nettoie toute les tables 
$pdo->query("SET FOREIGN_KEY_CHECKS = 0");
$pdo->query("TRUNCATE `product_feature`");
$pdo->query("TRUNCATE `product_ingredient`");
$pdo->query("TRUNCATE `product_skinneed`");
$pdo->query("TRUNCATE `ingredient`");
$pdo->query("TRUNCATE `feature`");
$pdo->query("TRUNCATE `category`");
$pdo->query("TRUNCATE `skinneed`");
$pdo->query("TRUNCATE `product`");
$pdo->query("SET FOREIGN_KEY_CHECKS = 1");

/**
 * Detail du CSV : 
 * Catégorie Produit,Sous-catégorie Produit,Produit,Description,Ingrédients,Besoin,Huiles essentielles,Femmes enceintes,Dermo sensitive,Conserver au frais,Péremption
 *  0 : catégorie (table(s) : category)
 *  1 : sous categorie (table(s) : category)
 *  2 : designation (table(s) : product)
 *  3 : description (table(s) : product)
 *  4 : ingredients (table(s) : ingredient + liaison)
 *  5 : besoins (table(s) : skinneed + liaison)
 *  6 - 9 : caracteristiques  (table(s) : caracteristique + liaison)
 *  10 : peremption  (table(s) : product)
 */

// On prepare toutes Les requetes nécessaire pour le traitement

$addCarac = "INSERT INTO `feature` (`name`) VALUES (?)";
$addCateg = "INSERT INTO `category` (`parent`, `name`, `description`, `picture`, `alt`, `created_at`) VALUES (?,?,?,?,?, NOW())";
$addIngredients = "INSERT INTO `ingredient` (`name`, `picture`, `alt`, `active`, `created_at`) VALUES (?, ?, ?, '1', NOW())";
$addProduct = "INSERT INTO `product` ( `name`, `short_description`, `long_description`, `picture`, `alt`, `active`, `added`, `price`, `discount`, `created_at`) 
    VALUES ( ?,?,?,?,?,'1', NOW(), ?, ?, NOW());";
$addBesoins = "INSERT INTO `skinneed` (`name`, `active`, `created_at`) VALUES (?, '1', NOW())";


// Pour éviter de refaire les requetes pour voir si les différents items existents en bdd
$carac = [];
$categorieParent = [];
$categorie = [];
$ingredients = [];
$besoins = [];


$row = 1;
if (($handle = fopen("/products_details.csv", "r")) !== false) {
    while (($data = fgetcsv($handle, 1000, ",")) !== false) {
        // car certain champs sont vide
        $currentCategParent = 0;
        // besoins du produit lui même
        $currentIngredients = [];
        $currentBesoins = [];

        //echo '<pre>'.print_r($data,true).'</pre>';
        // On crée les caracteristiques
        if($row == 1) {
            // on va d'abord créer les caractéristiques
            // # todo en attente de la migration
            foreach([6,7,8,9] as  $value) {
                $query = $pdo->prepare($addCarac);
                // o ncrée la caracteristique
                $query->execute([$data[$value]]);
                // on conserve l'index de la colonne et l'id en valeur
                $carac[ $value ] = $pdo->lastInsertId();
            }
        } else {
            // On crée la catégorie
            if(trim($data[0]) != '' && !isset($categorieParent[$data[0]]) && ! array_key_exists($data[0], $categorieParent) ) {
                // INSERT INTO `category` (`parent`, `name`, `description`, `picture`, `alt`, `created_at`) VALUES (?,?,?,?,?, NOW())
                $query = $pdo->prepare($addCateg);
                $query->execute([
                    0, // parent
                    $data[0],
                    'description de la catégorie : '.$data[0],
                    'https://picsum.photos/id/170/200/200',
                    'image alt : '.$data[0]
                ]);
                // permet de récupérer l'id
                $currentCategParent = $pdo->lastInsertId();
                $categorieParent[$data[0]] = $currentCategParent;
            }

            // On crée la sous catégorie
            if(trim($data[1]) != '' && !isset($categorie[$data[1]]) && ! array_key_exists($data[1], $categorie)) {
                $query = $pdo->prepare($addCateg);
                $query->execute([
                    $currentCategParent, // parent
                    $data[1],
                    'description de la catégorie : '.$data[1],
                    'https://picsum.photos/id/171/200/200',
                    'image alt : '.$data[1]
                ]);
                $categorie[$data[1]] = $pdo->lastInsertId();
            }


            // On crée les ingredients
            if(trim($data[4]) != '') {
                $lesIngredients = explode(",", $data[4]);

                // On boucle sur tout les ingredients de l'article
                foreach($lesIngredients as $ingredient) {
                    // on retire les espace en début et fin et la virgule
                    $ingredient = trim($ingredient);

                    // si l'ingredient n'existe pas encore on le crée en bdd
                    if($ingredient != "" && !isset($ingredients[$ingredient])  && ! array_key_exists($ingredient, $ingredients) ) {
                        // $addIngredients = INSERT INTO `ingredient` (`name`, `picture`, `alt`, `active`, `created_at`) VALUES (?, ?, ?, '1', NOW())
                        $query = $pdo->prepare($addIngredients);
                        $query->execute([
                            $ingredient,
                            'https://picsum.photos/id/171/200/200',
                            'image alt : '.$ingredient
                        ]);

                        $ingredients[$ingredient] = $pdo->lastInsertId();
                        $currentIngredients[$ingredient] = $ingredients[$ingredient];
                    }
                }               
            }
        }


        // On crée les besoins
        if(trim($data[5]) != '') {
            $needs = explode(",", $data[5]);

            // On boucle sur tout les besoins de l'article
            foreach($needs as $need) {
                // on retire les espace en début et fin et la virgule
                $need = trim($need);

                // si le besoin n'existe pas encore on le crée en bdd
                if($need != "" && !isset($besoins[$need]) && !array_key_exists($need, $besoins)) {
                    // $addBesoins = INSERT INTO `skinneed` (`name`, `active`, `created_at`) VALUES (?, '1', NOW())
                    $query = $pdo->prepare($addBesoins);
                    $query->execute([$need]);
                    $besoins[$need] = $pdo->lastInsertId();
                    $currentBesoins[$need] = $besoins[$need];
                }
            }               
        }
    

        /********************************************************************
         *          On peut maintenant créer le produit
         ********************************************************************/
        // $addProduct = "INSERT INTO `product` ( `name`, `short_description`, `long_description`, `picture`, `alt`, `active`, `added`, `price`, `discount`, `created_at`) 
        //                  VALUES ( ?,?,?,?,?,'1', NOW(), ?, ?, NOW());";
        $price = rand(6, 30);
        $query = $pdo->prepare($addProduct);
        $query->execute([
            $data[2],
            $data[3],
            $data[3],
            'https://picsum.photos/id/42/200/200',
            'image alt : '.$data[2],
            $price,
            // la condition rand(1, 5) permet d'avoir 1 chance sur 5 d'avoir une reduction sur le produit 
            // on ensuite si on tombe sur le 1 on applique une reduction soit 5%, 10%, 15%, 20%
            // le code ci dessous est une "condition ternaire" remplace un if else
            (rand(1, 5) == 1 ? $price*array_rand([5 => 5, 10 => 10, 15 => 15, 20 => 20])/100 : 0 )
        ]);
        $product_id = $pdo->lastInsertId();


        /********************************************************************
         *          On doit maintenant créer les liaisons
         ********************************************************************/
        // On boucle sur les caracteristiques
        foreach([6,7,8,9] as  $value) {
            // si ca vaut OUI alors on insere en tant que liaison
            if(strtoupper($data[$value]) == 'OUI') {
                $query = $pdo->prepare("INSERT INTO `product_feature` (`product_id`, `feature_id`) VALUES (?, ?)");
                $query->execute([ $product_id, $carac[$value] ]);
            }
        }

        // On boucle sur les ingredients
        foreach($currentIngredients as  $value) {
            $query = $pdo->prepare("INSERT INTO `product_ingredient` (`product_id`, `ingredient_id`) VALUES (?, ?)");
            $query->execute([ $product_id, $value ]);
        }

        // On boucle sur les besoins
        foreach($currentBesoins as  $value) {
            $query = $pdo->prepare("INSERT INTO `product_skinneed` (`product_id`, `skinneed_id`) VALUES (?, ?)");
            $query->execute([ $product_id, $value ]);
        }
       
        $row++;
    }
    fclose($handle);
}