create database db_cds;

use db_cds;

select * from funcionarios;
select * from dependentes;
select * from estados;
select * from cidades;
select * from clientes;
select * from conjuges;


select * from titulos;
select * from pedidos;
select * from titulos_pedidos;
desc conjuges;


create table funcionarios
(
	cod_func int not null auto_increment,
    nome_func varchar(100) not null,
    end_func varchar(200) not null,
    sal_func decimal(10,2) not null default 0,
    sexo_func char(1) not null default 'f',
    
    constraint pk_func primary key (cod_func),
	constraint ch_func_1 check (sal_func>=0),
    constraint ch_func_2 check (sexo_func in ('f', 'm', 'o'))
);

insert funcionarios values
	(null,'vânia gabriela pereira','rua a', '2500', 'f'),
    (null,'norberto pereira da silva','rua b','2300','m'),
    (null,'olavo linhares ','rua c','2580','m'),
    (null,'paula da silva','rua d','3000','o'),
    (null,'rolando rocha','rua e','2000','m');

create table dependentes
(
	cod_dep int not null auto_increment,
    cod_func int not null,
    nome_dep varchar(100) not null,
    sexo_dep char(1) not null default 'f',
    
    constraint pk_dep primary key (cod_dep),
    constraint fk_dep foreign key (cod_func) references funcionarios(cod_func),
    constraint ch_dep check (sexo_dep in ('f','m','o'))
);

insert dependentes values
	(null,1,'ana pereira','f'),
	(null,1,'roberto pereira','m'),
	(null,1,'celso pereira','m'),
	(null,3,'brisa linhares','o'),
	(null,3,'mari sol linhares','f'),
	(null,4,'sonia da silva','f');

create table estados
(
	sigla_est char(2) not null,
    nome_est char(50) not null,

	constraint pk_est primary key (sigla_est),
    constraint uq_est unique (nome_est)
);
    
insert estados values
('sp','são paulo'),
('mg','minas gerais'),
('rj','rio de janeiro');
    

create table cidades
(
	cod_cid int not null auto_increment,
    sigla_est char(2) not null,
    nome_cid varchar(100) not null,
    
    constraint pk_cid primary key (cod_cid),
    constraint fk_cid foreign key (sigla_est) references estados(sigla_est)
);

insert cidades values
(null,'sp','são paulo'),
(null,'sp','sorocaba'),
(null,'sp','jundiaí'),
(null,'sp','americana'),
(null,'sp','araraquara'),
(null,'mg','ouro preto'),
(null,'rj','cachoreira de itapemirim');

create table clientes(
	cod_cli int not null auto_increment,
    cod_cid int not null,
    nome_cli varchar(100) not null,
    end_cli varchar(200) not null,
    renda_cli decimal(10,2) not null default 0,
    sexo_cli char(1) not null default 'f',
	
    constraint pk_cli primary key(cod_cli),
    constraint fk_cli foreign key(cod_cid) references cidades(cod_cid),
    constraint ch_cli_1 check (renda_cli>=0),
    constraint ch_cli_2 check (sexo_cli in ('f','m','o'))
);

insert clientes values
(null,1,'josé nogueira','rua a',1500,'m'),
(null,1,'angelo pereira','rua b',2000,'m'),
(null,1,'além mar paranhos','rua c',1500,'o'),
(null,1,'catarina souza','rua d',892,'f'),
(null,1,'vagner costa','rua e',950,'m'),
(null,2,'antenor da costa','rua f',1582,'m'),
(null,2,'maria amélia de souza','rua g',1152.02,'f'),
(null,2,'paulo roberto da silva','rua h',3250,'m'),
(null,3,'fatima de souza','rua i',1632,'f'),
(null,3,'joel da rocha','rua j',2000,'m')
;

create table conjuges
(
	cod_cli int not null,
    nome_conj varchar(100) not null,
    renda_conj decimal(10,2) not null default 0,
    sexo_conj char(1) not null default 'f',

	constraint pk_conj primary key (cod_cli),
    constraint fk_conj foreign key (cod_cli) references clientes (cod_cli),
    constraint ch_conj_1 check (renda_conj>=0),
    constraint ch_conj_2 check (sexo_conj in ('f','m','o'))
);

insert conjuges values
(1,'carla nogueira',2500,'f'),
(2,'emilia pereira',5500,'f'),
(6,'altiva da costa',3000,'o'),
(7,'carlos de souza',3250,'m');

create table artistas(
	cod_art int not null auto_increment,
    nome_art varchar(100)not null,
    
    constraint pk_art primary key(cod_art),
    constraint uq_art unique(nome_art)
);

