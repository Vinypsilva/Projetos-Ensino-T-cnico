create table `aluno` (
	 `Matricula_Aluno` int(3) NOT NULL,
	 `Nome_Aluno` char(40) DEFAULT NULL,
     `Endereco` varchar(100) DEFAULT NULL,
     `Telefone` int(20) DEFAULT NULL,
     `Cidade` char(30) DEFAULT NULL
     );
     
INSERT INTO `Aluno`(`Matricula_Aluno`,`Nome_Aluno`,`Endereco`,`Telefone`,`Cidade`) VALUES
(410, 'Mariana', 'Rua Uruguai, 230', 123, 'Porto Alegre'),
(510, 'Mônica', 'Av. 7 de Setembro, 2430', 1234, 'São Paulo'),
(710, 'Joana', 'Beira Rio, 900', 888, 'Florianópolis'),
(810, 'Ana Paula', 'Av. 15 de Novembro, 800', 666, 'Fortaleza'),
(910, 'Manoel', 'Rua Chile, 430', 444, 'Santos');

CREATE TABLE `avaliacao`(
		`ano` int(4) NOT NULL,
        `semestre` int(1) NOT NULL,
        `cod_disciplina` int(3) NOT NULL,
        `cod_avaliacao` int(3) NOT NULL,
        `peso` int(2) DEFAULT NULL
        );
        
INSERT INTO `avaliacao` (`ano`, `semestre`, `cod_disciplina`,`cod_avaliacao`,`peso`) VALUES

(2006, 1, 111, 1, 1),
(2006, 1, 111, 2, 3),
(2006, 1, 111, 3, 3),
(2006, 1, 112, 1, 3),
(2006, 1, 112, 2, 5),
(2006, 1, 112, 3, 5);

CREATE TABLE `disciplina`(
		`cod_disciplina` int(3) NOT NULL,
        `Nome_disciplina` char(30) DEFAULT NULL
        );
        
INSERT INTO `disciplina` VALUES (111, 'Banco de Dados'),
(112, 'Engenharia de Software'),
(113, 'Inteligencia Artificial'),
(114, 'Programação'),
(115, 'Modelagem de Incerteza');

CREATE TABLE `NOTA`(
   `ano` int(4) not null,
   `semestre` int(1) NOT NULL,
   `Cod_disciplina` int(3) not null,
   `cod_avaliacao` int(3) not null,
   `matricula_aluno` int(3) not null,
   `nota` int(5) DEFAULT NULL
   );
		
INSERT INTO `nota` (`nota`,`semetres`,`Cod_disciplina`,`cod_avaliacao`,`matricula_aluno`,`nota`) VALUES
		(2006, 1, 111, 1, 410, 10),
(2006, 1, 111, 1, 510, 9),
(2006, 1, 111, 1, 810, 5),
(2006, 1, 111, 1, 910, 5),
(2006, 1, 111, 2, 410, 7),
(2006, 1, 111, 2, 510, 10),
(2006, 1, 111, 2, 810, 8),
(2006, 1, 111, 2, 910, 8),
(2006, 1, 111, 3, 410, 9),
(2006, 1, 111, 3, 510, 7),
(2006, 1, 111, 3, 810, 7),
(2006, 1, 111, 3, 910, 6),
(2006, 1, 112, 1, 410, 8),
(2006, 1, 112, 1, 510, 3),
(2006, 1, 112, 1, 910, 7),
(2006, 1, 112, 2, 410, 6),
(2006, 1, 112, 2, 510, 9),
(2006, 1, 112, 2, 910, 5),
(2006, 1, 112, 3, 410, 5),
(2006, 1, 112, 3, 510, 10),
(2006, 1, 112, 3, 910, 9);

create table `professor` (
	`Matricula_professor` int(3)  NOT NULL,
    `Nome_professor` VARCHAR(255) NOT NULL,
    `Titulacao` VARCHAR(50) NOT NULL,
    `TELEFONE` VARCHAR(50) NOT NULL,
    `CIDADE` VARCHAR(50) NOT NULL
    );
    
