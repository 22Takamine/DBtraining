
CREATE TABLE sales_old(
sales_id INT PRIMARY KEY
, order_date DATE
, customer_id INT NOT NULL REFERENCES customer(customer_id)
, amount DECIMAL
);

INSERT INTO sales_old
(sales_id, order_date, customer_id, amount)
VALUES
(6,'2018/09/02',2,20000)
,(7,'2018/09/02',1,5000)
,(8,'2018/09/02',3,6000)
,(9,'2018/09/05',1,3000)
;

--salesのテーブルとsales_oldのテーブルを結合している。
INSERT INTO sales
SELECT *
FROM sales_old
;

--更新の確認
SELECT * FROM sales
;

DROP TABLE sales_old
;

--CASEにより指定した日付をもとに表示するものを判断している。
SELECT sales_id, order_date
, CASE 
    WHEN order_date < '2018/10/01' THEN '〇'
    WHEN order_date >= '2018/10/01' THEN ' '
    ELSE ' 'END 
    AS is_old
FROM sales
ORDER BY order_date
;

--文字列を結合し、表示している
SELECT customer_id || ':' || customer_name AS customer_id_name
FROM customer
ORDER BY customer_id
;

--ORDER BYでグループにし、LIMITによりその最大２件分までを取得している。
SELECT *
FROM sales
WHERE customer_id = 1
ORDER BY order_date  DESC LIMIT 2 
;

--サブクエリでorder_dateの最小値を取得し、そのグループの合計を表示している
SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date = (SELECT min(order_date) 
                    FROM sales
                    )
GROUP BY order_date
;

/*minを使わないやり方
SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date = (SELECT order_date 
                    FROM sales
                    GROUP BY order_date
                    ORDER BY order_date LIMIT 1
                    )
GROUP BY order_date
;
*/

--
SELECT  s.customer_id, c.customer_name,TRUNC(avg(s.amount))
FROM sales AS s
INNER JOIN customer AS c
ON s.customer_id = c.customer_id
GROUP BY s.customer_id,c.customer_name
ORDER BY s.customer_id
;

SELECT *
FROM sales
WHERE sales_id = (SELECT sales_id
                  FROM sales
                  WHERE order_date BETWEEN '2018/09/01' AND '2018/09/30'
                  ORDER BY amount DESC LIMIT 1
                  )
;


--DROP SEQUENCE num

CREATE TABLE users
(id serial PRIMARY KEY,name VARCHAR(50))
;

SELECT setval('users_id_seq',101,FALSE)

INSERT INTO users
(name)
VALUES
('山田')
,('森田')
,('西田')
,('岡田')
,('佐次田')
;

SELECT *
FROM users
;  

DELETE 
FROM users
;                                         
