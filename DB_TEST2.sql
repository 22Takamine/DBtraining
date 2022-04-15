CREATE TABLE java_score
(user_id INT PRIMARY KEY, score INT)
;

INSERT INTO java_score
(user_id, score)
VALUES
(001,75)
,(002,74)
,(003,89)
;

CREATE TABLE php_score
(user_id INT PRIMARY KEY, score INT)
;

INSERT INTO php_score
(user_id, score)
VALUES
(001,90)
,(002,78)
,(003,90)
;
INSERT INTO php1_score
(user_id, score)
VALUES
(001,75)
,(002,74)
,(003,89)
;

SELECT 'JAVA' AS course,user_id, score
FROM java_score
UNION 
SELECT 'PHP' AS course, user_id, score
FROM php1_score
ORDER BY course, user_id
;



