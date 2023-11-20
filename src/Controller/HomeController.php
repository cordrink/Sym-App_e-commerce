<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\Header;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        /*$mail = new Mail();
        $mail->send('masodavictorjudicael@gmail.com', 'masoda', 'Mon premier email', 'Nous vous souahitons la bienvenue');*/

        $products = $entityManager->getRepository(Product::class)->findBy(['isBest' => 1]);
        $productsM = $entityManager->getRepository(Product::class)->findBy(['category' => 4]);
        $productsL = $entityManager->getRepository(Product::class)->findBy(['category' => 5]);

        $headers = $entityManager->getRepository(Header::class)->findAll();


        return $this->render('home/index.html.twig', [
            'products' => $products,
            'productsM' => $productsM,
            'productsL' => $productsL,
            'headers' => $headers,
        ]);
    }
}
