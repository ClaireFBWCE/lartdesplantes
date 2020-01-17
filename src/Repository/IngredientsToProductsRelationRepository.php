<?php

namespace App\Repository;

use App\Entity\IngredientsToProductsRelation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method IngredientsToProductsRelation|null find($id, $lockMode = null, $lockVersion = null)
 * @method IngredientsToProductsRelation|null findOneBy(array $criteria, array $orderBy = null)
 * @method IngredientsToProductsRelation[]    findAll()
 * @method IngredientsToProductsRelation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class IngredientsToProductsRelationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, IngredientsToProductsRelation::class);
    }

    // /**
    //  * @return IngredientsToProductsRelation[] Returns an array of IngredientsToProductsRelation objects
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
    public function findOneBySomeField($value): ?IngredientsToProductsRelation
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
