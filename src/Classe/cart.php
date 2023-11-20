<?php

namespace App\Classe;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class cart
{

    private  $requestStack;
    private $entityManager;

    public function __construct(RequestStack $requestStack, EntityManagerInterface $entityManager)
    {
        $this->requestStack = $requestStack;
        $this->entityManager = $entityManager;
    }

    public function add(int $id) :void
    {
       $cart = $this->requestStack->getSession()->get('cart', []);

       if (!empty($cart[$id])) {
           $cart[$id]++;
       } else {
           $cart[$id] = 1;
       }

        $this->requestStack->getSession()->set('cart', $cart);

    }

    public function get()
    {
        return $this->requestStack->getSession()->get('cart');
    }

    public function remove()
    {
        return $this->requestStack->getSession()->remove('cart');
    }

    public function delete(int $id)
    {
        $cart = $this->requestStack->getSession()->get('cart', []);

        unset($cart[$id]);

        return $this->requestStack->getSession()->set('cart', $cart);
    }

    public function decrease(int $id) {
        $cart = $this->requestStack->getSession()->get('cart', []);

        if ($cart[$id] > 1) {
            $cart[$id]--;
        } else {
            unset($cart[$id]);
        }

        return $this->requestStack->getSession()->set('cart', $cart);
    }

    public function getFull(): array
    {
        $cartComplete = [];
        if ($this->get()) {
            foreach ($this->get() as $id => $quantity) {
                $product_obj = $this->entityManager->getRepository(Product::class)->findOneBy(['id' => $id]);
                if (!$product_obj) {
                    $this->delete($id);
                    continue;
                }
                $cartComplete[] = [
                    'product' => $product_obj,
                    'quantity' => $quantity,
                ];
            }
        }
        return $cartComplete;
    }
}