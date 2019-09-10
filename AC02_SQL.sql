/* PARTICIPANTES
Bianca Gama Costa, 1900421
João Vitor D'Arienzo Melo e Silva, 1802472
Lucas Chiavaloni Fereirra Branco, 1900122
Renato Hideo Kuramoto, 1900082
*/

CREATE TABLE Ano
     (
      idAno tinyint IDENTITY NOT NULL,
      ano smallint NOT NULL,
      CONSTRAINT idAno_pk PRIMARY KEY(idAno)
     );

CREATE TABLE Mes
     (
      idMes tinyint IDENTITY (15,3) NOT NULL,
      Mes tinyint NOT NULL,
      CONSTRAINT idMes_pk PRIMARY KEY(idMes)
     );

create table modelo
	(
	idModelo tinyint IDENTITY NOT NULL,
	Descricao varchar(48) NOT NULL,
	CONSTRAINT idModelo_pk PRIMARY KEY(idModelo)
	);

create table Fabricante
	(
	idFabricante tinyint IDENTITY NOT NULL,
	Nome varchar(50) NOT NULL,
	cidade varchar(50) NOT NULL,
	endereco varchar(100) NOT NULL,
	UF char(2) NOT NULL,
	telefone varchar(20) NOT NULL,
	contato varchar(50) NOT NULL,
	CONSTRAINT  idFabricante_pk PRIMARY KEY(idFabricante)
	);

create table Veiculo
	(
	idVeiculo tinyint IDENTITY NOT NULL,
	descrição varchar(50) NOT NULL,
	valor numeric(8,2) NOT NULL,
	idModelo tinyint NOT NULL,
	idFabricante tinyint NOT NULL,
	idAnoFabricacao tinyint NOT NULL,
	dataCompra date NOT NULL,
	CONSTRAINT idVeiculo_pk PRIMARY KEY(idVeiculo),
	CONSTRAINT idModelo_fk FOREIGN KEY(idModelo) REFERENCES modelo(idModelo),
	CONSTRAINT idFabricante_fk FOREIGN KEY(idModelo) REFERENCES Fabricante(idFabricante),
	CONSTRAINT idAnoFabricacao_fk FOREIGN KEY(idAnoFabricacao) REFERENCES Ano(idAno),
	);

create table VendasAnuais
	(
	idVendas tinyint IDENTITY NOT NULL,
	qtd smallint NOT NULL,
	idVeiculo tinyint NOT NULL,
	idAnoDaVenda tinyint NOT NULL,
	idMesDaVenda tinyint NOT NULL,
	CONSTRAINT idVendas_pk PRIMARY KEY(idVendas),
	CONSTRAINT idVeiculo_fk FOREIGN KEY(idVeiculo) REFERENCES Veiculo(idVeiculo),
	CONSTRAINT idAnoDaVenda_fk FOREIGN KEY(idAnoDaVenda) REFERENCES Ano(idAno),
	CONSTRAINT idMesDaVenda_fk FOREIGN KEY(idMesDaVenda) REFERENCES Mes(idMes)
	);
