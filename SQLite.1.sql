
--1
select order_id,
	order_delivered__6,
	order_estimated_
FROM olist_orders_dataset
where order_delivered__6 > order_estimated_;




--2
select 	
		c.customer_unique_,
		COUNT (o.order_id) as total_pedidos
from olist_orders_dataset o 
JOIN olist_customers_dataset c 
	ON o.customer_id = c.customer_id
GROUP by c.customer_id
having count(o.order_id) > 1;


--3
SELECT
c.customer_state,
count(o.order_id) as total_pedidos
FROM olist_orders_dataset o
JOIN olist_customers_dataset c 
	on o.customer_id = c.customer_id
group by c.customer_state;

--4
SELECT AVG (review_score) as media
from olist_order_reviews_dataset;

--5
SELECT  
	c.customer_state, 
    SUM(p.payment_value) as receita_total
FROM olist_orders_dataset o
JOIN olist_customers_dataset c 
	on o.customer_id = c.customer_id
join olist_order_payments_dataset p 
	on o.order_id = p.order_id
GROUP by c.customer_state;


--6
SELECT  
		o.order_status,
        AVG(r.review_score) AS meida_avaliacao
FROM olist_orders_dataset o 
JOIN olist_order_reviews_dataset r 
	on o.order_id = r.order_id
GROUP by o.order_status;


--7

SELECT 
	p.product_category,
    COUNT(*) AS total_vendas
FROM olist_order_items_dataset i
join olist_products_dataset p 
	on i.product_id = p.product_id
 GROUP by p.product_category
 order by total_vendas DESC;

--8
 SELECT 
	p.product_category,
    COUNT(*) AS total_vendas
FROM olist_order_items_dataset i
join olist_products_dataset p 
	on i.product_id = p.product_id
 GROUP by p.product_category
 order by total_vendas DESC;
 
 --9
SELECT 
	o.order_id,
   DATE(o.order_purchase_t) as data_compra,
   c.customer_state,
   SUM (i.price) as valor_total,
   SUM (i.freight_value) as frete_total,
   COUNT(i.order_item_id) as quantidade_itens,
   AVG(review_score) as review_score
FROM olist_orders_dataset o
join olist_customers_dataset c 
	on o.customer_id = c.customer_id
JOIN olist_order_items_dataset i 
	on o.order_id = i.order_id
    LEFT join olist_order_reviews_dataset r 
    on o.order_id = r.order_id
GROUP BY
o.order_id,
data_compra,
c.customer_state;