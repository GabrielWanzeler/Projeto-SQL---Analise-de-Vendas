-- 1. Faturamento total
SELECT
    SUM(sales) AS faturamento_total
FROM superstore;



-- 2. Faturamento por categoria de produto
SELECT
    category,
    SUM(sales) AS faturamento_categoria
FROM superstore
GROUP BY category;



-- 3. Produtos mais vendidos (por quantidade de vendas)
SELECT
    product_name,
    COUNT(product_id) AS qtd_vendida
FROM superstore
GROUP BY product_name
ORDER BY qtd_vendida DESC
LIMIT 5;



-- 4. Maiores consumidores (em valor gasto)
SELECT
    customer_name,
    SUM(sales) AS gastos_totais
FROM superstore
GROUP BY customer_name
ORDER BY gastos_totais DESC;



-- 5. Ticket médio por pedido
SELECT
    AVG(valor_pedido) AS ticket_medio_pedido
FROM (
    SELECT
        order_id,
        SUM(sales) AS valor_pedido
    FROM superstore
    GROUP BY order_id
) t;



-- 6. Faturamento por estado
SELECT
    state,
    COUNT(DISTINCT order_id) AS qtd_pedidos,
    SUM(sales) AS faturamento_estado
FROM superstore
GROUP BY state
ORDER BY faturamento_estado DESC;



-- 7. Pedidos por cliente
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS qtd_pedidos
FROM superstore
GROUP BY customer_name
ORDER BY qtd_pedidos DESC;



-- 8. Média de itens por pedido
SELECT
    AVG(qtd_itens) AS media_itens_por_pedido
FROM (
    SELECT
        order_id,
        COUNT(*) AS qtd_itens
    FROM superstore
    GROUP BY order_id
) t;



-- 9. Mês com maior faturamento
SELECT
    EXTRACT(MONTH FROM order_date) AS mes,
    SUM(sales) AS faturamento
FROM superstore
GROUP BY mes
ORDER BY faturamento DESC;



-- 10. Categorias com faturamento acima da média das categorias
SELECT
    category
FROM superstore
GROUP BY category
HAVING SUM(sales) >
(
    SELECT AVG(total_categoria)
    FROM (
        SELECT
            SUM(sales) AS total_categoria
        FROM superstore
        GROUP BY category
    ) t
);
