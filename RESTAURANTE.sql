CREATE TABLE mesas (
	id_mesa SERIAL PRIMARY KEY,
	capacidade INTEGER  NOT NULL,
	disponibilidade BOOLEAN NOT NULL
);

CREATE TABLE pedidos (
  id_pedido SERIAL PRIMARY KEY,
  id_cliente INTEGER REFERENCES clientes(id_cliente) NOT NULL,
  id_mesa INTEGER REFERENCES mesas(id_mesa),
  data_pedido TIMESTAMP NOT NULL,
  status_pedido VARCHAR(20) NOT NULL
);
CREATE TABLE pedidos_itens_menu (
  id_pedido INTEGER REFERENCES pedidos(id_pedido),
  id_item INTEGER REFERENCES itens_menu(id_item),
  quantidade INTEGER NOT NULL,
  preco_unitario DECIMAL(10, 2) NOT NULL
);



CREATE TABLE itens_menu (
	id_item SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL
);
    

insert into clientes (nome,telefone,email)
values 
			('João Silva','(11) 9999-8888', 'joao.silva@gmail.com'),
            ('Maria Santos','(11) 9876-54321','maria.santos@hotmail.com'),
            ('Pedro Albuquerque', '(11) 91234-5678', 'pedro.albuquerque@yahoo.com');
            
insert into mesas(capacidade, disponibilidade)
values
	(2, true),
	(4, true),
    (6, true),
    (8, true);
    
    
insert into itens_menu (nome, descricao,preco)
values 
	('Hambúrguer','Pão,carne,queijo,alface,tomate e molho especial',20.00),
    ('Pizza','Molho de tomate, Mussarela, Presunto, Champignon e Azeitona',35.00),
    ('Salmão Grelhado','Salmão grelhado com legumes e arroz',55.00);
    
INSERT INTO pedidos (id_cliente, id_mesa, data_pedido, status_pedido)
VALUES

(1, 2, NOW(), 'Em andamento');

INSERT INTO pedidos_itens_menu (id_pedido, id_item, quantidade, preco_unitario)
VALUES
  (1, 1, 2, 20.00),
  (1, 3, 1, 50.00);
  

drop table pedidos; 

    
