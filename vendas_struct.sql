-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.26 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para vendas
CREATE DATABASE IF NOT EXISTS `vendas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vendas`;

-- Copiando estrutura para tabela vendas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome_cliente` (`nome_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela vendas.clientes: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nome_cliente`, `cidade`, `uf`) VALUES
	(1, 'BRUNO POYER', 'CAMPO GRANDE', 'MS'),
	(2, 'CARLOS ALBERTO', 'NIOAQUE', 'MS'),
	(3, 'PEDRO LUIS', 'MANAUS', 'AM'),
	(4, 'VINICIUS FERNANDO', 'FLORIANOPOLIS', 'SC'),
	(5, 'LARISSA ANDRADE', 'REDENCAO', 'PA'),
	(6, 'BRENDA ALMEIDA', 'CAMPO GRANDE', 'MS'),
	(7, 'MARCELO', 'SAO JOSE', 'SC'),
	(8, 'FERNANDO ', 'COXIM', 'MS'),
	(9, 'WILSON MATHIAS', 'SALVADOR', 'BA'),
	(10, 'RENATO OLIVEIRA', 'XAXIM', 'SC'),
	(11, 'IGOR VELASQUES', 'DIVINOPOLIS', 'MG'),
	(12, 'JUSSARA TAMARA', 'TERESINA', 'PI'),
	(13, 'JULIANA SILVA', 'CUIABA', 'MT'),
	(14, 'ALBERTO SILVA', 'MARACAJU', 'MS'),
	(15, 'WILLIAN', 'PONTA PORA', 'MS'),
	(16, 'CAROLINA', 'BELEM', 'PA'),
	(17, 'THIAGO HUMBERTO', 'BALSAS', 'MA'),
	(18, 'BIANCA ALVES', 'BOA VISTA', 'RR'),
	(19, 'INGRID', 'DOURADOS', 'MS'),
	(20, 'VITOR', 'CAMPO GRANDE', 'MS');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela vendas.itens_pedidos
CREATE TABLE IF NOT EXISTS `itens_pedidos` (
  `seq_item` int NOT NULL AUTO_INCREMENT,
  `num_ped` int NOT NULL DEFAULT '0',
  `id_produto` int NOT NULL DEFAULT '0',
  `qtde_item` float NOT NULL DEFAULT '0',
  `valor_unit` float NOT NULL DEFAULT '0',
  `valor_total` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq_item`,`num_ped`),
  KEY `FK_PEDIDOS` (`num_ped`),
  KEY `FK_PRODUTOS` (`id_produto`),
  CONSTRAINT `FK_PEDIDOS` FOREIGN KEY (`num_ped`) REFERENCES `pedidos` (`num_ped`),
  CONSTRAINT `FK_PRODUTOS` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela vendas.itens_pedidos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itens_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_pedidos` ENABLE KEYS */;

-- Copiando estrutura para tabela vendas.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `num_ped` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL DEFAULT '0',
  `valor_total` float NOT NULL DEFAULT '0',
  `data_emissao` date DEFAULT NULL,
  PRIMARY KEY (`num_ped`),
  KEY `FK_CLIENTE` (`id_cliente`),
  CONSTRAINT `FK_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela vendas.pedidos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` (`num_ped`, `id_cliente`, `valor_total`, `data_emissao`) VALUES
	(1, 2, 330, '2021-09-10');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Copiando estrutura para tabela vendas.pedidos_temp
CREATE TABLE IF NOT EXISTS `pedidos_temp` (
  `id` int NOT NULL,
  `seq_item` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `qtde_item` float DEFAULT NULL,
  `valor_unit` float DEFAULT NULL,
  `valor_subtotal` float DEFAULT NULL,
  PRIMARY KEY (`id`,`seq_item`),
  KEY `FK_CLIENTE_TEMP` (`id_cliente`),
  KEY `FK_PRODUTO_TEMP` (`id_produto`),
  CONSTRAINT `FK_CLIENTE_TEMP` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_PRODUTO_TEMP` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Copiando estrutura para tabela vendas.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome_produto` (`nome_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela vendas.produtos: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `nome_produto`, `preco_venda`) VALUES
	(1, 'PICOLE DE ACAI', 2),
	(2, 'PICOLE DE CHOCOLATE', 1),
	(3, 'PICOLE DE MORANGO', 1),
	(4, 'POTE NAPOLITANO 2LT', 12),
	(5, 'POTE CHOCOLATE 2LT', 12),
	(6, 'COXINHA DE CARNE', 3),
	(7, 'COXINHA DE FRANGO', 3),
	(8, 'EMPADA DE CARNE', 3),
	(9, 'EMPADA DE FRANGO', 3),
	(10, 'RISOLES DE FRANGO', 4),
	(11, 'RISOLES DE CARNE', 4),
	(12, 'PAO DE QUEIJO', 2),
	(13, 'CHIPA', 1),
	(14, 'BOLINHA DE QUEIJO', 3),
	(15, 'HAMBURGAO', 3),
	(16, 'PICOLE DE UVA', 1),
	(17, 'PICOLE DE MANGA', 1),
	(18, 'PICOLE DE LIMAO', 1),
	(19, 'PICOLE DE JABOTICABA', 2),
	(20, 'POTE MORANGO 2LT', 12);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
