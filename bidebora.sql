-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jan-2022 às 18:35
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
-- Banco de dados: `bidebora`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome`) VALUES
(1, 'NICOLAS RO'),
(2, 'ARMANDO TE'),
(3, 'JORGE FIC'),
(4, 'CAIO NADA'),
(5, 'AMANDA CAMILA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autoria`
--

CREATE TABLE `autoria` (
  `fk_livro_isbn` varchar(45) DEFAULT NULL,
  `fk_autor_id_autor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autoria`
--

INSERT INTO `autoria` (`fk_livro_isbn`, `fk_autor_id_autor`) VALUES
('123@#', 1),
('456@#', 2),
('789@#', 3),
('101@#', 4),
('112@#', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome`, `cidade`) VALUES
(1, 'ROME', 'LEBLON'),
(2, 'TER', 'BONANÇA'),
(3, 'FIC', 'JUÇARA'),
(4, 'NDA', 'OLIVEIRA'),
(5, 'ALEATORIA', 'SAO CONRADO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `data_emprestimo` date NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `prazo` int(11) DEFAULT NULL,
  `fk_exemplar_fk_livro_isbn` varchar(45) DEFAULT NULL,
  `fk_exemplar_id_exemplar` int(11) DEFAULT NULL,
  `fk_usuario_cpf` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `emprestimo`
--

INSERT INTO `emprestimo` (`data_emprestimo`, `data_entrega`, `prazo`, `fk_exemplar_fk_livro_isbn`, `fk_exemplar_id_exemplar`, `fk_usuario_cpf`) VALUES
('2022-01-17', '2022-01-24', 7, '123@#', 1, '11111111111'),
('2022-01-18', '2022-01-25', 7, '456@#', 2, '22222222222'),
('2022-01-19', '2022-01-26', 7, '789@#', 3, '33333333333'),
('2022-01-20', '2022-01-27', 7, '101@#', 4, '44444444444'),
('2022-01-21', '2022-01-28', 7, '112@#', 5, '55555555555');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `id_exemplar` int(11) NOT NULL,
  `fk_livro_isbn` varchar(45) DEFAULT NULL,
  `estatus` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `exemplar`
--

INSERT INTO `exemplar` (`id_exemplar`, `fk_livro_isbn`, `estatus`) VALUES
(1, '123@#', '1'),
(2, '456@#', '1'),
(3, '789@#', '1'),
(4, '101@#', '1'),
(5, '112@#', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id_genero`, `nome`) VALUES
(1, 'ROMANCE'),
(2, 'TERROR'),
(3, 'FICÇÃO'),
(4, 'DOCUMENTARIO'),
(5, 'QUALQUER');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `isbn` varchar(45) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `edicao` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `fk_genero_id_genero` int(11) NOT NULL,
  `fK_editora_id_editora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`isbn`, `titulo`, `edicao`, `volume`, `fk_genero_id_genero`, `fK_editora_id_editora`) VALUES
('101@#', 'nada a dizer', 5, 2, 4, 4),
('112@#', 'o titulo é com você', 7, 20, 5, 5),
('123@#', 'queres amor?', 1, 10, 1, 1),
('456@#', 'saia correndo', 1, 1, 2, 2),
('789@#', 'indestrutivel', 9, 3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `limite` int(11) DEFAULT NULL,
  `prazo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome`, `limite`, `prazo`) VALUES
(1, 'ANA', 5, 30),
(2, 'BIA', 5, 30),
(3, 'CLOE', 5, 30),
(4, 'DEH', 5, 30),
(5, 'ELI', 5, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fk_perfil_id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cpf`, `nome`, `endereco`, `telefone`, `email`, `fk_perfil_id_perfil`) VALUES
('11111111111', 'ANA', 'RUA DA ANA - 5', '51 999999999', 'ANA@EMAIL.COM', 1),
('22222222222', 'BIA', 'RUA DA BIA - 6', '52 888888888', 'BIA@EMAIL.COM', 2),
('33333333333', 'CLOE', 'RUA DA CLOE - 7', '53 777777777', 'CLOE@EMAIL.COM', 3),
('44444444444', 'DEH', 'RUA DA DEH - 8', '54 666666666', 'DEH@EMAIL.COM', 4),
('55555555555', 'ELI', 'RUA DA ELI - 9', '55 555555555', 'ELI@EMAIL.COM', 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices para tabela `autoria`
--
ALTER TABLE `autoria`
  ADD KEY `fk_livro_isbn` (`fk_livro_isbn`),
  ADD KEY `fk_autor_id_autor` (`fk_autor_id_autor`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices para tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`data_emprestimo`),
  ADD KEY `fk_exemplar_fk_livro_isbn` (`fk_exemplar_fk_livro_isbn`),
  ADD KEY `fk_exemplar_id_exemplar` (`fk_exemplar_id_exemplar`),
  ADD KEY `fk_usuario_cpf` (`fk_usuario_cpf`);

--
-- Índices para tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`id_exemplar`),
  ADD KEY `fk_livro_isbn` (`fk_livro_isbn`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_genero_id_genero` (`fk_genero_id_genero`),
  ADD KEY `fK_editora_id_editora` (`fK_editora_id_editora`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `fk_perfil_id_perfil` (`fk_perfil_id_perfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `exemplar`
--
ALTER TABLE `exemplar`
  MODIFY `id_exemplar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autoria`
--
ALTER TABLE `autoria`
  ADD CONSTRAINT `autoria_ibfk_1` FOREIGN KEY (`fk_livro_isbn`) REFERENCES `livro` (`isbn`),
  ADD CONSTRAINT `autoria_ibfk_2` FOREIGN KEY (`fk_autor_id_autor`) REFERENCES `autor` (`id_autor`);

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`fk_exemplar_fk_livro_isbn`) REFERENCES `exemplar` (`fk_livro_isbn`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`fk_exemplar_id_exemplar`) REFERENCES `exemplar` (`id_exemplar`),
  ADD CONSTRAINT `emprestimo_ibfk_3` FOREIGN KEY (`fk_usuario_cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`fk_livro_isbn`) REFERENCES `livro` (`isbn`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`fk_genero_id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`fK_editora_id_editora`) REFERENCES `editora` (`id_editora`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_perfil_id_perfil`) REFERENCES `perfil` (`id_perfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
