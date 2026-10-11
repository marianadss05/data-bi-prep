-- 1. Quais são todos os produtos disponíveis na loja?
SELECT * FROM Track;

-- 2. Quais são as faturas cujo valor total é superior a 5 euros?
SELECT * FROM Invoice
WHERE Total>5;

-- 3. Quem são os clientes que vivem no país "Brazil"?
SELECT * FROM Customer
WHERE Country='Brazil';

-- 4. Qual é a lista de clientes ordenada pelo primeiro nome de A a Z?
SELECT * FROM Customer
ORDER BY FirstName ASC;

-- 5. Quais são as 10 faturas mais caras de sempre?
SELECT * FROM Invoice
ORDER BY Total DESC
LIMIT 10;

-- 6. Quais são os clientes que têm um email do Gmail?
SELECT * FROM Customer
WHERE Email LIKE '%@gmail.com';

-- 7. Quantas músicas existem no total na loja?
SELECT COUNT(TrackId) FROM Track;

-- 8. Quais são as faturas passadas à cidade de "Paris" que tiveram um valor superior a 2 euros? 
SELECT * FROM Invoice
WHERE BillingCity='Paris'
AND Total>2;

-- 9. Quais são os diferentes países onde temos clientes?
SELECT DISTINCT Country FROM Customer;

-- 10. Qual é o valor total de dinheiro que a loja já faturou de sempre?
SELECT SUM(Total) FROM Invoice;

-- 11. Quantos clientes existem agrupados por cada país?
SELECT Country, COUNT(CustomerId) FROM Customer
GROUP BY Country;

-- 12. Qual é o valor total faturado agrupado por cada cidade?
SELECT BillingCity, SUM(Total) FROM Invoice
GROUP BY BillingCity;

-- 13. Quantas músicas existem agrupadas por cada género?
SELECT GenreId, COUNT(TrackId) FROM Track
GROUP BY GenreId;

-- 14. Quais são os países que têm ESTRITAMENTE mais de 3 clientes?
SELECT Country, COUNT(CustomerId) CustomerByCountry FROM Customer
GROUP BY Country
HAVING CustomerByCountry>3;

-- 15. Quais são as cidades que têm um valor total faturado SUPERIOR a 30 euros?
SELECT BillingCity, SUM(Total) TotalByCity FROM Invoice
GROUP BY BillingCity
HAVING TotalByCity > 30;

-- 16. Qual é o valor da fatura mais barata e da fatura mais cara? 
SELECT MIN(Total), MAX(Total) FROM Invoice;

-- 17. Quais são os 5 países com maior número de clientes?
SELECT Country, COUNT(CustomerId) CustomerByCountry FROM Customer
GROUP BY Country
ORDER BY CustomerByCountry DESC
LIMIT 5;

-- 18. Quais são as músicas que pertencem aos géneros 1, 3 ou 5?
SELECT * FROM Track
WHERE GenreId in (1, 3, 5);

-- 19. Qual é a média de duração das músicas em milissegundos?
SELECT AVG(Milliseconds) FROM Track;

-- 20. Quais são as 3 cidades que geraram mais faturação no total para a loja?
SELECT BillingCity, SUM(Total) TotalByCity FROM Invoice
GROUP BY BillingCity
ORDER BY TotalByCity DESC
LIMIT 3;