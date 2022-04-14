
 -- テーブル削除
-- drop table company;
-- drop table student;

-- 会社
create table company(
    id int primary key
    , name varchar(50)
    , short_name varchar(20)
);

-- 研修生
create table student (
    id int primary key
    , name varchar(30)
    , kana varchar(30)
    , gender int -- 性別 1：男性、2：女性s
    , company_id int
    , pg_score int -- PGのスコア
    , db_score int -- DBのスコア
);

-- companyデータ登録
insert into company(id, name, short_name)
values 
(1, '株式会社ABC', 'ABC')
, (2, 'EFG株式会社', 'EFG')
, (3, '株式会社HIJ', 'HIJ')
, (4, '株式会社KLM', 'KLM')
;

insert into student values(1,'黒木 れいな','クロキ レイナ',2,1,round(random() * 100), round(random() * 100))
insert into student values(2,'小島 戴三','コジマ タイゾウ',1,1,round(random() * 100), round(random() * 100));
insert into student values(3,'齋藤 奈緒美','サイトウ ナオミ',2,1,round(random() * 100), round(random() * 100));
insert into student values(4,'土屋 勝行','ツチヤ カツユキ',1,1,round(random() * 100), round(random() * 100));
insert into student values(5,'村山 直幸','ムラヤマ ナオユキ',1,1,round(random() * 100), round(random() * 100));
insert into student values(6,'松永 栄理子','マツナガ エリコ',2,1,round(random() * 100), round(random() * 100));
insert into student values(7,'田辺 春実','タナベ ハルミ',2,1,round(random() * 100), round(random() * 100));
insert into student values(8,'手塚 英造','テヅカ エイゾウ',1,1,round(random() * 100), round(random() * 100));
insert into student values(9,'柳沢 耕介','ヤナギサワ コウスケ',1,1,round(random() * 100), round(random() * 100));
insert into student values(10,'西田 鎮雄','ニシタ シズオ',1,1,round(random() * 100), round(random() * 100));
insert into student values(11,'渡辺 今朝雄','ワタナベ ケサオ',1,2,round(random() * 100), round(random() * 100));
insert into student values(12,'瀬戸 紀子','セト トシコ',2,2,round(random() * 100), round(random() * 100));
insert into student values(13,'杉田 澄夫','スギタ スミオ',1,2,round(random() * 100), round(random() * 100));
insert into student values(14,'山本 清名','ヤマモト セイナ',2,2,round(random() * 100), round(random() * 100));
insert into student values(15,'原 淳子','ハラ ジュンコ',2,2,round(random() * 100), round(random() * 100));
insert into student values(16,'山内 直広','ヤマウチ ナオヒロ',1,3,round(random() * 100), round(random() * 100));
insert into student values(17,'宮内 敬正','ミヤウチ ヨシマサ',1,3,round(random() * 100), round(random() * 100));
insert into student values(18,'林田 真希','ハヤシダ マキ',2,3,round(random() * 100), round(random() * 100));
insert into student values(19,'川原 菊子','カワハラ キクコ',2,5,round(random() * 100), round(random() * 100));
insert into student values(20,'大石 さやか','オオイシ サヤカ',2,5,round(random() * 100), round(random() * 100));

SELECT * FROM student
;

SELECT * FROM company
;

SELECT 'aaa',10
;

-- 四則演算
SELECT 10 + 20, 100 - 50, 10 * 10, 10 / 2
;

-- エイリアス ASは省略可能
SELECT 
name 企業名
, short_name AS 略称
FROM company
;

-- 関数
-- MySQLの場合
select name, pg_score, db_score
, (pg_score + db_score) 合計
, truncate((pg_score + db_score) / 2, 0) 平均
from student;

-- PostgreSQLの場合        --小数点を切り捨てするtruncate関数及びtrunc関数を使用しています
select name, pg_score, db_score
, (pg_score + db_score) 合計
, trunc((pg_score + db_score) / 2, 0) 平均
from student
;

-- CASE式
SELECT name
, CASE 
     WHEN gender = 1 THEN '男性'
     WHEN gender = 2 THEN '女性'
     ELSE 'その他'
END 性別
FROM student;

-- ORDER BY（昇順）
SELECT name, pg_score
FROM student
ORDER BY pg_score;

-- ORDER BY（降順）
SELECT name, pg_score
FROM student
ORDER BY pg_score DESC;

-- ORDER BY（昇順）複数条件
SELECT *
FROM student
ORDER BY company_id, pg_score;

-- ORDER BY（pg_scoreの降順、db_scoreの昇順）
SELECT name, pg_score, db_score
FROM student
ORDER BY pg_score DESC, db_score;

-- 集約関数 名前は使えないが、MAXなどに入れることで文字コードで判断する
SELECT
sum(pg_score) 合計, avg(pg_score) 平均
, max(pg_score) 最高, min(pg_score) 最低
, count(*) 件数   --countは何入れても良いが、NULLだと数えられないことがあるので、無難に*を付ける
FROM student;

-- 集約関数
SELECT
gender
, sum(pg_score) PG合計
, avg(pg_score) PG平均
FROM student
GROUP BY gender;

-- 集約関数
SELECT
company_id
, sum(pg_score) PG合計
, avg(pg_score) PG平均
FROM student
GROUP BY company_id
ORDER BY company_id;

-- 結合
SELECT s.name AS s_name    --.で別名の指定できる
, c.name AS c_name          --joinをあえて書くことで結合しているかがわかりやすくなる。
FROM student AS s
INNER JOIN company AS c
ON s.company_id = c.id;

SELECT student.name, company.name
FROM student, company
WHERE student.company_id = company.id;

-- 左外部結合
SELECT s.name s_name
, c.name c_name
FROM student s
LEFT OUTER JOIN company c
ON s.company_id = c.id
WHERE s.company_id IN (3, 4, 5);

--クロス結合 すべての組み合わせを表示
SELECT *
FROM student,company;

-- サブクエリ
select name, company_id
from student
where company_id = (SELECT id 
                    FROM company
                    WHERE short_name = 'ABC');

select name, company_id     --id = 1だとわかりにくいが、会社名で検索できる
from student
where company_id = 1;

-- サブクエリ                --複数の値は、IN
SELECT name, company_id
FROM student
WHERE company_id IN
                    (SELECT id 
                    FROM company 
                    WHERE name like '株式会社%');

-- 相関サブクエリ               外側で宣言したエイリアスは内部で使用できる     
select name, company_id
from student s
where exists (SELECT id 
                FROM company
                WHERE short_name = 'ABC'
                AND id = s.company_id);

-- 相関サブクエリ
SELECT 
   (SELECT name  
    FROM company 
    WHERE id = s.company_id) 企業名
, s.name
FROM student s;


SELECT c.name, s.pg_avg
FROM company c
-- インラインビュー
JOIN (SELECT company_id,
          avg(pg_score) pg_avg
          FROM student 
          GROUP BY company_id) s
ON c.id = s.company_id;


-- UNION            重複が消えるが、一度並び替えるので、処理は遅くなる。
SELECT 1 id, 'aaa' name
UNION 
SELECT 1, 'aaa';

-- UNION ALL        重複もダイジョブ
SELECT 1 id, 'aaa' name
UNION  ALL
SELECT 2, 'aaa';

-- companyテーブルを元にcompany_backupテーブルを作成
-- テーブルが作成されると同時に、データも登録される
CREATE TABLE company_backup as SELECT * FROM company;

-- 一旦データを削除
DELETE FROM company_backup;

-- companyテーブルのデータをcompany_backupにINSERT
INSERT INTO company_backup SELECT * FROM company;

    