INSERT INTO `professor`(`Matricula_professor`,`Nome_professor`,`Titulacao`,`Telefone`,`Cidade`) VALUES
	(321, 'Adriana', 'Mestre', '1234', 'Sorocaba'),
	(334, 'Fabiana', 'Doutora', '3333', 'Salvador'),
	(343, 'Anita', 'Doutora', '4321', 'Belo Horizonte'),
	(352, 'Carlos', 'Mestre', '555', 'Rio de Janeiro');
    
CREATE TABLE `turma`(
	`ano` int(4) NOT NULL,
    `semestre` int(1) NOT NULL,
    `cod_disciplina` int(3) NOT NULL,
    `Matricula_professor` int(3) DEFAULT NULL
    );
    
INSERT INTO `turma` (`ano`,`semestre`,`cod_disciplina`,`Matricula_professor`) VALUES
(2005, 1, 111, 321),
(2006, 1, 111, 321),
(2006, 1, 112, 321),
(2005, 1, 112, 334),
(2005, 1, 113, 343),
(2006, 1, 113, 343);

CREATE TABLE `turma_aluno`(
		`ano` int(4) not null,
        `semestre` int(1) not null,
        `cod_disciplina` int(3) not null,
        `Matricula_aluno` int(3) not null
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
        
	INSERT INTO `turma_aluno` (`ano`,`semestre`,`cod_disciplina`,`Matricula_aluno`) VALUES
    (2006, 1, 111, 410),
(2006, 1, 111, 510),
(2006, 1, 111, 810),
(2006, 1, 111, 910),
(2006, 1, 112, 410),
(2006, 1, 112, 510),
(2006, 1, 112, 910),
(2006, 1, 113, 510),
(2006, 1, 113, 810);

	ALTER TABLE `aluno`
		ADD PRIMARY KEY(`Matricula_Aluno`);
        
	ALTER TABLE `avaliacao`
		ADD PRIMARY KEY(`ano`,`semestre`,`cod_disciplina`,`cod_avaliacao`);
        
	ALTER TABLE `disciplina`
		ADD PRIMARY KEY(`cod_disciplina`);
	
    ALTER TABLE `nota`
		ADD PRIMARY KEY(`ano`,`semestre`,`cod_disciplina`,`cod_avaliacao`,`matricula_aluno`),
        ADD KEY `matricula_aluno` (`Matricula_aluno`);
        
	ALTER TABLE `professor`
		ADD PRIMARY KEY (`Matricula_professor`);
    
	
		ALTER TABLE `aluno`
	ADD PRIMARY KEY (`Matricula_aluno`);
    alter table `turma_aluno`
		ADD PRIMARY KEY (`ano`,`semestre`,`cod_disciplina`,`matricula_aluno`),
        ADD KEY `matricula_aluno` (`Matricula_Aluno`);
        
	alter table `avaliacao`
       ADD PRIMARY KEY (`ano`,`semestre`,`cod_disciplina`,`Cod_avaliacao`);
        
	ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`Matricula_aluno`) REFERENCES `aluno` (`Matricula_aluno`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`ano`,`semestre`,`cod_disciplina`,`Cod_avaliacao`) REFERENCES `avaliacao` (`ano`, `semestre`, `cod_disciplina`, `Cod_avaliacao`);

ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`Matricula_professor`) REFERENCES `professor` (`Matricula_professor`);

ALTER TABLE `turma_aluno`
  ADD CONSTRAINT `turma_aluno_ibfk_1` FOREIGN KEY (`Matricula_Aluno`) REFERENCES `Aluno` (`Matricula_Aluno`),
  ADD CONSTRAINT `turma_aluno_ibfk_2` FOREIGN KEY (`ano`,`semestre`,`cod_disciplina`) REFERENCES `turma` (`ano`, `semestre`, `cod_disciplina`);
        
        