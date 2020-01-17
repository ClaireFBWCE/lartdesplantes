<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

class UserRegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email', EmailType::class, [
                'label' => 'Email',
                'attr'  => [
                    'placeholder' => 'Entrez votre email',
                    'required' => true  
                ]
            ])
            ->add('password', PasswordType::class, [
                'label'         => 'Mot de passe',
                'attr'  => [
                    'placeholder'   => 'Entrez votre mot de passe'
                ]
            ])

            ->add('confirmPassword', PasswordType::class, [
                'label' => 'Mot de passe confirmation',
                'attr'  => [
                    'placeholder'   => 'Veuillez confirmer votre mot de passe'
                ]
            ])

            ->add('Enregistrer', SubmitType::class)
            ->getForm()
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
