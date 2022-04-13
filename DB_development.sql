CREATE TABLE customer(      --テーブルの作成
customer_id INT PRIMARY KEY
,customer_name VARCHAR(50)
);

CREATE TABLE sales(         --テーブルの作成
sales_id INT PRIMARY KEY
,order_date DATE
,customer_id INT NOT NULL REFERENCES customer(customer_id)
,amount DECIMAL
);

INSERT INTO customer        --customerに値を追加
(customer_id, customer_name)
VALUES
(1,'田中')
,(2,'鈴木')
,(3,'田中')
,(4,'田島')
;

INSERT INTO sales           --salesに値を追加
(sales_id, order_date, customer_id, amount)
VALUES
(1, '2018/11/1', 1, 3000)
,(2, '2018/10/01', 3, 5000)
,(3, '2018/10/01', 4, 6000)
,(4, '2018/11/02', 2, 2000)
,(5, '2018/11/15', 2, NULL)
;

SELECT * FROM sales         --salesのテーブルを確認
;

--ALTER TABLE sales RENAME COLUMN order_data TO order_date ;    修正前 order_data 修正後 order_date  order_dateをスペルミスした為、変更を行った。

SELECT * FROM sales WHERE amount < 5000     --amountの値が5000未満を表示
;

SELECT * FROM sales WHERE amount >= 5000    --amountの値が5000以上を表示
;

SELECT *, amount * 1.1 FROM sales           --salesの値のほかにamountに1.1を掛けた値を表示
;

SELECT * FROM sales WHERE amount IS NOT NULL    --NULLは比べられないのでIS NOTを使用する。ISだと同じ際使用する。
;                                               --salesのNULL以外を表示する

SELECT * FROM customer WHERE customer_name != '田中'  --customerの田中以外を表示 等しくない場合は<>か!=を使用する。
;

UPDATE sales SET order_date = '2018/11/05', customer_id = 4 WHERE sales_id = 4  --値を更新する。2018/11/05とcustomer_idを更新
;

SELECT * FROM sales             --更新を確認
;

DELETE FROM sales WHERE amount IS NULL      --NULLが入っているレコードの削除
;

SELECT * FROM sales             --更新を確認
;


