-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Dez-2021 às 20:25
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojinha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `descricao`) VALUES
(1, 'Acessorios'),
(2, 'Acessorios'),
(3, 'Esmalte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `idEstoque` int(11) NOT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `dtEntrada` date DEFAULT NULL COMMENT 'YYYY/MM/DD',
  `quantidade` int(11) DEFAULT 0,
  `dtFabricacao` date DEFAULT NULL COMMENT 'YYYY/MM/DD',
  `dtVencimento` date DEFAULT NULL COMMENT 'YYYY/MM/DD',
  `nfCompra` text DEFAULT NULL,
  `precoCompra` decimal(15,2) DEFAULT NULL,
  `icmsCompra` decimal(15,2) DEFAULT NULL,
  `precoVenda` decimal(15,2) DEFAULT NULL,
  `qtdVendida` int(11) DEFAULT NULL,
  `qtdOcorrencia` int(11) DEFAULT NULL,
  `ocorrencia` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `institucional`
--

CREATE TABLE `institucional` (
  `idInstituicao` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `tipoPessoa` char(1) DEFAULT 'F' COMMENT '{ ''F'' , ''J'' }',
  `endereco` varchar(50) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemspedido`
--

CREATE TABLE `itemspedido` (
  `idItemPedido` int(11) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  `idPedido` int(11) DEFAULT NULL,
  `idEstoque` int(11) DEFAULT NULL,
  `qtdItem` int(11) DEFAULT NULL,
  `dtDevolucao` datetime DEFAULT NULL,
  `motivoDevolucao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivelusuarios`
--

CREATE TABLE `nivelusuarios` (
  `idNivelUsuario` int(11) NOT NULL,
  `nivel` varchar(20) DEFAULT NULL COMMENT '{''Cliente '', ''Funcionário'', ''Caixa '', ''Financeiro '', ''Gerente '', ''Diretor'', ''Administrador''}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `nivelusuarios`
--

INSERT INTO `nivelusuarios` (`idNivelUsuario`, `nivel`) VALUES
(1, 'Cliente'),
(2, 'Funcionário'),
(3, 'Caixa'),
(4, 'Financeiro'),
(5, 'Gerente'),
(6, 'Diretor'),
(7, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `dtPedido` datetime DEFAULT NULL,
  `dtPagamento` datetime DEFAULT NULL,
  `dtNotaFiscal` datetime DEFAULT NULL,
  `notaFiscal` text DEFAULT NULL,
  `dtEnvio` datetime DEFAULT NULL,
  `dtRecebimento` datetime DEFAULT NULL,
  `tipoFrete` int(11) DEFAULT 0 COMMENT '{ { 0, Retirada }, { 1, PAC }, { 2, SEDEX }, { 3, MOTOBOY }, { 4, TRANSPORTADORA} }',
  `rastreioFrete` varchar(255) DEFAULT NULL,
  `entregaendereco` varchar(50) DEFAULT NULL,
  `entregaNumero` varchar(10) DEFAULT NULL,
  `entregaCompl` varchar(50) DEFAULT NULL,
  `entregaBairro` varchar(30) DEFAULT NULL,
  `entregaCidade` varchar(50) DEFAULT NULL,
  `entregaUF` varchar(2) DEFAULT NULL,
  `entregaCEP` varchar(9) DEFAULT NULL,
  `entregaTelefone` varchar(15) DEFAULT NULL,
  `entregaRefer` varchar(255) DEFAULT NULL,
  `valorTotal` decimal(12,2) DEFAULT NULL,
  `qtdItems` int(11) DEFAULT NULL,
  `dtDevolucao` datetime DEFAULT NULL,
  `motivoDevolucao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProduto` int(11) NOT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `unidadeMedida` varchar(15) DEFAULT NULL,
  `peso` decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
  `cor` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProduto`, `fabricante`, `nome`, `marca`, `idCategoria`, `descricao`, `unidadeMedida`, `peso`, `cor`) VALUES
(1, 'Risqué', 'Azul Turquesa', 'Risqué', NULL, 'Esmalte inovador com elemento Color Effect', 'ml', '8.000', 'Rosa'),
(3, '1', '1', '1', 1, '1', '1', '1.000', 'red'),
(4, '2', '2', '2', 2, '2', '2', '2.000', 'olhos'),
(5, '3', '3', '3', 1, '3', '3', '3.000', '3'),
(6, '4', '2', '2', 2, '2', '2', '2.000', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(64) NOT NULL,
  `idNivelUsuario` int(11) DEFAULT 1,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ativo` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `email`, `senha`, `idNivelUsuario`, `nome`, `cpf`, `endereco`, `bairro`, `cidade`, `uf`, `cep`, `telefone`, `foto`, `ativo`) VALUES
(3, 'cleber@localhost', '123', 1, 'Professor Cleber', '12345678912', '', '', '', '', '', '', '', 'N'),
(5, 'caio', '123', 1, 'Caio Paiva', '1234', 'null', '12234', '12234', 'AC', '1223', '12234', '1244', 'N'),
(14, 'alberto@hotmail.com', '123', 1, 'Adalberto Junior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
(15, 'teste@gmail.com', '123', 2, 'teste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
(19, 'professor', '123', 1, 'Professor Cleber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
(21, 'fulano', '123', 1, 'Fulano Silva', '123', 'Rua 1', 'Bairro', 'Guarulhos', 'AC', '1', '1', '1', 'N'),
(23, 'mayara@gmail.com', '123', 1, 'Mayara do Grau ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`idEstoque`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `institucional`
--
ALTER TABLE `institucional`
  ADD PRIMARY KEY (`idInstituicao`),
  ADD UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `itemspedido`
--
ALTER TABLE `itemspedido`
  ADD PRIMARY KEY (`idItemPedido`),
  ADD KEY `idEstoque` (`idEstoque`);

--
-- Índices para tabela `nivelusuarios`
--
ALTER TABLE `nivelusuarios`
  ADD PRIMARY KEY (`idNivelUsuario`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `idNivelUsuario` (`idNivelUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `idEstoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `institucional`
--
ALTER TABLE `institucional`
  MODIFY `idInstituicao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itemspedido`
--
ALTER TABLE `itemspedido`
  MODIFY `idItemPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nivelusuarios`
--
ALTER TABLE `nivelusuarios`
  MODIFY `idNivelUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`);

--
-- Limitadores para a tabela `itemspedido`
--
ALTER TABLE `itemspedido`
  ADD CONSTRAINT `itemspedido_ibfk_1` FOREIGN KEY (`idEstoque`) REFERENCES `estoque` (`idEstoque`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idNivelUsuario`) REFERENCES `nivelusuarios` (`idNivelUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
