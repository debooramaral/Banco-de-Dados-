-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Jan-2022 às 22:42
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `netflix_2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assistir`
--

CREATE TABLE `assistir` (
  `usuario_a` varchar(100) DEFAULT NULL,
  `avaliaçao` int(11) DEFAULT NULL,
  `fk_serie_id` int(11) DEFAULT NULL,
  `fk_filmes_id` int(11) DEFAULT NULL,
  `fk_documentarios_id` int(11) DEFAULT NULL,
  `fk_atores_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atores`
--

CREATE TABLE `atores` (
  `atores_id` int(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `local_nascimento` varchar(45) DEFAULT NULL,
  `fk_atores_series` int(11) DEFAULT NULL,
  `fk_atores_filmes` int(11) DEFAULT NULL,
  `fk_atores_documentarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `numero` varchar(20) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobrança`
--

CREATE TABLE `cobrança` (
  `mes` date DEFAULT NULL,
  `sstatus` varchar(20) DEFAULT NULL,
  `fk_cartao_c` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentarios`
--

CREATE TABLE `documentarios` (
  `documentarios_id` int(11) NOT NULL,
  `nome_produtora` varchar(20) DEFAULT NULL,
  `duraçao` float DEFAULT NULL,
  `ano_produção` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmes`
--

CREATE TABLE `filmes` (
  `filmes_id` int(11) NOT NULL,
  `ano_produçao` date DEFAULT NULL,
  `duraçao` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `series`
--

CREATE TABLE `series` (
  `serie_id` int(11) NOT NULL,
  `temporada` int(11) DEFAULT NULL,
  `episodio` int(11) DEFAULT NULL,
  `prox_ep` int(11) DEFAULT NULL,
  `duraçao` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `email` varchar(100) NOT NULL,
  `senha` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `endereço` varchar(100) DEFAULT NULL,
  `fk_cartao_u` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `assistir`
--
ALTER TABLE `assistir`
  ADD KEY `fk_serie_id` (`fk_serie_id`),
  ADD KEY `fk_filmes_id` (`fk_filmes_id`),
  ADD KEY `fk_documentarios_id` (`fk_documentarios_id`),
  ADD KEY `fk_atores_id` (`fk_atores_id`);

--
-- Índices para tabela `atores`
--
ALTER TABLE `atores`
  ADD PRIMARY KEY (`atores_id`),
  ADD KEY `fk_atores_series` (`fk_atores_series`),
  ADD KEY `fk_atores_filmes` (`fk_atores_filmes`),
  ADD KEY `fk_atores_documentarios` (`fk_atores_documentarios`);

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`numero`);

--
-- Índices para tabela `cobrança`
--
ALTER TABLE `cobrança`
  ADD KEY `fk_cartao_c` (`fk_cartao_c`);

--
-- Índices para tabela `documentarios`
--
ALTER TABLE `documentarios`
  ADD PRIMARY KEY (`documentarios_id`);

--
-- Índices para tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`filmes_id`);

--
-- Índices para tabela `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`serie_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`email`),
  ADD KEY `fk_cartao_u` (`fk_cartao_u`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `assistir`
--
ALTER TABLE `assistir`
  ADD CONSTRAINT `assistir_ibfk_1` FOREIGN KEY (`fk_serie_id`) REFERENCES `series` (`serie_id`),
  ADD CONSTRAINT `assistir_ibfk_2` FOREIGN KEY (`fk_filmes_id`) REFERENCES `filmes` (`filmes_id`),
  ADD CONSTRAINT `assistir_ibfk_3` FOREIGN KEY (`fk_documentarios_id`) REFERENCES `documentarios` (`documentarios_id`),
  ADD CONSTRAINT `assistir_ibfk_4` FOREIGN KEY (`fk_atores_id`) REFERENCES `atores` (`atores_id`);

--
-- Limitadores para a tabela `atores`
--
ALTER TABLE `atores`
  ADD CONSTRAINT `atores_ibfk_1` FOREIGN KEY (`fk_atores_series`) REFERENCES `series` (`serie_id`),
  ADD CONSTRAINT `atores_ibfk_2` FOREIGN KEY (`fk_atores_filmes`) REFERENCES `filmes` (`filmes_id`),
  ADD CONSTRAINT `atores_ibfk_3` FOREIGN KEY (`fk_atores_documentarios`) REFERENCES `documentarios` (`documentarios_id`);

--
-- Limitadores para a tabela `cobrança`
--
ALTER TABLE `cobrança`
  ADD CONSTRAINT `cobrança_ibfk_1` FOREIGN KEY (`fk_cartao_c`) REFERENCES `cartao` (`numero`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_cartao_u` FOREIGN KEY (`fk_cartao_u`) REFERENCES `cartao` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