insert artistas values
	(null,'Marisa Monte'),
	(null,'Baby do Brasil'),
	(null,'Moraes Moreira'),
	(null,'Pepeu Gomes'),
	(null,'Paulinho Boca de Cantor'),
	(null,'Luiz Galvão'),
    (null,'Alceu Valença'),
    (null,'Geraldo Azevedo'),
    (null,'Elba Ramalho'),
    (null,'Carlinhos Brown'),
    (null,'Arnaldo Antunes'),
    (null,'Adriana Calcanhoto'),
    (null,'Aline Barros'),
    (null,'Gal Costa'),
    (null,'Chico Buarque'),
    (null,'Rita Lee'),
    (null,'Skank'),
    (null,'Lulu Santos'),
    (null,'Anitta');

create table gravadoras(
	cod_grav int not null primary key auto_increment,
    nome_grav varchar(50) unique not null

);

insert gravadoras values 
	(null,'Phonomotor'),
	(null,'Biscoito Fino'),
	(null,'Som Livre'),
	(null,'Sony Music'),
	(null,'Universal'),
	(null,'Emi');

create table categorias(
	cod_cat int not null auto_increment,
    nome_cat varchar(50) not null,
    constraint pk_cat primary key (cod_cat),
	constraint uq_cat unique (nome_cat)
    
);

insert categorias values
	(null,'MPB'),
	(null,'Trilha Sonora'),
	(null,'Gospel'),
    (null, 'Rock Nacional');
    
    
    
create table titulos(
		cod_tit int auto_increment,
        cod_cat int not null,
        cod_grav int not null,
        nome_cd varchar(100) not null,
        val_compra decimal(10,2) not null,
        val_cd decimal(10,2) not null,
        qtd_estq int not null,
        
        constraint pk_tit primary key(cod_tit),
        constraint uq_tit unique(nome_cd),
        constraint fk_tit_1 foreign key(cod_cat) references categorias(cod_cat),
        constraint fk_tit_2 foreign key(cod_grav) references gravadoras(cod_grav),
        constraint ch_tit_1 check(val_cd>=0),
        constraint ch_tit_2 check(qtd_estq>=0)
);


insert titulos values
	(null,1,1,'Tribalistas',30,150,1500),
	(null,1,3,'Acabou Chorae Novos Baianos se Encontram',50,200,500),
	(null,1,4,'O GRANDE ENCONTRO',60,120,1000),
	(null,1,2,'Estratosferica',50,70,2000),
	(null,1,2,'A Caravana',55,98,500),
	(null,1,4,'Loucura',30,300,200),
	(null,3,4,'Graça Extraordinária',20,250,100),
	(null,4,2,'Reza',30,130,300),
	(null,1,5,'Recanto',30,90,500),
	(null,1,6,'O Que Você Sabe de Verdade',30,180,1500);
    
create table titulos_artistas (
	cod_tit int not null,
    cod_art int not null,
    
    constraint pk_titart primary key(cod_tit,cod_art),
    constraint fk1_titart foreign key(cod_tit) references titulos(cod_tit),
    constraint fk2_titart foreign key(cod_art) references artistas(cod_art)

);

insert titulos_artistas values
(1,1),
(1,10),
(1,11),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(3,9),
(4,14),
(5,15),
(6,12),
(7,13),
(8,16),
(9,14),
(10,1);

create table pedidos
(
	num_ped int not null auto_increment,
    cod_cli int not null,
    cod_func int not null,
    data_ped datetime not null,
    
    constraint pk_ped primary key(num_ped),
    constraint fk_ped_1 foreign key(cod_cli) references clientes(cod_cli),
    constraint fk_ped_2 foreign key(cod_func) references funcionarios(cod_func)
);

insert pedidos values
	(null,1,2,'2012/05/02'),
	(null,3,4,'2012/05/02'),
	(null,4,5,'2012/06/02'),
	(null,1,4,'2012/03/02'),
	(null,7,5,'2012/03/02'),
	(null,4,4,'2012/03/02'),
	(null,5,5,'2012/03/02'),
	(null,8,2,'2012/03/02'),
	(null,2,2,'2012/03/02'),
	(null,7,1,'2012/03/02');

create table titulos_pedidos(
	num_ped int not null,
    cod_tit int not null,
    qtd_cd int not null,
    val_cd decimal(10,2) not null,
    
    constraint pk_titped primary key (num_ped,cod_tit),
    constraint fk_titped1 foreign key(cod_tit) references titulos(cod_tit),
    constraint fk_titped2 foreign key(num_ped) references pedidos(num_ped),
	constraint ch_titped1 check(qtd_cd>=1),
	constraint ch_titped2 check(val_cd>=0)
);

insert titulos_pedidos values
(1,1,2,150),
(1,2,3,200),
(2,1,1,150),
(2,2,3,200),
(3,1,2,150),
(4,2,3,200),
(5,1,2,150),
(6,2,3,200),
(6,3,1,120),
(7,4,2,70),
(8,1,4,150),
(9,2,3,200),
(10,7,2,250);


