--CREATE DATABASE receipt;

DROP TABLE company
;
CREATE TABLE company
(company_id INT PRIMARY KEY, company_name VARCHAR(50) NOT NULL)
;

DROP TABLE store
;
CREATE TABLE store
(store_id INT PRIMARY KEY, store_name VARCHAR(50) NOT NULL)
;

DROP TABLE goods
;
CREATE TABLE goods
(goods_id INT PRIMARY KEY, goods_name VARCHAR(50) NOT NULL, unit_price INT NOT NULL)
;

DROP TABLE tax
;
CREATE TABLE tax
(tax_id INT PRIMARY KEY, tax INT NOT NULL)
;

DROP TABLE discount
;
CREATE TABLE discount
(discount_id INT PRIMARY KEY, discount INT NOT NULL)
;


DROP TABLE pay
;
CREATE TABLE pay
(pay_id INT PRIMARY KEY, pay VARCHAR(50) NOT NULL)
;


DROP TABLE name
;
CREATE TABLE name
(name_id INT PRIMARY KEY, name VARCHAR(50) NOT NULL)
;

DROP TABLE store_code
;
CREATE TABLE store_code
(store_code INT PRIMARY KEY, company_id  INT NOT NULL REFERENCES company(company_id ), store_id INT NOT NULL REFERENCES store(store_id), place VARCHAR(80) NOT NULL, tell VARCHAR(30))
;

DROP TABLE staff
;
CREATE TABLE staff
(staff_id INT PRIMARY KEY, store_code INT NOT NULL REFERENCES store_code(store_code), num INT NOT NULL REFERENCES name(name_id ))
;

DROP TABLE price
;
CREATE TABLE price
(price_id INT PRIMARY KEY, goods_id INT NOT NULL REFERENCES goods(goods_id), amount INT NOT NULL, tax_id INT NOT NULL REFERENCES tax(tax_id),discount_id INT NOT NULL REFERENCES discount(discount_id))
;

DROP TABLE slip
;
CREATE TABLE slip
(slip_id INT PRIMARY KEY, store_code INT NOT NULL REFERENCES store_code(store_code),day_date DATE NOT NULL,reg_num INT NOT NULL)
;

DROP TABLE receipt
;
CREATE TABLE receipt
(receipt_id INT PRIMARY KEY,  price_id INT NOT NULL REFERENCES price(price_id), slip_id INT NOT NULL REFERENCES slip(slip_id), pay_id INT NOT NULL REFERENCES pay(pay_id), staff_id INT NOT NULL REFERENCES staff(staff_id))
;



