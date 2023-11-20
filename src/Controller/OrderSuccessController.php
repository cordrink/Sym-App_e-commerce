<?php

namespace App\Controller;

use App\Classe\cart;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderSuccessController extends AbstractController
{
    #[Route('/commande/success/{stripeSessionId}', name: 'app_order_validate')]
    public function index($stripeSessionId, EntityManagerInterface $entityManager, cart $cart): Response
    {
        $order = $entityManager->getRepository(Order::class)->findOneBy(['stripeSessionId' => $stripeSessionId]);

        if (!$order || $order->getUser() !== $this->getUser()) {
            return $this->redirectToRoute('app_home');
        }

        if ($order->getState() == 0) {
            // Vider la session donc le panier
            $cart->remove();

            // Modifier le statu de la commande (isPaid) a 1
            $order->setState(1);
            $entityManager->flush();
            // Evoyer un email a notre client pour lui confirmer sa commmande
        }


        // Afficher les quelques info de la commande de l'utilisateur

        return $this->render('order_success/index.html.twig', [
            'order' => $order,
        ]);
    }
}
