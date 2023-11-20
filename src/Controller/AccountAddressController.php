<?php

namespace App\Controller;

use App\Classe\cart;
use App\Entity\Address;
use App\Form\AddressType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountAddressController extends AbstractController
{
    #[Route('/compte/adresse', name: 'app_account_address')]
    public function index(): Response
    {
        return $this->render('account/address.html.twig');
    }


    #[Route('/compte/ajouter-adresse', name: 'app_account_address_add')]
    public function add(cart $cart, Request $request, EntityManagerInterface $entityManager): Response
    {
        $address = new Address();

        $form = $this->createForm(AddressType::class, $address);

        $form->handleRequest($request);
        if ($form->isSubmitted() and $form->isValid()) {
            $address->setUser($this->getUser());
            $entityManager->persist($address);
            $entityManager->flush();
            if ($cart->get()) {
                return $this->redirectToRoute('app_order');
            } else {
                return $this->redirectToRoute('app_account_address');
            }
        }

        return $this->render('account/address_add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/compte/modifier-adresse/{id}', name: 'app_account_address_edit')]
    public function edit(Request $request, EntityManagerInterface $entityManager, int $id): Response
    {
        $address = $entityManager->getRepository(Address::class)->findOneBy(['id' => $id]);

        if (!$address and $address->getUser() !== $this->getUser()) {
            return $this->redirectToRoute('app_account_address');
        }

        $form = $this->createForm(AddressType::class, $address);

        $form->handleRequest($request);
        if ($form->isSubmitted() and $form->isValid()) {
            $entityManager->flush();
            return $this->redirectToRoute('app_account_address');
        }

        return $this->render('account/address_add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/compte/supprimer-adresse/{id}', name: 'app_account_address_delete')]
    public function delete(EntityManagerInterface $entityManager, int $id): Response
    {
        $address = $entityManager->getRepository(Address::class)->findOneBy(['id' => $id]);

        if ($address and $address->getUser() === $this->getUser()) {
            $entityManager->remove($address);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_account_address');
    }
}
