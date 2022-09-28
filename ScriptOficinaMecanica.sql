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
	constraint fk_pessoas_clientes foreign key (idCPessoas) references pessoas(idPessoas)
    );

-- criação da tabela mecanicos

create table mecanicos(
	idMecanicos int primary key,
    idMPessoas int,
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
    Aval int,
    Superv int,
    primary key (idEMecanicos, idETabelaMO),
    constraint fk_equipe_mecanicos foreign key (idEMecanicos) references mecanicos(idMecanicos),
    constraint fk_equipe_tabela foreign key ( idETabelaMO) references tabelaMO(idTabelaMO)
);

-- criação da tabela tabelaMO

create table tabelaMO(
	idTabelaMO int primary key,
	CHora_Aval int,
	CHora_Manut int,
    CHora_Superv int
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
    Valor varchar(45),
    Pecas varchar(255),
    primary key (idPAutoPecas, idPOrdemServico),
    constraint fk_pecas_autopecas foreign key (idPAutoPecas) references autopecas(idAutoPecas),
    constraint fk_pecas_ordemservico foreign key (idPOrdemServico) references ordemservico(idOrdemServico)
);

-- criação da tabela ordem de serviços

create table ordemservico(
	idOrdemServico int primary key,
    idOClientes int,
    idOEMecanicos int,
    idOTabelaMO int,
    DtEmissao varchar(45),
    DtConclusao varchar(45),
    ClienteStatusOS enum('pendente', 'revisão', 'aprovada'),
    Hr_Aval int,
    Hr_Manut int,
    Hr_Superv int,
    StatusOS enum('Em execucao','Supervisao','Concluida'),
	constraint fk_os_clientes foreign key (idOClientes) references clientes(idClientes),
    constraint fk_os_equipemecanicos foreign key (idEquipeMecanicos) references equipemecanicos(idEMecanicos)
);


-- inserção de dados no BD

-- persistência de dados em pessoas

insert into pessoas(idPessoas, CPF, Nome, Endereço, Celular)
	values (1,30343708933,'Denilson Diaiow','Rua Escondidinho, 37',14947536626),
	       (2,30133378210,'Venilton Vuwow','Av Ventania 256',19966612666),
           (3,20134598633,'July Forgot','Tv Unknown 77',4748630911),
           (4,12346934422,'Otavio Reis','Tv Gamer 169',5340566712),
           (5,11134295844,'Ketlyn Forgot','Rua Chamego,37',47956093377),
           (6,12344577299,'Joao Begood','Tv Apertadinha,5',47943434343),
           (7,23474562591,'Decio Raxadoh','Rua Ipê,36',47933455502),
           (8,23094823904,'Marcio Fueltech','Rua fumacinha,24',47955339088),
           (9,94238404938,'Diego Liasch','Rua tracktananov,324',47939849230);
           
-- persitência de dados em clientes

insert into clientes(idClientes, idCPessoas, Registro_veiculo)
	values (201,3,379634314),
		   (202,5,337766442),
           (203,6,543388993);
           
-- persitência de dados em mecanicos

insert into mecanicos(idMecanicos, idMPessoas, Especialista)
	values (101, 1,'avaliador'),
           (102,4,'manutencao'),
           (103,2,'supervisao'),
           (104,8,'manutencao'),
           (105,7,'manutencao'),
           (106,9,'manutencao');
           
-- persitência de dados em veiculos

insert into veiculos(idVClientes, idVEMecanicos, Marca, Modelo, Placa, Quilometragem)
	values (201,102,'mazda RX8','mzd3000',374000),
           (202,104,'fiat punto','hdd3946',109000),
           (203,106,'ford ka','fka0160',250000); 

-- persitência de dados em equipemecanicos

insert into equipemecanicos(idEMecanicos, idETabelaMO, Aval, Superv)
	values (102,2022,101,103),
           (104,2022,101,103),
           (105,2022,101,103),
           (106,2022,101,103);

-- persitência de dados em tabela MO

insert into tabelaMO(idTabelaMO, CHora_Aval, CHora_Manut, CHora_Superv)
	values (2022,150,165,100),
           (2023,150,165,100),
           (2024,150,165,100);

-- persitência de dados em autopecas

insert into autopecas(idAutoPecas, CNPJ, Rz_social, Endereço, Celular)
	values (301,25450110000133,'FundoDiQuintal Korea Co.','Av Piedade,33',11947465000),
           (302,23450444000245,'AutoPecaz Ltd','Rua Ipe,36',11947335566),
           (303,22323435000344,'Claudius Lin Hao Co.','Tv Desmanche,12',11983834477),
           (304,23174239472478,'Manezinho Cofap Amortecedores','Av do Estado,3500',11944335000),
		   (305,27348927489378,'COBREQ do Brasil','Av Regis Bittencouris,78',11955667000),
           (306,23549854958850,'Filips do Congo','Rua Porto Feliz,50',11945657823); 

