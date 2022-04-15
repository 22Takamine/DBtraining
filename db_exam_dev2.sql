
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

--sales�̃e�[�u����sales_old�̃e�[�u�����������Ă���B
INSERT INTO sales
SELECT *
FROM sales_old
;

--�X�V�̊m�F
SELECT * FROM sales
;

DROP TABLE sales_old
;

--CASE�ɂ��w�肵�����t�����Ƃɕ\��������̂𔻒f���Ă���B
SELECT sales_id, order_date
, CASE 
    WHEN order_date < '2018/10/01' THEN '�Z'
    WHEN order_date >= '2018/10/01' THEN ' '
    ELSE ' 'END 
    AS is_old
FROM sales
ORDER BY order_date
;

--��������������A�\�����Ă���
SELECT customer_id || ':' || customer_name AS customer_id_name
FROM customer
ORDER BY customer_id
;

--ORDER BY�ŃO���[�v�ɂ��ALIMIT�ɂ�肻�̍ő�Q�����܂ł��擾���Ă���B
SELECT *
FROM sales
WHERE customer_id = 1
ORDER BY order_date  DESC LIMIT 2 
;

--�T�u�N�G����order_date�̍ŏ��l���擾���A���̃O���[�v�̍��v��\�����Ă���
SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date = (SELECT min(order_date) 
                    FROM sales
                    )
GROUP BY order_date
;

/*min���g��Ȃ�����
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
('�R�c')
,('�X�c')
,('���c')
,('���c')
,('�����c')
;

SELECT *
FROM users
;  

DELETE 
FROM users
;                                         
