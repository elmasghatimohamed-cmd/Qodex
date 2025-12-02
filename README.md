# Qodex - Base de Données de Gestion de Quiz

## Description du Projet

Qodex est une base de données dédiée à la gestion et la participation aux quiz éducatifs. Elle met en relation les enseignants créateurs de quiz et les étudiants participants, permettant une évaluation interactive et efficace des connaissances.

## Objectifs

Concevoir et implémenter une base de données relationnelle robuste et évolutive pour supporter toutes les fonctionnalités de Qodex, en garantissant l'intégrité des données et des performances optimales.

## Structure de la Base de Données

### Tables Principales

#### 1. **Utilisateurs**
Gère tous les utilisateurs de la plateforme (enseignants et étudiants)
- `id_utilisateur` (PK) - Identifiant unique
- `nom` - Nom complet de l'utilisateur
- `email` - Adresse email (unique)
- `motdepasse` - Mot de passe crypté
- `role` - Type d'utilisateur (enseignant/etudiant)

#### 2. **Categories**
Organise les quiz par domaines de connaissance
- `id_categorie` (PK) - Identifiant unique
- `nom_categorie` - Nom de la catégorie (Mathématiques, Histoire, Informatique, etc.)

#### 3. **Quiz**
Contient les quiz créés par les enseignants
- `id_quiz` (PK) - Identifiant unique
- `titre_quiz` - Titre du quiz
- `description` - Description détaillée
- `id_categorie` (FK) - Référence à la catégorie
- `id_enseignant` (FK) - Référence à l'enseignant créateur
- `duree_minutes` - Durée maximale en minutes

#### 4. **Questions**
Stocke les questions de chaque quiz
- `id_question` (PK) - Identifiant unique
- `texte_question` - Énoncé de la question
- `reponse_correcte` - Réponse attendue
- `points` - Points attribués pour une bonne réponse
- `id_quiz` (FK) - Référence au quiz

#### 5. **Resultats**
Enregistre les performances des étudiants
- `id_resultat` (PK) - Identifiant unique
- `score` - Score obtenu
- `date_passage` - Date et heure de passage
- `id_etudiant` (FK) - Référence à l'étudiant
- `id_quiz` (FK) - Référence au quiz

## 🔗 Relations entre les Tables

1. **Utilisateurs (Enseignants) → Quiz** : Un enseignant crée plusieurs quiz (1:N)
2. **Categories → Quiz** : Une catégorie contient plusieurs quiz (1:N)
3. **Quiz → Questions** : Un quiz contient plusieurs questions (1:N)
4. **Utilisateurs (Étudiants) → Resultats** : Un étudiant obtient plusieurs résultats (1:N)
5. **Quiz → Resultats** : Un quiz peut être passé plusieurs fois par différents étudiants (1:N)

## 📝 Liste des Requêtes SQL Disponibles

### Requêtes de Manipulation (INSERT/UPDATE)
1. Ajouter un nouveau quiz créé par un enseignant
2. Modifier la durée d'un quiz existant

### Requêtes de Sélection Simples
3. Afficher tous les utilisateurs
4. Afficher uniquement les noms et emails des utilisateurs
5. Afficher tous les quiz
6. Afficher uniquement les titres des quiz
7. Afficher toutes les catégories

### Requêtes avec Filtres (WHERE)
8. Afficher les utilisateurs qui sont enseignants
9. Afficher les utilisateurs qui sont étudiants
10. Afficher les quiz de durée supérieure à 30 minutes
11. Afficher les quiz de durée inférieure ou égale à 45 minutes
12. Afficher les questions valant plus de 5 points
13. Afficher les quiz de durée entre 20 et 40 minutes
14. Afficher les résultats avec un score supérieur ou égal à 60
15. Afficher les résultats avec un score inférieur à 50
16. Afficher les questions valant entre 5 et 15 points
17. Afficher les quiz créés par l'enseignant avec id_enseignant = 1

### Requêtes avec Tri (ORDER BY)
18. Afficher tous les quiz triés par durée (du plus court au plus long)
19. Afficher tous les résultats triés par score (du plus élevé au plus faible)
20. Afficher les 5 meilleurs scores
21. Afficher les questions triées par points (du plus faible au plus élevé)
22. Afficher les 3 derniers résultats (triés par date_passage décroissante)

### Requêtes avec Jointures (JOIN)
23. Afficher le nom de chaque quiz avec sa catégorie

### Requêtes Bonus (Fonctions d'agrégation)
- Compter combien d'étudiants ont passé chaque quiz
- Afficher le meilleur score pour chaque quiz
- Intégration d'une colonne `date_creation` dans la table Quiz

## 🚀 Installation et Utilisation

### Prérequis
- Système de gestion de base de données (MySQL, PostgreSQL, SQLite, etc.)
- Client SQL ou outil de gestion de base de données

### Étapes d'installation

1. **Créer la base de données**
```sql
CREATE DATABASE qodex_quiz;
USE qodex_quiz;
```

2. **Exécuter le script de création des tables**
Exécutez le fichier `database.sql` pour créer toutes les tables nécessaires.

3. **Insérer des données de test** (optionnel)
Utilisez des requêtes INSERT pour ajouter des données d'exemple.

4. **Exécuter les requêtes**
Testez les différentes requêtes SQL fournies dans le projet.

## 📊 Diagramme ERD

Le fichier `diagram.erd.json` contient le diagramme entité-relation complet de la base de données, visualisant toutes les tables et leurs relations.
