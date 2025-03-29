# Sym-App E-commerce
Une plateforme d'e-commerce moderne permettant l'achat de produits variés (laptops, t-shirts, etc.) avec une gestion complète des utilisateurs, paniers et commandes.

---

## Description
Sym-App E-commerce est une application web développée avec Symfony 6, conçue pour offrir une expérience d'achat fluide et intuitive. Elle s’adresse aux utilisateurs souhaitant acheter des produits de différentes catégories ainsi qu’aux administrateurs gérant les stocks et les commandes via un backoffice dédié.

---

## Fonctionnalités principales
- **Inscription et connexion** : Création de compte et authentification sécurisée.
- **Gestion du panier** : Ajout, modification et suppression d’articles avant validation.
- **Gestion du compte** : Mise à jour des informations personnelles, y compris l’adresse (nom de ville, quartier, type de local, boîte postale).
- **Gestion des commandes** : Suivi et historique des achats effectués.
- **Backoffice** : Administration complète de l’application (produits, utilisateurs, commandes) via EasyAdmin.
- **Paiement sécurisé** : Intégration de l’API Stripe pour les transactions.

---

## Prérequis
Pour exécuter ce projet, assurez-vous d’avoir les outils suivants installés :
- PHP (>= 8.1)
- MySQL avec MariaDB (v10.4 ou supérieur)
- Composer
- Symfony CLI (optionnel, mais recommandé)
- Un compte Stripe pour l’API de paiement

---

## Installation
Suivez ces étapes pour configurer et lancer le projet localement :

1. **Clonez le dépôt :**
   ```bash
   git clone https://github.com/cordrink/Sym-App_e-commerce.git
   ```

2. **Accédez au répertoire :**
   ```bash
   cd Sym-App_e-commerce
   ```

3. **Installez les dépendances :**
   ```bash
   composer install
   ```

4. **Configurez les variables d’environnement :**
    - Copiez le fichier `.env` :
      ```bash
      cp .env
      ```
    - Modifiez les paramètres de connexion à la base de données (DATABASE_URL) 
    - Modifiez votre clé Stripe (STRIPE_SECRET_KEY) dans le dossier `/src/Controller/StripeController.php`.

5. **Créez la base de données et exécutez les migrations :**
   ```bash
   php bin/console doctrine:database:create
   php bin/console doctrine:migrations:migrate
   ```
   - L'importation de donnees de test se font depuis le fichier SQL se trouvant dans `/public/venteflash.sql`.

6. **Lancez le serveur local :**
   ```bash
   symfony server:start
   ```

---

## Utilisation
- Accédez à l’application via `http://localhost:8000` dans votre navigateur.
- Créez un compte utilisateur pour explorer les fonctionnalités d’achat et de gestion de panier.
- Connectez-vous au backoffice à l’adresse `/admin` (identifiants par défaut à configurer via EasyAdmin) sans oublier de vous ajouter un role `ROLE_ADMIN` dans la BD.
- Ajoutez des produits au panier et finalisez vos achats avec Stripe.

---

## Structure du projet
- `/src` : Code source principal (controllers, entités, services).
- `/public` : Fichiers statiques (CSS, JS, images).
- `/config` : Configuration de Symfony et des bundles (Stripe, EasyAdmin).
- `/migrations` : Scripts de migration pour la base de données.
- `/templates` : Vues Twig pour le frontend et le backoffice.

---

## Contribution
Les contributions sont bienvenues ! Pour proposer des améliorations :
1. Forkez le projet.
2. Créez une branche pour vos modifications (`git checkout -b feature/amélioration`).
3. Soumettez une pull request sur le dépôt principal.

---

## Licence
Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus d’informations.

---

## Contact
Pour toute question ou suggestion, contactez-moi via GitHub : [cordrink](https://github.com/cordrink) ou ouvrez une issue sur le dépôt.

---

### Notes supplémentaires :
- **Symfony 6.1.12** : Ce projet utilise cette version spécifique pour garantir la compatibilité avec les bundles comme EasyAdmin.
- **API Stripe** : Assurez-vous d’avoir configuré votre clé API dans `/src/Controller/StripeController.php` pour activer les paiements.
- **EasyAdmin** : Le backoffice est prêt à l’emploi après configuration des entités dans `/src/Admin`.