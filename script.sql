select * from clientes c ;

INSERT INTO public.clientes
(id_cliente, nome, email, telefone, endereco)
VALUES(5, 'Fernanda Costa', 'fernanda.costa@gmail.com', '(51) 95555-0005', 'Av. Ipiranga, 654 - RS');

---
SELECT * FROM public.produtos ;

SELECT * FROM public.produtos where nome = 'Fone Bluetooth';

--join venda
SELECT c.nome, v.data_venda
FROM clientes c
INNER JOIN vendas v
ON c.id_cliente = v.id_cliente;

SELECT c.nome , v.status, c.email    
FROM clientes c
INNER JOIN vendas v
ON c.id_cliente = v.id_cliente;

SELECT id_item, id_venda, id_produto, quantidade, preco_unitario
FROM public.itens_venda;

--count
SELECT id_cliente, COUNT(*)
FROM vendas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

--Inner Join
SELECT c.nome,
       v.id_venda
FROM clientes c
INNER JOIN vendas v
    ON c.id_cliente = v.id_cliente;


--Left join 
SELECT c.nome,
       v.id_venda
FROM clientes c
LEFT JOIN vendas v
    ON c.id_cliente = v.id_cliente;

--Righy Join
SELECT c.nome,
       v.id_venda
FROM clientes c
RIGHT JOIN vendas v
    ON c.id_cliente = v.id_cliente;

--FULL OUTER JOIN - retorna tudo das duas tabelas 
SELECT c.nome,
       v.id_venda
FROM clientes c
FULL OUTER JOIN vendas v
    ON c.id_cliente = v.id_cliente;

--Contém
SELECT *
FROM clientes
WHERE nome LIKE '%Maria%';


-- ACS E DESC
SELECT *
FROM produtos
ORDER BY preco DESC;


SELECT * FROM public.produtos;
SELECT * FROM public.pagamentos;
SELECT * FROM public.clientes;

SELECT id_venda, id_cliente, data_venda, status
FROM public.vendas;






INSERT INTO public.pagamentos (id_venda,forma_pagamento,valor,status) VALUES
(4,'PIX',699.80,'Pago'),
(5,'Cartão de Crédito',189.90,'Pago'),
(6,'Boleto',1299.90,'Pendente'),








select into full_banco.clientes  ;

INSERT INTO full_banco.clientes  (nome, email, telefone, endereco);
SELECT
    'Cliente ' || i,
    'cliente' || i || '@email.com',
    '(61) 9999-' || LPAD(i::text,4,'0'),
    'Rua ' || i || ', Nº ' || (100+i)
FROM generate_series(1,100) i;




SELECT id_cliente, nome, email, telefone, endereco
FROM full_banco.clientes;



