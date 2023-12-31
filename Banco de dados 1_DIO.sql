create database oficina;

CREATE TABLE `veiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  KEY `IdCliente_idx` (`IdCliente`),
  CONSTRAINT `IdCliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`)
) 

INSERT INTO `veiculo` VALUES (1,'QSE-1234','chevrolet','vectra',3);

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CPF` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`)
) 

INSERT INTO `cliente` VALUES (11,'pedro','19479488846'),(22,'joana','05379217834');

DROP TABLE IF EXISTS `equipe`;

CREATE TABLE `equipe` (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idEquipe`)
) 

INSERT INTO `equipe` VALUES (1,'TROCA PNEUS'),(2,'TROCA OLEO');

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Endereco` varchar(45) NOT NULL,
  `Especialidade` varchar(45) NOT NULL,
  `IdEquipe` int NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  KEY `IdEquipe_idx` (`IdEquipe`),
  CONSTRAINT `IdEq` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`)
) 

INSERT INTO `funcionario` VALUES (1,'THAMY','COSMOS','MECANICO',1),(2,'TAY','SANTA CRUZ','MECANICO',2),(3,'LARI','BANGU','MECANICO',1),(4,'MIGUEL','MARGARIDA','MECANICO',2);

DROP TABLE IF EXISTS `ordem_servico`;

CREATE TABLE `ordemServico` (
  `idOrdemServico` int NOT NULL AUTO_INCREMENT,
  `DataEmissao` datetime NOT NULL,
  `DataConclusao` datetime NOT NULL,
    `IdCarro` int NOT NULL,
  `IdEquipe` int DEFAULT NULL,
  PRIMARY KEY (`idOrdem_Servico`),
  KEY `IdCarro_idx` (`IdCarro`),
  KEY `IdEquipe_idx` (`IdEquipe`),
  CONSTRAINT `IdCarro` FOREIGN KEY (`IdCarro`) REFERENCES `carro` (`idCarro`),
  CONSTRAINT `IdEquipe` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`)
) 


INSERT INTO `ordemServico` VALUES (2,'2022-09-23 00:00:00','2022-09-25 00:00:00','Aguardando',1,1),(3,'2022-09-23 00:00:00','2022-09-25 00:00:00','Aguardando',2,2);

DROP TABLE IF EXISTS `pecas`;

CREATE TABLE `pecas` (
  `idPecas` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`idPecas`)
) 

INSERT INTO `pecas` VALUES (1,'Pneu',90),(2,'Oleo',25);

DROP TABLE IF EXISTS `pecasutilizadas`;

CREATE TABLE `pecasutilizadas` (
  `idPecasUtilizadas` int NOT NULL AUTO_INCREMENT,
  `Qtd` varchar(45) NOT NULL DEFAULT '1',
  `IdPecas` int DEFAULT NULL,
  `IdOS` int DEFAULT NULL,
  PRIMARY KEY (`idPecasUtilizadas`),
  KEY `IdPecas_idx` (`IdPecas`),
  KEY `IdOS_idx` (`IdOS`),
  CONSTRAINT `IdOS` FOREIGN KEY (`IdOS`) REFERENCES `ordem_servico` (`idOrdem_Servico`),
  CONSTRAINT `IdPecas` FOREIGN KEY (`IdPecas`) REFERENCES `pecas` (`idPecas`)
) 

INSERT INTO `pecasutilizadas` VALUES (3,'4',1,2),(4,'2',2,3);

DROP TABLE IF EXISTS `servicorealizado`;

CREATE TABLE `servicorealizado` (
  `idServicoRealizado` int NOT NULL AUTO_INCREMENT,
  `IdServico` int NOT NULL,
  `IdOS` int NOT NULL,
  PRIMARY KEY (`idServicoRealizado`),
  KEY `IdServico_idx` (`IdServico`),
  KEY `IdOSs_idx` (`IdOS`),
  CONSTRAINT `IdOSs` FOREIGN KEY (`IdOS`) REFERENCES `servico` (`idServico`),
  CONSTRAINT `IdServico` FOREIGN KEY (`IdServico`) REFERENCES `servicos` (`idServico`)
) 
INSERT INTO `servicorealizado` VALUES (1,1,1),(2,2,2);

DROP TABLE IF EXISTS `servico`;

CREATE TABLE `servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`idServico`)
) 