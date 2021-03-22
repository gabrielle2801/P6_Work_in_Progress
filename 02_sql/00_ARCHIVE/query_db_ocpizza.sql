-- Query recherche sur les commandes.
select ordered_detail.id_ordered, SUM(ordered_detail.price_ht * ordered_detail.tax * ordered_detail.quantity ) as prix_total, customer.last_name as nom, ordered.date_order
from ordered_detail
Left join ordered on ordered.id = ordered_detail.id_ordered
left join customer on customer.id = ordered.id_customer
group by ordered_detail.id_ordered, customer.last_name, ordered.date_order
order by ordered_detail.id_ordered

select SUM(ordered_detail.price_ht * ordered_detail.tax * ordered_detail.quantity )
from ordered_detail
left join ordered on ordered.id = ordered_detail.id_ordered
group by ordered_detail.id_ordered

select ordered_detail.id_ordered, SUM(ordered_detail.price_ht * ordered_detail.tax * ordered_detail.quantity ) as prix_total, customer.last_name as nom
from ordered_detail
Left join ordered on ordered.id = ordered_detail.id_ordered
left join customer on customer.id = ordered.id_customer
left join ordered_online on ordered_online.id_ordered = ordered.id
where ordered_online.status = 'preparing'
group by ordered_detail.id_ordered, customer.last_name

select ordered_detail.id_ordered, SUM(ordered_detail.price_ht * ordered_detail.tax * ordered_detail.quantity ) as prix_total, customer.last_name as nom, ordered_online.id_ordered as online, ordered_clickcollect.id_ordered as click_collect
from ordered_detail
left join ordered on ordered.id = ordered_detail.id_ordered
left join customer on customer.id = ordered.id_customer
left join ordered_online on ordered_online.id_ordered = ordered.id
left join ordered_clickcollect on ordered_clickcollect.id_ordered = ordered.id
where ordered_online.status = 'preparing'
or ordered_clickcollect.status = 'preparing'
group by ordered_detail.id_ordered, customer.last_name,online, click_collect

select ordered_detail.id_ordered, SUM(ordered_detail.price_ht * ordered_detail.tax * ordered_detail.quantity ) as prix_total, customer.last_name as nom, ordered_online.id_ordered as online, ordered_clickcollect.id_ordered as click_collect, product.product_name as pizza
from ordered_detail
left join ordered on ordered.id = ordered_detail.id_ordered
left join product on product.id = ordered_detail.id_product
left join customer on customer.id = ordered.id_customer
left join ordered_online on ordered_online.id_ordered = ordered.id
left join ordered_clickcollect on ordered_clickcollect.id_ordered = ordered.id
where ordered_online.status = 'preparing'
or ordered_clickcollect.status = 'preparing'
group by ordered_detail.id_ordered, customer.last_name,online, click_collect, pizza


SELECT DISTINCT customer.last_name as Nom,address.num, address.street, address.zip_code, address.city
FROM address
LEFT JOIN ordered_online on ordered_online.id_address = address.id
LEFT JOIN customer on customer.id_address = address.id
WHERE ordered_online.status = 'preparing';


-- Query Update prix
UPDATE product
SET price_ht = '$11.45'
WHERE price_ht = '$11.09'
AND id  =  8;

-- Query UPDATE adresse client
UPDATE address
SET num = 12
WHERE num = 351
AND id = 9;
UPDATE address
SET street = 'Rue Auber'
WHERE street = 'Marcel Sembat'
AND id = 9;
UPDATE address
SET zip_code = '75009'
WHERE zip_code = '78140'
AND id = 9;
UPDATE address
SET city = 'PARIS'
WHERE city = 'VELIZY VILLACOUBLAY';
AND id = 9;
