-- Création de la base de données et les tableaux nécessaires

--@block
CREATE DATABASE Qodex;

--@block
CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    email CHAR(64) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('enseignant', 'etudiant') NOT NULL
);

--@block
CREATE TABLE Categories (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(100) NOT NULL UNIQUE
);

--@block
CREATE TABLE Quiz (
    id_quiz INT PRIMARY KEY AUTO_INCREMENT,
    titre_quiz VARCHAR(200) NOT NULL,
    description TEXT,
    duree_minutes INT NOT NULL,
    id_categorie INT NOT NULL,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--@block
CREATE TABLE Questions (
    id_question INT PRIMARY KEY AUTO_INCREMENT,
    texte_question TEXT NOT NULL,
    reponse_correcte TEXT NOT NULL,
    points INT NOT NULL,
    id_quiz INT NOT NULL,
    FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--@block
CREATE TABLE Resultat (
    id_resultat INT PRIMARY KEY AUTO_INCREMENT,
    score INT NOT NULL,
    date_passage DATE,
    id_utilisateur INT NOT NULL,
    id_quiz INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--@block
INSERT INTO Utilisateurs(nom, email, mot_de_passe, role) VALUES
('Yassine El Fathi', 'yassine.fathi@example.com', SHA2('pass1234', 256), 'enseignant'),
('Sara Bouzidi', 'sara.bz@example.com', SHA2('secret789', 256), 'etudiant'),
('Amine Rahhali', 'amine.rh@example.com', SHA2('teacher42', 256), 'enseignant'),
('Lina Khallouki', 'lina.kh@example.com', SHA2('mypassword', 256), 'etudiant'),
('Hicham Benali', 'hicham.benali@example.com', SHA2('prof2025', 256), 'etudiant');

--@block
INSERT INTO Categories (nom_categorie) VALUES
('Développement Web'),
('Base de Données'),
('Réseaux'),
('Sécurité Informatique'),
('Algorithmes');

--@block
INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_utilisateur) VALUES
('HTML & CSS Basics', 'Quiz sur les fondamentaux du web', 15, 1, 3),
('MySQL Fundamentals', 'Test de connaissances SQL', 20, 2, 5),
('Réseaux OSI', 'Questions sur le modèle OSI', 25, 3, 3),
('Sécurité Web', 'Concepts essentiels de sécurité', 30, 4, 5),
('Structures de Données', 'Quiz sur les listes, piles, files', 20, 5, 3);

--@block
INSERT INTO Questions (texte_question, reponse_correcte, points, id_quiz) VALUES
('Que signifie HTML ?', 'HyperText Markup Language', 5, 1),
('Quelle propriété CSS change la couleur du texte ?', 'color', 3, 1),
('Balise pour insérer une image ?', '<img>', 4, 1),

('Commande pour afficher toutes les tables ?', 'SHOW TABLES;', 5, 2),
('Mot-clé pour filtrer les lignes ?', 'WHERE', 3, 2),
('Clé primaire sert à ?', 'Identifier un enregistrement de manière unique', 4, 2),

('Combien de couches dans OSI ?', '7', 5, 3),
('Couche responsable du routage ?', 'Network', 3, 3),
('Couche qui gère les bits ?', 'Physical', 4, 3),

('Protocole pour chiffrer HTTP ?', 'HTTPS', 5, 4),
('Technique pour injections SQL ?', 'Paramétrage des requêtes', 10, 4),
('Type d’attaque DoS ?', 'Déni de service', 3, 4),

('Structure LIFO ?', 'Pile', 4, 5),
('Structure FIFO ?', 'File', 4, 5),
('Complexité de la recherche dans un tableau trié ?', 'O(log n)', 15, 5);

--@block
INSERT INTO Resultat (score, date_passage, id_utilisateur, id_quiz) VALUES
(48, '2025-02-01', 1, 1),
(70, '2025-02-01', 2, 1),
(68, '2025-02-02', 4, 2),
(30, '2025-02-03', 1, 3),
(64, '2025-02-04', 2, 5),
(34, '2025-02-04', 4, 4);



-- *********** Requête 1 : Ajouter un nouveau quiz créé par un enseignant ***********
--@block
INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_utilisateur) 
VALUES ('Nouveau Quiz', 'Quize', 35, 1, 1);

-- *********** Requête 2 : Modifier la durée d'un quiz existant ***********
--@block
UPDATE Quiz 
SET duree_minutes = 50 
WHERE id_quiz = 1;

-- *********** Requête 3 : Afficher tous les utilisateurs ***********
--@block
SELECT * FROM Utilisateurs;

-- *********** Requête 4 : Afficher uniquement les noms et emails des utilisateurs ***********
--@block
SELECT nom, email FROM Utilisateurs;


-- *********** Requête 5 : Afficher tous les quiz ***********
--@block
SELECT * FROM Quiz;

-- *********** Requête 6 : Afficher uniquement les titres des quiz ***********
--@block
SELECT titre_quiz FROM Quiz;

-- *********** Requête 7 : Afficher toutes les catégories ***********
--@block
SELECT * FROM Categories;

--@block

SELECT * FROM Utilisateurs 
WHERE role = 'enseignant';

--@block
SELECT * FROM Utilisateurs 
WHERE role = 'etudiant';

--@block
SELECT * FROM Quiz 
WHERE duree_minutes > 30;

--@block
SELECT * FROM Quiz 
WHERE duree_minutes <= 45;

--@block
SELECT * FROM Questions 
WHERE points > 5;

--@block
SELECT * FROM Quiz 
WHERE duree_minutes BETWEEN 20 AND 40;

--@block
SELECT * FROM Resultat
WHERE score >= 60;

--@block
SELECT * FROM Resultat 
WHERE score < 50;

--@block
SELECT * FROM Questions 
WHERE points BETWEEN 5 AND 15;

--@block
SELECT * FROM Quiz 
WHERE id_utilisateur = 1;

--@block
SELECT * FROM Quiz 
ORDER BY duree_minutes ASC;

--@block
SELECT * FROM Resultat 
ORDER BY score DESC;

--@block
SELECT * FROM Resultat
ORDER BY score DESC 
LIMIT 5;

--@block
SELECT * FROM Questions 
ORDER BY points ASC;

--@block
SELECT * FROM Resultat 
ORDER BY date_passage DESC 
LIMIT 3;

--@block
SELECT q.titre_quiz, c.nom_categorie 
FROM Quiz q
JOIN Categories c ON q.id_categorie = c.id_categorie;


--@block
SELECT 
    q.titre_quiz,
    COUNT(DISTINCT r.id_utilisateur) AS nombre_etudiants
FROM Quiz q
JOIN Resultat r ON q.id_quiz = r.id_quiz
GROUP BY q.id_quiz, q.titre_quiz
ORDER BY nombre_etudiants DESC;


--@BLOCK
SELECT 
    q.titre_quiz,
    r.score AS meilleur_score,
    u.nom AS meilleur_etudiant
FROM Resultat r
JOIN Quiz q ON q.id_quiz = r.id_quiz
JOIN Utilisateurs u ON u.id_utilisateur = r.id_utilisateur
WHERE r.score = (
    SELECT MAX(r2.score)
    FROM Resultat r2
    WHERE r.id_quiz = r2.id_quiz
);

--@BLOCK 
ALTER TABLE Quiz ADD date_de_creation DATE;


--@block
UPDATE Quiz
SET date_de_creation = '2025-01-29'
WHERE id_quiz = 6
--@block
SELECT * FROM Quiz