--@block
SELECT 
    q.titre_quiz,
    MAX(r.score) AS meilleur_score,
    u.nom AS meilleur_etudiant
FROM Quiz q
LEFT JOIN Resultats r ON q.id_quiz = r.id_quiz
LEFT JOIN Utilisateurs u ON r.id_utilisateur = u.id_utilisateur
GROUP BY q.id_quiz, q.titre_quiz
HAVING MAX(r.score) IS NOT NULL;

--@block
SELECT 
    q.titre_quiz,
    COUNT(qu.id_question) AS nombre_questions,
    q.duree_minutes
FROM Quiz q
LEFT JOIN Questions qu ON q.id_quiz = qu.id_quiz
GROUP BY q.id_quiz, q.titre_quiz, q.duree_minutes;

--@block
SELECT 
    u.nom,
    u.email,
    AVG(r.score) AS score_moyen,
    COUNT(r.id_resultat) AS nombre_quiz_passes
FROM Utilisateurs u
LEFT JOIN Resultats r ON u.id_utilisateur = r.id_utilisateur
WHERE u.role = 'etudiant'
GROUP BY u.id_utilisateur, u.nom, u.email
ORDER BY score_moyen DESC;

--@block
SELECT 
    c.nom_categorie,
    COUNT(q.id_quiz) AS nombre_quiz
FROM Categories c
LEFT JOIN Quiz q ON c.id_categorie = q.id_categorie
GROUP BY c.id_categorie, c.nom_categorie
ORDER BY nombre_quiz DESC;