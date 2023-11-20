<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountOrderController extends AbstractController
{
    #[Route('/compte/mes-commandes', name: 'app_account_order')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $orders = $entityManager->getRepository(Order::class)->findSuccessOrder($this->getUser());


        return $this->render('account/order.html.twig', [
            'orders' => $orders
        ]);
    }

    #[Route('/compte/mes-commandes/{reference}', name: 'app_account_order_show')]
    public function show(EntityManagerInterface $entityManager, $reference): Response
    {
        $order = $entityManager->getRepository(Order::class)->findOneBy(['reference' => $reference]);


        return $this->render('account/order_show.html.twig', [
            'order' => $order,
        ]);
    }
}
