CREATE TABLE customer(
customer_id INT PRIMARY KEY
,customer_name VARCHAR(50)
);

CREATE TABLE sales(
sales_id INT PRIMARY KEY
,order_date DATE
,customer_id INT NOT NULL REFERENCES customer(customer_id)
,amount DECIMAL
);

INSERT INTO customer
(customer_id, customer_name)
VALUES
(1,'田中')
,(2,'鈴木')
,(3,'田中')
,(4,'田島')
;

INSERT INTO sales
(sales_id, order_date, customer_id, amount)
VALUES
(1, '2018/11/1', 1, 3000)
,(2, '2018/10/01', 3, 5000)
,(3, '2018/10/01', 4, 6000)
,(4, '2018/11/02', 2, 2000)
,(5, '2018/11/15', 2, NULL)
;
SELECT * FROM sales
;

--ALTER TABLE sales RENAME COLUMN order_data TO order_date ;

SELECT * FROM sales WHERE amount < 5000
;

SELECT * FROM sales WHERE amount >= 5000
;

SELECT *, amount * 1.1 FROM sales
;

SELECT * FROM sales WHERE amount IS NOT NULL
;

SELECT * FROM customer WHERE customer_name != '田中'
;

UPDATE sales SET order_date = '2018/11/05', customer_id = 4 WHERE sales_id = 4
;

SELECT * FROM sales
;

DELETE FROM sales WHERE amount IS NULL
;

SELECT * FROM sales
;


