
 -- e[uí
-- drop table company;
-- drop table student;

-- ïÐ
create table company(
    id int primary key
    , name varchar(50)
    , short_name varchar(20)
);

-- ¤C¶
create table student (
    id int primary key
    , name varchar(30)
    , kana varchar(30)
    , gender int -- «Ê 1Fj«A2F«s
    , company_id int
    , pg_score int -- PGÌXRA
    , db_score int -- DBÌXRA
);

-- companyf[^o^
insert into company(id, name, short_name)
values 
(1, '®ïÐABC', 'ABC')
, (2, 'EFG®ïÐ', 'EFG')
, (3, '®ïÐHIJ', 'HIJ')
, (4, '®ïÐKLM', 'KLM')
;

insert into student values(1,'Ø ê¢È','NL Ci',2,1,round(random() * 100), round(random() * 100))
insert into student values(2,'¬ ÕO','RW} ^C]E',1,1,round(random() * 100), round(random() * 100));
insert into student values(3,'âV¡ Þü','TCgE iI~',2,1,round(random() * 100), round(random() * 100));
insert into student values(4,'y® s','c` JcL',1,1,round(random() * 100), round(random() * 100));
insert into student values(5,'ºR ¼K','} iIL',1,1,round(random() * 100), round(random() * 100));
insert into student values(6,'¼i hq','}ciK GR',2,1,round(random() * 100), round(random() * 100));
insert into student values(7,'cÓ tÀ','^ix n~',2,1,round(random() * 100), round(random() * 100));
insert into student values(8,'èË p¢','edJ GC]E',1,1,round(random() * 100), round(random() * 100));
insert into student values(9,'öò kî','iMT REXP',1,1,round(random() * 100), round(random() * 100));
insert into student values(10,'¼c ÁY','jV^ VYI',1,1,round(random() * 100), round(random() * 100));
insert into student values(11,'nÓ ¡©Y','^ix PTI',1,2,round(random() * 100), round(random() * 100));
insert into student values(12,'£Ë Iq','Zg gVR',2,2,round(random() * 100), round(random() * 100));
insert into student values(13,'c v','XM^ X~I',1,2,round(random() * 100), round(random() * 100));
insert into student values(14,'R{ ´¼','}g ZCi',2,2,round(random() * 100), round(random() * 100));
insert into student values(15,'´ ~q','n WR',2,2,round(random() * 100), round(random() * 100));
insert into student values(16,'Rà ¼L','}E` iIq',1,3,round(random() * 100), round(random() * 100));
insert into student values(17,'{à h³','~E` V}T',1,3,round(random() * 100), round(random() * 100));
insert into student values(18,'Ñc ^ó','nV_ }L',2,3,round(random() * 100), round(random() * 100));
insert into student values(19,'ì´ eq','Jn LNR',2,5,round(random() * 100), round(random() * 100));
insert into student values(20,'åÎ ³â©','IICV TJ',2,5,round(random() * 100), round(random() * 100));

SELECT * FROM student
;

SELECT * FROM company
;

SELECT 'aaa',10
;

-- l¥Z
SELECT 10 + 20, 100 - 50, 10 * 10, 10 / 2
;

-- GCAX ASÍÈªÂ\
SELECT 
name éÆ¼
, short_name AS ªÌ
FROM company
;

-- Ö
-- MySQLÌê
select name, pg_score, db_score
, (pg_score + db_score) v
, truncate((pg_score + db_score) / 2, 0) ½Ï
from student;

-- PostgreSQLÌê        --¬_ðØèÌÄ·étruncateÖyÑtruncÖðgpµÄ¢Ü·
select name, pg_score, db_score
, (pg_score + db_score) v
, trunc((pg_score + db_score) / 2, 0) ½Ï
from student
;

-- CASE®
SELECT name
, CASE 
     WHEN gender = 1 THEN 'j«'
     WHEN gender = 2 THEN '«'
     ELSE '»Ì¼'
END «Ê
FROM student;

-- ORDER BYi¸j
SELECT name, pg_score
FROM student
ORDER BY pg_score;

-- ORDER BYi~j
SELECT name, pg_score
FROM student
ORDER BY pg_score DESC;

-- ORDER BYi¸j¡ð
SELECT *
FROM student
ORDER BY company_id, pg_score;

-- ORDER BYipg_scoreÌ~Adb_scoreÌ¸j
SELECT name, pg_score, db_score
FROM student
ORDER BY pg_score DESC, db_score;

-- WñÖ ¼OÍg¦È¢ªAMAXÈÇÉüêé±ÆÅ¶R[hÅ»f·é
SELECT
sum(pg_score) v, avg(pg_score) ½Ï
, max(pg_score) Å, min(pg_score) Åá
, count(*)    --countÍ½üêÄàÇ¢ªANULL¾Æ¦çêÈ¢±Æª éÌÅA³ïÉ*ðt¯é
FROM student;

-- WñÖ
SELECT
gender
, sum(pg_score) PGv
, avg(pg_score) PG½Ï
FROM student
GROUP BY gender;

-- WñÖ
SELECT
company_id
, sum(pg_score) PGv
, avg(pg_score) PG½Ï
FROM student
GROUP BY company_id
ORDER BY company_id;

-- 
SELECT s.name AS s_name    --.ÅÊ¼ÌwèÅ«é
, c.name AS c_name          --joinð ¦Ä­±ÆÅµÄ¢é©ªí©èâ·­ÈéB
FROM student AS s
INNER JOIN company AS c
ON s.company_id = c.id;

SELECT student.name, company.name
FROM student, company
WHERE student.company_id = company.id;

-- ¶O
SELECT s.name s_name
, c.name c_name
FROM student s
LEFT OUTER JOIN company c
ON s.company_id = c.id
WHERE s.company_id IN (3, 4, 5);

--NX ·×ÄÌgÝí¹ð\¦
SELECT *
FROM student,company;

-- TuNG
select name, company_id
from student
where company_id = (SELECT id 
                    FROM company
                    WHERE short_name = 'ABC');

select name, company_id     --id = 1¾Æí©èÉ­¢ªAïÐ¼ÅõÅ«é
from student
where company_id = 1;

-- TuNG                --¡ÌlÍAIN
SELECT name, company_id
FROM student
WHERE company_id IN
                    (SELECT id 
                    FROM company 
                    WHERE name like '®ïÐ%');

-- ÖTuNG               O¤Åé¾µ½GCAXÍàÅgpÅ«é     
select name, company_id
from student s
where exists (SELECT id 
                FROM company
                WHERE short_name = 'ABC'
                AND id = s.company_id);

-- ÖTuNG
SELECT 
   (SELECT name  
    FROM company 
    WHERE id = s.company_id) éÆ¼
, s.name
FROM student s;


SELECT c.name, s.pg_avg
FROM company c
-- CCr[
JOIN (SELECT company_id,
          avg(pg_score) pg_avg
          FROM student 
          GROUP BY company_id) s
ON c.id = s.company_id;


-- UNION            d¡ªÁ¦éªAêxÀÑÖ¦éÌÅAÍx­ÈéB
SELECT 1 id, 'aaa' name
UNION 
SELECT 1, 'aaa';

-- UNION ALL        d¡à_CWu
SELECT 1 id, 'aaa' name
UNION  ALL
SELECT 2, 'aaa';

-- companye[uð³Écompany_backupe[uðì¬
-- e[uªì¬³êéÆ¯ÉAf[^ào^³êé
CREATE TABLE company_backup as SELECT * FROM company;

-- êUf[^ðí
DELETE FROM company_backup;

-- companye[uÌf[^ðcompany_backupÉINSERT
INSERT INTO company_backup SELECT * FROM company;

    



