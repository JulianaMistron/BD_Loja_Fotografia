USE loja;

create table funcionario
(
codigo int not null,
nome varchar(50) not null,
funcao varchar(30) not null,
depto varchar(20) not null,
telefone varchar(1) not null, 
contato varchar(50) not null
constraint pkfuncionario_loja primary key(codigo)
);

create table endereco_funcionario
(
codigo_funcionario int not null,
logradouro varchar(30) not null,
numero varchar(10) not null,
bairro varchar(30) not null,
cep varchar(8) not null,
cidade varchar(20) not null,
constraint pkendereco_funcionario primary key (codigo_funcionario),
constraint fkendereco_funcionario foreign key (codigo_funcionario) references funcionario(codigo)
);

create table cliente_pf
(
codigo int not null,
nome varchar(50) not null,
data_nasc varchar(8) not null,
sexo char(1) not null,
rg varchar(10) not null, 
cpf varchar(11) not null
constraint pkcliente primary key(codigo)
);

create table cliente_pf_telefone
(
codigo_cliente int not null,
celular varchar(14),
residencial varchar(14),
comercial varchar(14),
constraint pkcliente_pf_telefone primary key(codigo_cliente, celular),
constraint fkcliente_pf_telefone foreign key(codigo_cliente) references cliente_pf(codigo)
);

create table cliente_pf_endereco
(
codigo_cliente int not null,
logradouro varchar(30) not null,
numero varchar(10) not null,
bairro varchar(30) not null,
cep varchar(8) not null,
cidade varchar(20) not null,
constraint pkcliente_pf_endereco primary key(codigo_cliente),
constraint fkcliente_pf_endereco foreign key(codigo_cliente) references cliente_pf(codigo)
);

create table cliente_pj
(
codigo int not null,
nome varchar(50) not null,
cnpj varchar(14) not null,
ie varchar(14) not null,
nome_responsavel varchar(50) not null, 
constraint pkcliente_pj primary key(codigo)
);

create table cliente_pj_telefone
(
codigo_cliente_pj int not null,
empresarial varchar(14),
comercial varchar(14),
constraint pkcliente_pj_telefone primary key(codigo_cliente_pj, comercial),
constraint fkcliente_pj foreign key(codigo_cliente_pj) references cliente_pj(codigo)
);

create table cliente_pj_endereco
(
codigo_cliente int not null,
logradouro varchar(30) not null,
numero varchar(10) not null,
bairro varchar(30) not null,
cep varchar(8) not null,
cidade varchar(20) not null,
constraint pkcliente_pj_endereco primary key(codigo_cliente),
constraint fkcliente_pj foreign key(codigo_cliente) references cliente_pj(codigo)
);

create table item_venda
(
codigo int not null,
qtde varchar(10),
itens varchar(30) not null,
preco varchar(9) not null,
subtotal varchar(9) not null,
codigo_produto int not null,
constraint pkvenda primary key(codigo),
constraint fkproduto foreign key(codigo_produto) references produto(codigo_produto)
);

create table venda
(
numero int not null,
itens varchar(30) not null,
data_venda varchar(8) not null,
cond_pgto varchar(20) not null,
valor_venda varchar(10) not null,
codigo_cliente_pf int not null,
codigo_cliente_pj int not null,
codigo_item_venda int not null,
codigo_funcionario int not null,
constraint pkvenda primary key(numero),
constraint fkcliente_pj foreign key(codigo_cliente_pj) references cliente_pj(codigo),
constraint fkcliente_pf foreign key(codigo_cliente_pf) references cliente_pj(codigo),
constraint fkfuncionario foreign key(codigo_funcionario) references funcionario(codigo),
constraint fkitem_venda foreign key(numero) references item_venda(numero)
);

create table tipo_produto
(
codigo_tipo int not null,
descricao varchar(30) not null,
constraint pkvenda primary key(codigo_tipo)
);

create table produto
(
codigo int not null,
descricao varchar(30) not null,
tipo varchar(30) not null,
preco_custo varchar(9) not null,
preco_venda varchar(9) not null,
qtde_estoque varchar(10) not null,
qtde_minima varchar(10) not null,
constraint pkvenda primary key(codigo),
constraint fktipo_produto foreign key(codigo_tipo) references tipo_produto(codigo_tipo)
);

insert into funcionario(codigo, nome, funcao,depto,telefone,contato)
values (1, 'ana', 'vendedora', 'comercial', '999999999',' mae ana')

insert into endereco_funcionario(codigo_funcionario,logradouro, numero, bairro, cep, cidade)
values (1, 'rua hum','2', 'fonte', '14806058', 'araraquara')

insert into cliente_pf(codigo,nome, data_nasc,sexo,rg,cpf)
values (1, 'bernardo','15051991','m','338523654','35478966548')

insert into cliente_pf_telefone(codigo_cliente,celular,residencial,comercial)
values (1, '987457485','45879632','45874122')

insert into cliente_pf_endereco(codigo_cliente,logradouro, numero, bairro, cep, cidade)
values (1, 'ruadois','10', 'ipes', '14806527', 'araraquara')

insert into cliente_pj(codigo, nome,cnpj, ie,nome_responsavel)
values (1, 'cecilia','07852369888165','11111111111111','jose')

insert into cliente_pj_telefone(codigo_cliente_pj, empresarial,comercial)
values (1, '988888878', '34654789')

insert into cliente_pj_endereco(codigo_cliente,logradouro, numero, bairro, cep, cidade)
values (1, 'rua tres','15', 'tulipas', '14806587', 'araraquara')

insert into venda(numero,numero_venda,itens ,data_venda,cond_pgto,valor_venda)
values (1,1,'filme','3','17052024','dinheiro','20')

insert into item_venda(codigo, qtde,itens,preco,subtotal,codigo_produto)
values (1,'10','filme','20','200','1')

insert into tipo_produto(codigo_tipo,descricao)
values (1,'filme')

insert into produto(codigo, descricao,tipo, preco_custo, preco_venda, qtde_estoque, qtde_minima)
values (1,'filme', 'filme fotografico','10','20','5','3')


select * from funcionario;
select * from endereco_funcionario;
select * from cliente_pf;
select * from cliente_pf_telefone;
select * from cliente_pf_endereco;
select * from cliente_pj;
select * from cliente_pj_telefone;
select * from venda;
select * from item_venda;
select * from produto;
select * from tipo_produto;
