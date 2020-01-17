<?php

namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\AST\Join;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }


    /*public function findByCategory($category_id)
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = '
            SELECT * FROM `product`
            WHERE category_id = :category_id      
            ';
        $stmt = $conn->prepare($sql);
        $stmt->execute(['category_id' => $category_id]);

        // returns an array of arrays (i.e. a raw data set)
        return $stmt->fetchAll();
    }*/

    public function findByCategory($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.category = :val')
            ->andWhere('p.active = 1')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult();
    }
    

    public function findBySkinneed($value)
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = '
        SELECT * FROM product AS p 
            INNER JOIN product_skinneed AS ps ON p.id = ps.product_id
            INNER JOIN skinneed AS s ON ps.skinneed_id = s.id
            WHERE s.id = :skinneed_id
            ORDER BY p.id ASC      
            ';
        $stmt = $conn->prepare($sql);
        $stmt->execute(['skinneed_id' => $value]);

        // returns an array of arrays (i.e. a raw data set)
        return $stmt->fetchAll();
        /*
        SELECT * FROM product AS p 
            INNER JOIN product_skinneed AS ps ON p.id = ps.product_id
            INNER JOIN skinneed AS s ON ps.skinneed_id = s.id
            WHERE s.id = ?
            ORDER BY p.id ASC
            LIMIT 10
        */
        /*
        return $this->createQueryBuilder('p')
            ->innerJoin('product_skinneed', 'ps', 'WITH', 'p.id = ps.product_id' )
            ->innerJoin('skinneed', 's', 'WITH', 'ps.skinneed_id = s.id' )
            ->andWhere('s.id = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult();
        */
        }

    public function findByMustHave($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.mustHave = :val')
            ->setParameter('val', $value)
            ->setMaxResults(10)
            ->getQuery()
            ->getResult();
    }



    public function findIngredientsByProductId($value)
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = '  

        SELECT i.name FROM ingredient AS i 
        LEFT JOIN product_ingredient AS pi ON i.id = pi.ingredient_id
        LEFT JOIN product AS p ON pi.product_id = p.id
        WHERE p.id = :product_id
        ORDER BY i.id ASC
            ';

        $stmt = $conn->prepare($sql);
        $stmt->execute(['product_id' => $value]);

        // returns an array of arrays (i.e. a raw data set)
        return $stmt->fetchAll();
        }

    public function findSkinneedsByProductId($value)
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = '  

        SELECT s.name FROM skinneed AS s 
        LEFT JOIN product_skinneed AS ps ON s.id = ps.skinneed_id
        LEFT JOIN product AS p ON ps.product_id = p.id
        WHERE p.id = :product_id
        ORDER BY s.id ASC
            ';

        $stmt = $conn->prepare($sql);
        $stmt->execute(['product_id' => $value]);

        // returns an array of arrays (i.e. a raw data set)
        return $stmt->fetchAll();
        }

    
    

        

    // /**
    //  * @return Product[] Returns an array of Product objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Product
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
