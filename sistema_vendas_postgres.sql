
-- Criação do Banco de Dados
CREATE DATABASE sistema_vendas;

-- Conectar ao banco criado
\c sistema_vendas;

-- Criação das tabelas

-- Usuários (clientes)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categorias de Produtos
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL, -- exemplo: 'Pendente', 'Pago', 'Enviado', 'Entregue', 'Cancelado'
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2) NOT NULL
);

-- Itens dos Pedidos
CREATE TABLE itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id) ON DELETE CASCADE,
    produto_id INT REFERENCES produtos(id),
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(10, 2) NOT NULL
);

-- Pagamentos
CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id) ON DELETE CASCADE,
    metodo_pagamento VARCHAR(50) NOT NULL, -- exemplo: 'Cartao', 'Boleto', 'Pix'
    status_pagamento VARCHAR(50) NOT NULL, -- exemplo: 'Aguardando', 'Pago', 'Falhou'
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Envios
CREATE TABLE envios (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id) ON DELETE CASCADE,
    status_envio VARCHAR(50) NOT NULL, -- exemplo: 'Em Preparo', 'Enviado', 'Entregue'
    codigo_rastreio VARCHAR(100),
    data_envio TIMESTAMP,
    data_entrega TIMESTAMP
);
