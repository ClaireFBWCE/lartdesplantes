<?php

namespace App\Repository;

use App\Entity\IngredientToProductRelation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method IngredientToProductRelation|null find($id, $lockMode = null, $lockVersion = null)
 * @method IngredientToProductRelation|null findOneBy(array $criteria, array $orderBy = null)
 * @method IngredientToProductRelation[]    findAll()
 * @method IngredientToProductRelation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class IngredientToProductRelationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, IngredientToProductRelation::class);
    }

    // /**
    //  * @return IngredientToProductRelation[] Returns an array of IngredientToProductRelation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('i.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?IngredientToProductRelation
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
