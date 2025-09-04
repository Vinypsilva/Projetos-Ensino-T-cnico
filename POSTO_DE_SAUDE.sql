CREATE TABLE pacientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    data_nascimento DATE not null,
	cpf VARCHAR(14) UNIQUE not null,
    telefone VARCHAR(15),
    endereco VARCHAR(255) not null
    );
    
CREATE TABLE medicos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    crm VARCHAR(15) unique not null,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
    );
    
CREATE TABLE consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    observacoes text,
    FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
    FOREIGN KEY (medico_id) REFERENCES medicos (id)
    );
    
CREATE TABLE medicamentos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    lote VARCHAR(20) NOT NULL,
    validade DATE NOT NULL
    );
    
CREATE TABLE receitas_medicas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    consulta_id INT NOT NULL,
    medicamento_id INT NOT NULL,
    posologia TEXT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id)
    );
    
CREATE TABLE exames (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    descricao TEXT NOT NULL
    );
    
CREATE TABLE consultas_exame (
	consulta_id INT NOT NULL,
    exame_id INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_resultado DATE,
    resultado TEXT,
    FOREIGN KEY (consulta_id) REFERENCES consultas (id),
    FOREIGN KEY (exame_id) REFERENCES exames (id)
    );
    
INSERT INTO  pacientes (nome,data_nascimento,cpf,telefone,endereco) VALUES ('João Silva', '1985-07-10', '111.222.333-44', '(11) 91234-5678', 'Rua das Flores, 123, São Paulo'),
('Maria Souza', '1992-02-28', '222.333.444-55', '(11) 92345-6789', 'Rua das Pedras, 456, São Paulo');

INSERT INTO medicos (nome,crm,especialidade,telefone) VALUES ('Dr. Pedro Ferreira', '12345-SP', 'Clínico Geral', '(11) 93456-7890'),
('Dra. Ana Oliveira', '67890-SP', 'Pediatra', '(11) 94567-8901');

INSERT INTO consultas (data_hora,paciente_id,medico_id,observacoes) VALUES ('2023-03-15 09:00:00', 1, 1, 'Paciente com dores de cabeça frequentes.'),
('2023-03-15 10:00:00', 2, 2, 'Consulta de rotina para criança.');

INSERT INTO medicamentos (nome, principio_ativo,fabricante,lote,validade) VALUES ('Dorflex', 'Dipirona Monoidratada + Cafeína + Orfenadrina', 'Sanofi', 'A123B456', '2023-12-31'),
('Paracetamol', 'Paracetamol', 'Genéricos', 'X789Y1011', '2024-06-30');

INSERT INTO receitas_medicas(consulta_id,medicamento_id,posologia,quantidade) VALUES (1, 1, 'Tomar 1 comprimido a cada 6 horas em caso de dor.', 10),
(1, 2, 'Tomar 1 comprimido a cada 8 horas em caso de febre.', 10);

 INSERT INTO exames(nome, descricao) VALUES ('Hemograma completo', 'Exame de sangue que avalia as células sanguíneas.'),
('Glicemia em jejum', 'Exame de sangue que mede a taxa de glicose na corrente sanguínea.');   

INSERT INTO consultas_exame (consulta_id, exame_id, data_solicitacao, data_resultado, resultado) VALUES
(1, 1, '2023-03-15', '2023-03-17', 'Resultados normais.'),
(1, 2, '2023-03-15', '2023-03-17', 'Glicemia: 95 mg/dL.');
    
    

    
