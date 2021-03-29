-- Afficher les commandes en préparation d'un restaurant en cours
SELECT ordered_detail.id_ordered,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
store.store_name AS restaurant
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_clickcollect ON ordered_clickcollect.id_ordered = ordered.id
LEFT JOIN store ON store.id = ordered.id_store
WHERE ordered.id_store = 1
AND ordered_clickcollect.status = 'preparing'
UNION ALL
SELECT ordered_detail.id_ordered,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
store.store_name AS restaurant
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_online ON ordered_online.id_ordered = ordered.id
LEFT JOIN store ON store.id = ordered.id_store
WHERE ordered.id_store = 1
AND ordered_online.status = 'preparing'
UNION ALL
SELECT ordered_detail.id_ordered,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
store.store_name AS restaurant
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_takeaway ON ordered_takeaway.id_ordered = ordered.id
LEFT JOIN store ON store.id = ordered.id_store
WHERE ordered.id_store = 1
AND ordered_takeaway.status = 'preparing';

-- Afficher les commandes en attente d'un client en particulier
SELECT ordered_detail.id_ordered,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
customer.last_name AS client,
ordered_clickcollect.status as order_clickcollect
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_clickcollect ON ordered_clickcollect.id_ordered = ordered.id
LEFT JOIN customer ON customer.id = ordered.id_customer
WHERE customer.id = 2
AND ordered_clickcollect.status = 'order placed'
UNION
SELECT ordered_detail.id_ordered,
ordered_detail.quantity as quantité,
product.product_name as pizza,
customer.last_name as client,
ordered_online.status as order_online
FROM ordered_detail
INNER JOIN ordered on ordered.id = ordered_detail.id_ordered
INNER JOIN product on product.id = ordered_detail.id_product
INNER JOIN ordered_online on ordered_online.id_ordered = ordered.id
LEFT JOIN customer on customer.id = ordered.id_customer
WHERE customer.id = 2
AND ordered_online.status = 'order placed'
UNION
SELECT ordered_detail.id_ordered,
ordered_detail.quantity as quantité,
product.product_name as pizza,
customer.last_name as client,
ordered_takeaway.status as order_takeaway
FROM ordered_detail
INNER JOIN ordered on ordered.id = ordered_detail.id_ordered
INNER JOIN product on product.id = ordered_detail.id_product
INNER JOIN ordered_takeaway on ordered_takeaway.id_ordered = ordered.id
LEFT JOIN customer on customer.id = ordered.id_customer
WHERE customer.id = 2
AND ordered_takeaway.status = 'order placed';


-- Puis je retrouver le prix payé pour une pizza dans une commande terminée même si le prix a changé depuis
-- Query Update prix
UPDATE product
SET price_ht = '$12.09'
WHERE price_ht = '$12.45'
AND product.product_name =  'Chèvre et miel';
-- vérifier que le prix changé est le même dans une ancienne commande
SELECT ordered.id,
ordered_detail.id_product,
ordered_detail.price_ht AS ancien_prix,
product.price_ht AS nouveau_prix
FROM ordered
LEFT JOIN ordered_detail ON ordered.id = ordered_detail.id_ordered
LEFT JOIN product ON product.id = ordered_detail.id_product
LEFT JOIN ordered_online ON ordered.id = ordered_online.id_ordered
WHERE ordered_online.status = 'completed';

-- Puis je afficher l'adresse de livraison d'une commande terminée même si le client a changé d'adresse
-- Query UPDATE adresse client
INSERT INTO address (num, street, zip_code, city, active)
VALUES(12,'Rue Auber','75009','PARIS',TRUE); -- > id = 32
--  désactiver l'adresse (chagement d'adresse du client indice 1)
UPDATE address
SET active = FALSE
WHERE id = 9;
-- Mise à jour avec la nouvel adresse du client indice 1
UPDATE customer
SET id_address = 32
WHERE id = 1;
-- Query recherche l'adresse de livraison d'une commande terminée
SELECT address.id as ancienne_adresse, address.num, address.street, address.zip_code, address.city, ordered_online.status as etat_commande
from address
left join ordered_online on ordered_online.id_address = address.id
Where status = 'completed'
and active = false;

-- Afficher le contenu d'une commande
SELECT ordered_detail.id_ordered,
customer.last_name AS nom,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
SUM(ordered_detail.price_ht * ordered_detail.tax) AS prix
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_online ON ordered_online.id_ordered = ordered.id
LEFT JOIN customer ON customer.id = ordered.id_customer
WHERE ordered_online.status = 'on the way'
GROUP BY  ordered_detail.id_ordered, nom, quantité, pizza;

-- Afficher le contenu d'une commande --> ne fonctionne pas ...
SELECT COUNT(ordered_detail.id_ordered) AS quantité_total,
customer.last_name AS nom,
ordered_detail.quantity AS quantité,
product.product_name AS pizza,
SUM(ordered_detail.price_ht * ordered_detail.tax) AS prix,
SUM(SELECT(quantité_total*prix))AS prix_total
FROM ordered_detail
INNER JOIN ordered ON ordered.id = ordered_detail.id_ordered
INNER JOIN product ON product.id = ordered_detail.id_product
INNER JOIN ordered_online ON ordered_online.id_ordered = ordered.id
LEFT JOIN customer ON customer.id = ordered.id_customer
WHERE ordered_online.status = 'on the way'
GROUP BY nom, quantité, pizza;
-- Afficher le contenu d'une commande quantité est bien = à 3
SELECT COUNT(ordered_detail.id_ordered) AS quantité
FROM ordered_detail
WHERE ordered_detail.id_ordered = 2;