-- persitência de dados em pecas

insert into pecas(idPAutoPecas, idPOrdemServico, Valor, Pecas)
	values (301,29,750,'Kit coxim motor, velas, cabos e bobinas'),
           (302,29,550,'Kit coxim cambio, embreagem, atuador e fluido'),
           (303,31,525,'Kit oleo motor, oleo cambio, filtro oleo motor'),
           (304,32,2000,'Kit batentes, amortecedores e guarda pó'),
           (305,30,440,'Kit fluido, discos e pastilhas de freio'),
           (306,30,150,'Kit lampadas H7, H1, R21 e R');
    
-- persitência de dados em ordem de servico 

insert into ordemservico(idOrdemServico, idOClientes, idOEMecanicos, DtEmissao, DtConclusao, ClienteStatusOS, Hr_Aval, Hr_Manut, Hr_Superv, StatusOS, idOTabelaMO)
	values (29,201,102,'2022/09/20','2022/09/20','aprovada',1,3,1,'Concluida',2022),
           (30,202,104,'2022/09/21','2022/09/22','aprovada',1,2,1,'Concluida',2022),
           (31,202,105,'2022/09/21','2022/09/22','aprovada',1,2,1,'Concluida',2022),
           (32,203,106,'2022/09/25','2022/09/25','aprovada',1,3,1,'Concluida',2022);




-- queries complexas para recuperação de dados

-- relação de clientes da oficina mecanica

SELECT idClientes, Nome AS Clientes, Registro_veiculo FROM pessoas, clientes WHERE idPessoas = idCPessoas;

-- relação de mecânicos da oficina mecanica

SELECT idMecanicos, Nome AS Mecanicos, Especialista FROM pessoas, mecanicos WHERE idPessoas = idMPessoas;

-- relação de fornecedores de peças da oficina mecânica

SELECT p.idPAutoPecas, a.Rz_social AS Fornecedores, p.Pecas, p.Valor FROM autopecas a JOIN pecas p ON a.idAutoPecas = p.idPAutoPecas;

-- relatório de ordens de serviços por cliente

SELECT ps.Nome AS Clientes, o.idOrdemServico FROM pessoas ps
	INNER JOIN clientes c ON ps.idPessoas = c.idCPessoas
    INNER JOIN ordemservico o ON c.idClientes = o.idOClientes
    GROUP BY o.idOrdemServico
    HAVING COUNT (o.idOrdemServico) > 0;

-- relatório de avaliações automotiva aprovadas pelos clientes

SELECT ps.Nome, v.Marca, v.Modelo, o.DtEmissao, o.idOrdemServico AS OS,
	((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)) AS VrServico, pe.Valor AS VrPecas,
    ((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)+pe.Valor) AS Total,
    o.ClienteStatusOS AS Aprovacao, pe.Pecas FROM pessoas ps
    
	INNER JOIN clientes c ON ps.idPessoas = c.idCPessoas
    INNER JOIN ordemservico o ON c.idClientes = o.idOClientes
    INNER JOIN veiculos v ON c.idClientes = v.idVClientes
    INNER JOIN tabelaMO t ON t.idTabelaMO = o.idOTabelaMO
    INNER JOIN pecas pe ON pe.idPOrdemServico = o.idOrdemServico
    
    ORDER BY ((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)+pe.Valor);
    
-- relatório de serviços realizados concluídos e revisados para pagamento

SELECT ps.Nome, v.Marca, v.Modelo, o.idOrdemServico AS OS,
	((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)) AS VrServico, pe.Valor AS VrPecas,
    ((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)+pe.Valor) AS Total,
     o.StatusOS, o.DtConclusao FROM pessoas ps
    
	INNER JOIN clientes c ON ps.idPessoas = c.idCPessoas
    INNER JOIN ordemservico o ON c.idClientes = o.idOClientes
    INNER JOIN veiculos v ON c.idClientes = v.idVClientes
    INNER JOIN tabelaMO t ON t.idTabelaMO = o.idOTabelaMO
    INNER JOIN pecas pe ON pe.idPOrdemServico = o.idOrdemServico
    
    ORDER BY ((o.Hr_Aval*t.CHora_Aval)+(o.Hr_Manut*t.CHora_Manut)+(o.Hr_Superv*t.CHora_Superv)+pe.Valor);
    
    
    
    
    
    
     
    
    