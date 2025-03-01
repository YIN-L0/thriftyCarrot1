\COPY Users FROM 'Users.csv' WITH DELIMITER ',' NULL '' CSV
-- since id is auto-generated; we need the next command to adjust the counter
-- for auto-generation so next INSERT will not clash with ids loaded above:
SELECT pg_catalog.setval('public.users_id_seq',
                         (SELECT MAX(id)+1 FROM Users),
                         false);

\COPY Products FROM 'Products.csv' WITH DELIMITER ',' NULL '' CSV
SELECT pg_catalog.setval('public.products_id_seq',
                         (SELECT MAX(id)+1 FROM Products),
                         false);

\COPY OldCarts FROM 'OldCarts.csv' WITH DELIMITER ',' NULL '' CSV
SELECT pg_catalog.setval('public.oldcarts_cid_seq',
                         (SELECT MAX(cid)+1 FROM OldCarts),
                         false);

\COPY OldCartContents FROM 'OldCartContent.csv' WITH DELIMITER ',' NULL '' CSV

\COPY Preferences FROM 'Preferences.csv' WITH DELIMITER ',' NULL '' CSV

-- \COPY Purchases FROM 'Purchases.csv' WITH DELIMITER ',' NULL '' CSV
-- SELECT pg_catalog.setval('public.purchases_id_seq',
--                          (SELECT MAX(id)+1 FROM Purchases),
--                          false);
