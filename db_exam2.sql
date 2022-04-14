--gradeが1かつhometownが東京の絞り込み ORDER BY で昇順 降順はDESCをつける
SELECT *    
FROM student
WHERE grade = 1 AND hometown = '東京'
ORDER BY student_id
;

--like '%'であいまい検索
SELECT *
FROM student
WHERE grade = 1 OR student_name like '%本'
ORDER BY student_id DESC
;

--major_idで同じ値を持つ人でグループにし、その中のMAX値を出す。
SELECT major_id, max(grade) AS max
FROM student
GROUP BY major_id
ORDER BY major_id
;

--GROUP BYで同じ出身地でグループにし、countでグループ内の数を数える
--HAVUINGで2以上の絞り込みをかけ、OREDER BYで文字数が多い順にしている。
SELECT hometown, count(hometown) AS count
FROM student
GROUP BY hometown
HAVING count(hometown) >= 2
ORDER BY hometown 
;

--FROMで1つ目のテーブルと,INNER JOINで2つ目のテーブルを指定する。
--ONの部分で1つ目のテーブルとカラムと、2つ目のテーブルのカラムを指定し、結合する。
--AS sはstudentと書くのがめんどくさいため。また指定しないと2つのテーブルがあるため
--どれかがわからない。ORDER BYは1つ目で並び替え、2つ目は、並び替えた中で入れ替えていく。
SELECT s.student_name, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
ORDER BY major_name, student_name
;

--
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
WHERE s.hometown != '東京'
ORDER BY m.major_name, s.student_id
;

SELECT student_id, student_name, grade
FROM student
WHERE major_id = (  SELECT major_id
                    FROM major
                    WHERE major_name = '英文学'
                  ) 
ORDER BY student_id
;

SELECT student_id, student_name, major_id
FROM student
WHERE major_id IN  (SELECT major_id--, count(major_id)
                    FROM student
                    GROUP BY major_id
                    HAVING count(major_id) >=3 
            )
ORDER BY major_id, student_id
;
                 

