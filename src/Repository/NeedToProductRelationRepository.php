<?php

namespace App\Repository;

use App\Entity\NeedToProductRelation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method NeedToProductRelation|null find($id, $lockMode = null, $lockVersion = null)
 * @method NeedToProductRelation|null findOneBy(array $criteria, array $orderBy = null)
 * @method NeedToProductRelation[]    findAll()
 * @method NeedToProductRelation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NeedToProductRelationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, NeedToProductRelation::class);
    }

    // /**
    //  * @return NeedToProductRelation[] Returns an array of NeedToProductRelation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('n.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?NeedToProductRelation
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
