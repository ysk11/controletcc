-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 02-Nov-2022 às 23:21
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_controletcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_documentos`
--

DROP TABLE IF EXISTS `tb_documentos`;
CREATE TABLE IF NOT EXISTS `tb_documentos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  `data_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_documentos`
--

INSERT INTO `tb_documentos` (`id`, `nome`, `path`, `data_inclusao`) VALUES
(1, 'Completo Menos Ar - Documento 02.docx', 'arquivos/6362ebdf45645.docx', '2022-11-02 22:14:55'),
(2, 'MVC - Codigo.DOC', 'arquivos/6362eff0e17ec.doc', '2022-11-02 22:32:16'),
(3, 'Completo Menos Ar - Documento 04.docx', 'arquivos/6362f979b89a6.docx', '2022-11-02 23:12:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `tipo_usuario` char(1) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id`, `usuario`, `senha`, `tipo_usuario`, `nome`, `sexo`, `email`, `data_nascimento`, `endereco`, `numero`) VALUES
(1, 'teste1', '12345', 'A', 'teste', 'M', 'teste', '2022-11-01', 'teste', 123),
(5, 'teste2', 'teste', 'O', 'teste', 'F', 'teste', '2022-11-02', 'teste', 123),
(6, 'aluno1', 'teste', 'A', 'aluno', 'M', 'aluno@aluno.com.br', '2001-10-10', 'rua do aluno', 333),
(7, 'rafaela', 'rafa1234', 'A', 'Rafaela Manuela da Silva Sauro', 'F', 'rafaela@gmail.com.br', '2003-04-10', 'teste', 123),
(8, 'rodolfo', 'novasenha12345', 'O', 'Rodolfo Orientador', 'M', 'rodolfo@gmail.com.br', '1985-03-01', 'teste', 321);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
