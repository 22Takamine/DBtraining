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

INSERT INTO sales
SELECT *
FROM sales_old
;

SELECT * FROM sales
;

DROP TABLE sales_old
;

SELECT sales_id, order_date
, CASE 
    WHEN order_date < '2018/10/01' THEN 'Z'
    WHEN order_date >= '2018/10/01' THEN ' '
    ELSE ' 'END 
    AS is_old
FROM sales
ORDER BY order_date
;

SELECT customer_id || ':' || customer_name AS customer_id_name
FROM customer
ORDER BY customer_id
;

SELECT *
FROM sales
WHERE customer_id = 1
ORDER BY order_date  DESC LIMIT 2 
;

SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date = (SELECT min(order_date) 
                    FROM sales
                    )
GROUP BY order_date
;

/*min‚ðŽg‚í‚È‚¢‚â‚è•û
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

                    
