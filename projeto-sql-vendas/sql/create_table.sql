--Cria a tabela e suas colunas
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(30),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name TEXT,
    sales NUMERIC(10,2)
);
