-- criação do banco de dados para o cenário de oficina mecanica
create database oficina_mecanica;
use oficina_mecanica;

-- criação da tabela pessoas

create table pessoas(
	idPessoas int primary key,
	CPF char(11) not null,
	Nome varchar(45) not null,
	Endereço varchar(45) not null,
	Celular char(15) not null
);

-- criação da tabela clientes

create table clientes(
	idClientes int primary key,
    idCPessoas int,
    Registro_veiculo varchar(11),
    Proprietario varchar(45),
	constraint fk_pessoas_clientes foreign key (idCPessoas) references pessoas(idPessoas)
    );

-- criação da tabela mecanicos

create table mecanicos(
	idMecanicos int primary key,
    idMPessoas int,
    CodigoTecnico varchar(3),
    Especialista enum('avaliador', 'manutencao', 'supervisao'),
	constraint fk_pessoas_mecanicos foreign key (idMPessoas) references pessoas(idPessoas)
    );
    
-- criação da tabela veiculos

create table veiculos(
	idVClientes int,
    idVEquipeMecanicos int,
    Marca varchar(45),
    Modelo varchar(45),
    Placa varchar(45),
    Quilometragem varchar(45),
    primary key (idVClientes, idVEquipeMecanicos),
    constraint fk_veiculo_clientes foreign key (idVClientes) references clientes(idClientes),
    constraint fk_veiculo_equipe_mecanicos foreign key (idVEquipeMecanicos) references equipemecanicos(idEquipeMecanicos)
);

-- criação da tabela equipemecanicos

create table equipemecanicos(
	idEMecanicos int,
    idETabelaMO int,
    AvaliacaoMecanica varchar(225),
    ConsultaTabelaMO bool,
    GeraOS varchar(45),
    primary key (idEMecanicos, idETabelaMO),
    constraint fk_equipe_mecanicos foreign key (idEMecanicos) references mecanicos(idMecanicos),
    constraint fk_equipe_tabela foreign key ( idETabelaMO) references tabelaMO(idTabelaMO)
);

-- criação da tabela tabelaMO

create table tabelaMO(
	idTabelaMO int primary key,
	CustoHora int,
	PrecoServicos int,
    MOEspecialista enum('avaliador', 'manutenção', 'supervisor')
);

-- criação da tabela auto peças

create table autopecas(
	idAutoPecas int primary key,
	CNPJ char(14) not null,
    Rz_social varchar(45) not null,
	Endereço varchar(45) not null,
	Celular char(15) not null
);

-- criação da tabela peças

create table pecas(
	idPAutoPecas int,
    idPOrdemServico int,
    PeçasAdquiridasTerceiros varchar(45),
    primary key (idPAutoPecas, idPOrdemServico),
    constraint fk_pecas_autopecas foreign key (idPAutoPecas) references autopecas(idAutoPecas),
    constraint fk_pecas_ordemservico foreign key (idPOrdemServico) references ordemservico(idOrdemServico)
);

-- criação da tabela ordem de serviços

create table ordemservico(
	idOrdemServico int primary key,
    idOClientes int,
    idEquipeMecanicos int,
    OrdemServico varchar(45),
    NumOS varchar(45),
    DtEmissao varchar(45),
    DtConclusao varchar(45),
    VrPecas varchar(45),
    MaoDeObra varchar(45),
    VrTotal varchar(45),
    ClienteStatusOS enum('pendente', 'revisão', 'aprovada'),
	constraint fk_os_clientes foreign key (idOClientes) references clientes(idClientes),
    constraint fk_os_equipemecanicos foreign key (idEquipeMecanicos) references equipemecanicos(idEMecanicos)
);

-- criação da tabela execução dos serviços

create table execucaoservicos(
	idServicos int primary key,
    idExOrdemServico int,
    ServicosExecutados enum('Sinalizacao', 'Eletrica', 'Fluidos', 'Freios', 'Suspensao', 'Motor', 'Cambio'),
    StatusOS enum('Em execução', 'Supervisao', 'Concluida'),
	constraint fk_exec_servicos_os foreign key (idExOrdemServico) references ordemservico(idOrdemServico)
    );

-- inserção de dados no BD

-- persistência de dados em pessoas

insert into pessoas(CPF, Nome, Endereço, Celular)
	values (30343708933,'Denilson Diaiow','Rua Escondidinho, 37',14947536626),
	       (30133378210,'Venilton Vuwow','Av Ventania 256',19966612666),
           (20134598633,'July Forgot','Tv Unknown 77',4748630911),
           (12346934422,'Otavio Reis','Tv Gamer 169',5340566712);
           
-- persitência de dados em clientes

insert into clientes(RegistroVeiculo,Proprietario)
	values (379634314,'July Forgot'),
		   (345665778,'Denilson Diaiow'),
           (124598314,'Venilton Vuwow'),
           (123445656,'Otavio Reis');
           
-- persitência de dados em mecanicos

insert into mecanicos(CodigoTecnico, Especialista)
	values (001,'avaliador'),
		   (002,'manutencao'),
           (003,'supervisao');
           
-- persitência de dados em veiculos

insert into veiculos(marca, modelo, placa, quilometragem)
	values ('fiat','palio','hru3832',78000),
		   ('fiat','punto','hdd3946',109000),
           ('ford','ka','fka0160',250000),
           ('mazda','RX8','mzd3000',374000);

-- persitência de dados em equipemecanicos

insert into equipemecanicos(AvaliacaoMecanica, ConsultaTabelaMO, GeraOS)
	values ('Freios, fluidos, cambio',true,'geradaOS'),
		   ('motor, cambio, fluidos, sinalizacao',true,'geradaOS'),
           ('fluidos',true,'geradaOS');

-- persitência de dados em tabela MO

insert into tabelaMO(CustoHora, PrecoServicos, MOEspecialista)
	values (180.00,350.00,'manutencao'),
		   (0.00,120.00,'avaliador'),
           (150.00,0.00,'supervisor');

-- persitência de dados em autopecas

insert into autopecas(CNPJ, Rz_social, Endereço, Celular)
	values (25450110000133,'FundoDiQuintal','Av Piedade,33',11947465000),
		   (23450444000245,'AutoPecaz','Rua Ipe,36',11947335566),
           (22323435000344,'ClaudiusPecas','Tv Desmanche,12',11983834477);

-- persitência de dados em pecas

insert into pecas(PeçasAdquiridasTerceiros)
	values ('oleo de cambio, oleo de motor, filtro de oleo motor'),
		   ('lampadas h1, lampadas h7, lampadas R21'),
           ('coxim motor, coxim cambio'),
           ('velas motor, bobina eletrica, cabos de vela');
    
-- persitência de dados em ordem de servico 

insert into ordemservico(NumOS, DtEmissao, DtConclusao, VrPeças, MaoDeObra, VrTotal, ClienteStatusOS)
	values (29,'2022/09/20','2022/09/22',540.00,2500.00,3040.00,'aprovada'),
		   (30,'2022/09/21','2022/09/23',700.00,1300.00,2000.00,'aprovada'),
           (31,'2022/09/25','2022/09/30',3000.00,4000.00,7000.00,'aprovada');

-- persitência de dados em execução de servicos

insert into execucaoservicos(ServicosExecutados, StatusOS)
	values ('Fluidos','Em execução'),
	       ('Motor, Cambio','Supervisao'),
           ('Suspensao','Concluida');


-- queries complexas para recuperação de dados