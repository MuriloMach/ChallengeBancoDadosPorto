/*Inova X - RM:550790 Lucas dos Santos Lopes, RM:552258 Lais Alves da Silva Cruz,
RM:551823 Gustavo Marques Catelan, RM:550718 Murilo Machado, RM:97900 Victor Taborda Rodrigues*/
/*Na linha "drop table cliente cascade constraints" é utilizada para se excluir a tabela que se chama "cliente"
caso ela já exista. O cascade constraints ele pega tudo que está acoplado à tabela e são excluidas no processo.
Na linha abaixo "create table cliente" estamos denominando a coluna como "cliente", além disso o cpf é um varchar2,seu máximo será 15 caracteres e será uma chave primária(pk)
Ou seja os valores na coluna cpf serão exclusivos em cada linha da tabela e não poderão ser nulos.
Agora definimos a coluna do telefone do cliente com um varchar2 e seu máximo será 14 caracteres, ela também tem sua restrição clie_tel_nn,
só que diferente do cpf ela não será chave primária e terá not null como uma das restrições,que server para nunca ser nulo o campo de telefone.
Dessa vez será o email do cliente e será um varchar2 com no máximo 50 caracteres. Ela também tem suas restrições
que no caso a primeira é o not null e o unique(uk) que serve para garantir que os valores da coluna email sejam únicos em toda a tabela.
E por último na tabela cliente definimos o endereço com um varchar2 e no máximo 60 caracteres. 
Ele tem também sua restrição de not null para ter uma garantia que será posto um valor nessa coluna.
Criamos outras duas colunas de nome e sexo do cliente com restrição not null e seu valor é de varchar2.
Outras colunas que tivemos que criar foi ano_nasc com restrição not null e seu valor é de number(4), senha com restrição de not null e seu valor é varchar2.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "cliente".*/
drop table cliente cascade constraints; 
create table cliente (cpf varchar2(15) constraint clie_cpf_pk primary key,
                        tel_cliente varchar2(14) constraint clie_tel_nn not null,
                        email varchar2(50) constraint clie_ema_nn not null
                                            constraint clie_ema_uk unique,
                        endereco varchar2(60) constraint clie_end_nn not null,
                        nome_cliente varchar2(50) constraint clie_nm_nn not null,
                        sexo_cliente varchar2(15) constraint clie_sx_nn not null,
                        ano_nasc number(4) constraint clie_ano_nn not null,
                        senha varchar2(20) constraint clie_sen_nn not null);
select * from cliente;
/*Essa linha iremos fazer o drop table bike para que se a tabela já existir, seja excluida 
juntos com as restrições que ela obter (chave estrangeira).
Logo após isso iremos criar a tabela bike onde sua primeira coluna será "número de série" que terá 
varchar2 com máximo de 25 caracteres e colocamos uma restrição de not null, a segunda coluna será "ano de fabricação"
e será number, seu máximo é de 4 números com restrição de not null; A terceira coluna é "cor" varchar2 seu máximo é de 10 caracteres com restrição not null.
A última coluna é "modelo" varchar2 onde seu máximo é de 25 caracteres e também tem restição not null.
E por fim é foi adicionado a restrição de primary key para tabela "bike", essa restrição se chama "bike_pk" e será aplicada na coluna
"num_serie",ou seja, assim se torna a chave primária da tabela.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "bike"*/
drop table bike cascade constraints;
create table bike (num_serie varchar2(25) constraint bik_num_serie_nn not null,
                ano_compra number(4) constraint bik_ano_nn not null,
                cor varchar2(10) constraint bik_cor_nn not null,
                modelo varchar2(25) constraint bik_mod_nn not null);
alter table bike add constraint bike_pk primary key(num_serie);
select * from bike;
/*Aqui novamente fizemos o drop table caso a tabela "seguro" já exista ela possa ser excluida junto das restrições que estiverem dentro dela.
Na segunda linha criamos a tabela "seguro" e a primeira coluna que criamos foi "código de seguro" com varchar2 e seu máximo é de 25 caracteres e sua restrição
é not null. A segunda coluna é "data de contratação" com varchar2, seu máximo de 10 caracteres e sua restrição é not null, a terceira coluna "clausulas" com varchar2 e seu máximo é de 500 caracteres
e sua restrição é not null; A quarta coluna é "pagamento" do tipo varchar2, seu máximo é de 50 caracteres e sua restrição é not null para que não possa ser permitido conter valores nulos, 
a quinta coluna e última "num_serie" onde mais tarde iremos fazer uma chave estrangeira(fk) mas nesse momento adicionamos um varchar2 com máximo de 25 caracteres e não contém restrição.
Por fim esse alter table ele executa a restrição da chave primária à tabela "seguro", essa restrição se chamará "seguro_pk" e será adicionada na coluna "cod_seguro". Portanto os valores das 
chaves primárias tem que ser únicos e não podem ser nulos.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "seguro"*/
drop table seguro cascade constraints;
create table seguro (cod_seguro varchar2(25) constraint seg_cod_nn not null,
                    dt_contratacao varchar2(10) constraint seg_dt_nn not null,
                    clausulas varchar2(500) constraint seg_cla_nn not null,
                    pagamento varchar2(50) constraint seg_pag_nn not null,
                    valor_seguro number(6,2) constraint seg_val_nn not null,
                    num_serie varchar2(25));
alter table seguro add constraint seguro_pk primary key(cod_seguro);
select * from seguro;

/*Primeiro criamos o drop table para que seja excluido caso a tabela já exista e o cascade constraints
ele exclui o que está incluso na tabela(como chave estrangeiras) isso caso tenha também 
Após isso criamos a tabela inspecao, a primeira coluna é o "código de série" é varchar2, seu máximo é de 50 caracteres
além disso ela tem a restrição de chave primária, a segunda coluna que criamos é "análise" que é varchar2, seu máximo é de 500 caracteres e
sua restrição nesse caso é not null. 
A terceira coluna que foi criada é "custo" ela é um number(5,2), ou seja, é uma coluna númerica e tem uma precisão de 5 dígitos e 2 casas
decimais e também essa coluna tem a restrição de not null. A quarta coluna que é "data de inspeção" ela é uma coluna de varchar2 com máximo de 10 caracteres e também contém a restrição de not null, a quinta coluna
que é "qtd_inspecao" irá mostrar quantas vezes o cliente já solicitou a inspeção seu valor é number e seu máximo de número é 3 e por fim a sexta coluna é fiscalização que irá mostrar 
como está o processo da inspeção ou se já foi finalizada.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "inspeção"*/
drop table inspecao cascade constraints;
create table inspecao ( cod_serie varchar2(50) constraint ins_cod_pk primary key,
                        analise varchar2(500) constraint ins_ana_nn not null,
                        custo number(5,2) constraint ins_cus_nn not null,
                        dt_inspecao varchar2(10) constraint ins_dt_nn not null,
                        qtd_inspecao number(3) constraint ins_qtd_nn not null,
                        fiscalizacao varchar2(30) constraint ins_fis_nn not null);
select * from inspecao;
/*Na primeira linha repetimos de novo o drop table só que dessa vez digitamos diagnostico caso a tabela já exista.
Logo após ser criada a tabela de diagnóstico e definimos registro_avaria como varchar2,seu máximo de 700 caracteres e ele impõe a restrição
da chave primária(pk)
Depois foi criado a coluna estado_geral como varchar2, seu máximo de 2000 caracteres e colocamos a restrição de not null para que nunca seja nulo
esse campo.
Criamos a coluna danos com varchar2 e máximo de 500 caracteres e novamente colocamos a restrição de not null.
E por último utilizamos a coluna id_sinistro que fica na tabela sinistro, criamos a restrição de chave estrangeira(fk) 
e referimos a tabela sinistro.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "diagnostico"*/
drop table diagnostico cascade constraints;
create table diagnostico (registro_avaria varchar2(700) constraint dg_re_pk primary key,
                        estado_geral varchar2(2000) constraint dg_est_nn not null,
                        danos varchar2(500) constraint dg_dan_nn not null,
                        id_sinistro varchar2(25));                         
select * from diagnostico;
/*Na primeira linha fizemos novamente outro drop table para caso a tabela já exista, possa excluir a tabela e suas restrições.
Com a construção da tabela "gera" foi criado 2 colunas, a primeira foi "inspeção do código de série" ela é a do tipo varchar2
que permite armazenar até 50 caracteres, a segunda coluna foi "diagnostico do registro de avaria" que é do tipo varchar2 que pode 
armazenar 700 caracteres e ambas contém a restrição de not null.
Após a construção das colunas, foi realizado o comando alter table para fazer a restrição de chave primária nas duas colunas de "inspeção e
coluna" isso mostra que a junção dessas duas colunas deve ser único em cada linha da tabela, assim não trará duplicatas com a mesma combinação
nas duas colunas.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa é a tabela "gera"*/
drop table gera cascade constraints;
create table gera (inspecao_cod_serie varchar2(50) constraint ger_insp_cod_ser_nn not null,
                diagnostico_registro_avaria varchar2(700) constraint ger_dg_regs_ava_nn not null);
select * from gera;

/*Este código tem como objetivo criar uma tabela chamada "sinistro" que será usada para registrar informações relacionadas a sinistros ou danos. 
A tabela "sinistro" é projetada para armazenar dados importantes sobre ocorrências de sinistros, como roubos, quebras, gravidade e valor de manutenção.
"id_sinistro" (chave primária): Ela é do tipo varchar2 e pode conter até 30 caracteres.
"roubo": Esta coluna é do tipo varchar2 e pode conter até 20 caracteres. Ela armazena informações relacionadas a roubos ocorridos no contexto do sinistro
"gravidade": é do tipo varchar2 e pode conter até 50 caracteres. Ela é usada para registrar informações sobre quebras que possam estar associadas ao sinistro. 
"valor_manu": é do tipo number(6,2) e é usada para armazenar valores numéricos, representando o custo da manutenção associada ao sinistro.*/
drop table sinistro cascade constraints;
create table sinistro ( id_sinistro varchar2(30) constraint sin_id_pk primary key,
                        roubo varchar2(20) constraint sin_rou_nn not null,
                        quebra varchar2(50) constraint sin_qubr_nn not null,
                        gravidade varchar2(50) constraint sin_gra_nn not null,
                        valor_manu number(6,2) constraint sin_val_nn not null);
select * from sinistro;
/*O primeiro alter table que é do "seguro" ele faz a restrição da chave estrangeira à tabela "seguro",
a restrição se chamará "seg_bike_fk" e ela tem a ver com a coluna "num_serie" e está fazendo referência na tabela "bike".
Ou seja, na tabela "seguro" irá conter valores que terão que existir na coluna "num_serie" da tabela "bike".*/
alter table seguro add constraint seg_bike_fk
foreign key(num_serie) references bike;
/*O segundo alter table eu mencionei acima na explicação da criação da tabela "diagnostico" que eu precisaria fazer ele para criar a restrição da chave
estrangeira e essa restrição que se chama "dg_sinistro_fk" irá ser adicionada à tabela "diagnostico". Além disso ela tem relação com a coluna id_sinistro
e isso mostra que deve contervalores que existirá na coluna "id_sinistro" da tabela "sinistro". Portanto essa restrição garante que cada contéudo adicionado
na tabela diagnostico será associado a um registro válido na tabela "sinistro".*/
alter table diagnostico add constraint dg_sinistro_fk
foreign key(id_sinistro) references sinistro;
/*O terceiro alter table ele tem uma restrição de chave estrangeira(fk) que se chama "ger_dg_fk" e vai ser adicionado à tabela "gera", que tem referência a tabela
"diagnostico" na coluna "registro_avaria", ou seja na coluna "diagnostico_registro_avaria" na tabela gera, terá que conter valores que existam na coluna "registro_avaria"
da tabela "diagnostico". Portanto essa restrição garante que cada contéudo novo registrado na tabela "gera" seja associado a um contéudo que seja válido na tabela "diagnostico".*/
alter table gera add constraint ger_dg_fk 
foreign key(diagnostico_registro_avaria) references diagnostico(registro_avaria);
/*E o último alter table ele adiciona uma restrição de chave estrangeira que se chama "ger_insp_fk" na tabela "gera", ela tem relação com a coluna "inspeção código de série" da tabela "gera"
que está tendo referência na tabela "inspeção" na coluna do "código de série".Portanto a coluna "inspeção do código de série" na tabela "gera" deve conter valores que existam na coluna "cod_serie"
da tabela "inspeção".Consecutivamente essa restrição reforça que cada registro na tabela "gera" estará associado a um contéudo válido na tabela "inspeção."
O commit serve para gravar todas as alterações que foi feita e gravar pernanentemente no banco de dados.*/
alter table gera add constraint ger_insp_fk 
foreign key(inspecao_cod_serie) references inspecao(cod_serie);

/*Agora iremos adicionar valores nas colunas de cada tabela, a primeira é "cliente" e para isso utilizaremos o insert into.*/
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente,sexo_cliente,ano_nasc,senha)
values ('123.456.789-00', '12347-5678', 'cliente@email.com', '123 Paulista', 'Paulo','Masculino',1997,'batman897');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('123.745.785-98','9945871245', 'marinete@gmail.com','Avenida Paulista n78','Marinete','Feminino',2012,'barbie123');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('987.654.321-09', '9876543210', 'joao@email.com', 'Rua Ouro n50', 'João', 'Masculino',1989,'batman1989');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('876.543.210-98', '8765432109', 'leticia@email.com', 'Rua Borba Gato, n99', 'Leticia', 'Feminino',1998,'ellie2010');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('765.432.109-87', '7654321098', 'carlos@email.com', 'Rua Prata, n78', 'Carlos', 'Masculino',1970,'batmanskywalker');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('654.321.098-76', '6543210987', 'laura@email.com', 'Rua marapes, n100', 'Laura', 'Feminino',1940,'jurisvaldo3434');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('543.210.987-65', '5432109876', 'jose@email.com', 'Rua Augusta, n180', 'José', 'Masculino',1990,'narutinho999');


/*A segunda tabela é "bike" e faremos outro insert into*/
insert into bike (num_serie, ano_compra, cor, modelo)
values ('ABC123', 2022, 'Vermelha', 'Modelo A');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('FT7YJK' , 2019, 'Rosa', 'Mountain');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('LEP445', 2002, 'Vermelha', 'Caloi');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('GF7U65', 2020, 'Bege', 'Ziper');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('B6NM90', 2015, 'Prata', 'Caloi');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('NJF872', 2008 , 'Roxa', 'Mountain');
insert into bike (num_serie, ano_compra, cor, modelo)
values ('FR55H8', 2022, 'Azul', 'Ziper');

/*A terceira tabela é "seguro" e faremos outro insert into*/
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('12345ABC', '10-08-23', 'Clausulas do Seguro', 'Pagamento Mensal',200.00,'ABC123');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S951', '2023-01-15', 'Clausulas para Seguro A', 'Cartão de Crédito', 250.00, 'FT7YJK');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S522', '2023-02-20', 'Clausulas para Seguro B', 'Boleto Bancário', 300.00, 'LEP445');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S893', '2023-03-10', 'Clausulas para Seguro C', 'Transferência Bancária', 400.00, 'GF7U65');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S515', '2023-04-05', 'Clausulas para Seguro D', 'Cartão de Crédito', 350.00, 'B6NM90');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S852', '2023-05-15', 'Clausulas para Seguro E', 'Boleto Bancário', 450.00, 'NJF872');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S254', '2023-06-20', 'Clausulas para Seguro F', 'Transferência Bancária', 500.00, 'FR55H8');

/*A quarta tabela é "inspecao" e faremos outro insert into*/
insert into inspecao (cod_serie, analise, custo, dt_inspecao,qtd_inspecao,fiscalizacao)
values ('XCY456', 'Análise da bicicleta em bom estado', 50.00, '13-08-2023',3,'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao,qtd_inspecao,fiscalizacao)
values ('XBY467', 'Análise da bicicleta em otimo estado', 40.00, '10-06-2023',3,'Finalizado');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('ABC133', 'Análise da bicicleta em bom estado', 60.00, '2023-09-25', 2, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('DEF234', 'Análise da bicicleta com desgaste nas rodas', 45.50, '2023-08-15', 1, 'Finalizado');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('GHI345', 'Análise da bicicleta com riscos na pintura', 30.00, '2023-07-05', 2, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('JKL456', 'Análise da bicicleta com problemas no sistema de freios', 75.00, '2023-06-12', 1, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('MNO567', 'Análise da bicicleta em excelente estado', 50.00, '2023-05-20', 3, 'Finalizado');

/*A quinta tabela é "sinistro" e faremos outro insert into*/
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('SEN143','Não houve roubo','Pneu estorou','Grave',1000.23);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('MMP039','Não houve roubo','Guidão Quebrou','Média',7123.45);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('LKZ433','Houve roubo','Não houve quebra','Grave',3987.55);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('WZX088','Não houve roubo','Pedal da bicicleta do lado direito quebrou','Média-Alta', 2534.59);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('ULI900','Não houve roubo','Freio a disco saiu do lugar','Grave',3534.40);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('RFK653','Não houve roubo','Aro quebrou', 'Médio',912.12);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('RS937','Não houve roubo','Pneu frente e trás furou', 'Baixo', 587.99);

/*A sexta tabela é "diagnostico" e faremos outro insert into*/
insert into diagnostico (registro_avaria, estado_geral, danos,id_sinistro)
values ('A avaria em questão refere-se ao momento em que o pneu da bicicleta explodiu devido a vários fatores.
O relato inicial indica que a bicicleta estava em uso, e o ciclista sentiu um impacto súbito e uma perda repentina de controle. 
O estouro do pneu foi o evento central, resultando em situações perigosas, como dificuldade de controle e possível lesão. 
Para evitar explosões de pneus, ciclistas devem manter a manutenção regular, 
verificando a pressão dos pneus e garantindo que esteja dentro das especificações recomendadas pelo fabricante.', 'Danos graves', 'Roda traseira danificada.','SEN143');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A quebra do guidão pode causar acidentes graves devido a problemas na qualidade do material, manutenção inadequada ou uso excessivo. 
Para evitar isso, faça manutenção regular, inspecione rachaduras e opte por guidões de alta qualidade e resistência', 'Seu estado é mediano', 'Guidão quebrado', 'MMP039');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A bicicleta foi roubada', '-', 'Perda total da bicicleta', 'LKZ433');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('Manter a bicicleta requer manutenção regular. Verifique pedais, correntes, freios e rodas para prevenir desgaste e problemas sérios.
Aperte bem os pedais para evitar desgaste prematuro e quebra. 
Investigue causas de avaria para garantir segurança e durabilidade.', 'Estado crítico', 'A bicicleta ainda funciona só que, tem sérios problemas para se locomover', 'WZX088');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manutenção adequada e exposição a condições climáticas adversas. 
O superaquecimento também é um problema, causado por frenagens bruscas. 
Evite esses problemas com manutenção regular, peças de qualidade e condução responsável', 'Condição razoável', 'O disco de freio precisa ser trocado.', 'ULI900');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A causa da quebra do aro pode variar, mas algumas possibilidades incluem desgaste devido ao uso prolongado, 
impactos bruscos, falta de manutenção preventiva, qualidade dos materiais ou problemas de projeto. 
Prevenir avarias requer manutenção regular, buscando desgaste, rachaduras ou danos que possam causar quebras.', 'Condição ruim', 'Aro da bicicleta está quebrado e precisa de substituição.', 'RFK653');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('Avarias podem ocorrer devido a diversos fatores, como objetos estranhos na estrada, buracos, objetos pontiagudos, ou até mesmo desgaste natural do pneu. 
Verificar os pneus cuidadosamente para identificar qualquer objeto estranho alojado neles é importante. 
É crucial manter a manutenção regular dos pneus, verificando a pressão de inflação de acordo com as especificações do fabricante e 
inspecionando-os quanto a danos ou desgaste excessivo. A calibragem adequada dos pneus é essencial para minimizar o risco de furos,
pois pneus subinflados são mais propensos a danos.', 'Condição aceitável', 'Pneu traseiro e o da frente precisam ser substituídos devido aos desgastes.', 'RS937');




/*A sétima tabela é "gera" e faremos outro insert into*/
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('XBY467', 'A quebra do guidão pode causar acidentes graves devido a problemas na qualidade do material, manutenção inadequada ou uso excessivo. 
Para evitar isso, faça manutenção regular, inspecione rachaduras e opte por guidões de alta qualidade e resistência');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('ABC133', 'A bicicleta foi roubada');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('DEF234', 'Manter a bicicleta requer manutenção regular. Verifique pedais, correntes, freios e rodas para prevenir desgaste e problemas sérios.
Aperte bem os pedais para evitar desgaste prematuro e quebra. 
Investigue causas de avaria para garantir segurança e durabilidade.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('GHI345', 'O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manutenção adequada e exposição a condições climáticas adversas. 
O superaquecimento também é um problema, causado por frenagens bruscas. 
Evite esses problemas com manutenção regular, peças de qualidade e condução responsável');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('JKL456', 'A causa da quebra do aro pode variar, mas algumas possibilidades incluem desgaste devido ao uso prolongado, 
impactos bruscos, falta de manutenção preventiva, qualidade dos materiais ou problemas de projeto. 
Prevenir avarias requer manutenção regular, buscando desgaste, rachaduras ou danos que possam causar quebras.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('MNO567', 'Avarias podem ocorrer devido a diversos fatores, como objetos estranhos na estrada, buracos, objetos pontiagudos, ou até mesmo desgaste natural do pneu. 
Verificar os pneus cuidadosamente para identificar qualquer objeto estranho alojado neles é importante. 
É crucial manter a manutenção regular dos pneus, verificando a pressão de inflação de acordo com as especificações do fabricante e 
inspecionando-os quanto a danos ou desgaste excessivo. A calibragem adequada dos pneus é essencial para minimizar o risco de furos,
pois pneus subinflados são mais propensos a danos.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('XCY456', 'O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manutenção adequada e exposição a condições climáticas adversas. 
O superaquecimento também é um problema, causado por frenagens bruscas. 
Evite esses problemas com manutenção regular, peças de qualidade e condução responsável');






/*Agora iremos utilizar as quatro operações fundamentais em banco de dados. Primeiramente iremos fazer os UPDATES, ele é usado para fazer modificações 
nos dados, permitindo que você atualize
os valores de uma ou mais colunas. Na primeira tabela(cliente) alteramos (nome,sexo e endereço),
segunda tabela(Bike) alteramos (cor,modelo,ano de compra),
terceira tabela(Seguro) alteramos (valor do seguro,modelo e ano de compra),
quarta tabela(Inspeção) alteramos (custo,quantidade de inspeção e análise)
quinta tabela(Diagnóstico) alteramos (estado geral e danos)
sexta tabela(Gera) alteramos (diagnostico_registro)
e última tabela é (Sinistro) alteramos (roubo,quebra e gravidade)*/
update cliente set nome_cliente = 'Marina' where cpf = '123.745.785-98';
update cliente set sexo_cliente = 'Feminino' where cpf = '123.456.789-00';
update cliente set endereco = '800 Rua Japão' where cpf = '876.543.210-98';

update bike set cor = 'Branco' where num_serie = 'GF7U65';
update bike set modelo = 'Mountain' where num_serie = 'B6NM90';
update bike set ano_compra = 2018 where num_serie = 'NJF872';

update seguro set valor_seguro = 275.00 where cod_seguro = 'S951';
update seguro set pagamento = 'Cartão de Débito' where cod_seguro = 'S522';
update seguro set dt_contratacao = '2023-03-15' where cod_seguro = 'S893';

update inspecao set custo  = 100 where cod_serie = 'XCY456';
update inspecao set qtd_inspecao  =  5 where cod_serie  = 'XBY467';
update inspecao set analise = 'Dano no guidão esquerdo' where cod_serie = 'DEF234';

update diagnostico set estado_geral = 'Danos graves' where id_sinistro = 'MMP039';
update diagnostico set danos = 'Roda traseira danificada.' where id_sinistro = 'LKZ433';
update diagnostico set danos = 'Pneu traseiro e o da frente precisam ser substituídos devido aos desgastes.' where id_sinistro = 'RFK653';

update gera set diagnostico_registro_avaria = 'Erro no pedal' where inspecao_cod_serie = 'LKYG97B';
update gera set diagnostico_registro_avaria = 'Falha no freio' where inspecao_cod_serie = 'MKPS800';
update gera set diagnostico_registro_avaria = 'Falha no Guidão' where inspecao_cod_serie = 'LKAPS07';

update sinistro set roubo = 'Houve roubo' where id_sinistro = 'SEN143';
update sinistro set quebra = 'Pneus da bicicleta foram roubados' where id_sinistro = 'MMP039';
update sinistro set gravidade = 'Baixa' where id_sinistro = 'LKZ433';

/*A segunda operação que iremos usar dessa vez é o DELETE, que diferente do UPDATE ele é utilizado para excluir registros de uma tabela em banco de dados
com base em suas condições especificadas. E repetimos a mesma sequência que fizemos no UPDATE, só que dessa vez de DELETE. 
Nesses três primeiros DELETES, excluimos os cpf da tabela cliente, o segundo deletes agora da tabela Bike excluimos os números de serie,
no terceiro delete, agora na tabela seguro excluímos os código de seguro. No próximo foi sobre a tabela diagnóstico onde apagamos (código de série, custo e fiscalização),
depois disso excluimos inspecao_cod_serie e diagnostico_registro_avaria da tabela gera. E por fim a última tabela sinistro excluímos dados de id do sinistro, gravidade e roubo.*/
delete from cliente where cpf = '123.456.789-00';
delete from cliente where cpf = '123.745.785-98';
delete from cliente where cpf = '987.654.321-09';

delete from seguro where cod_seguro = 'S893';
delete from seguro where cod_seguro = 'S254';
delete from seguro where cod_seguro = 'S515';

delete from bike where ano_compra = '2020';
delete from bike where modelo = 'Ziper';
delete from bike where cor = 'Prata';

delete from gera where inspecao_cod_serie = 'JKL456';
delete from gera where diagnostico_registro_avaria = 'A bicicleta foi roubada';
delete from gera where inspecao_cod_serie = 'MNO567';

delete from inspecao where cod_serie = 'JKL456';
delete from inspecao where custo = 60;
delete from inspecao where analise = 'Análise da bicicleta em excelente estado';

delete from diagnostico where estado_geral = 'Condição ruim';
delete from diagnostico where id_sinistro = 'LKZ433';
delete from diagnostico where id_sinistro = 'RS937';

delete from sinistro where id_sinistro = 'LKZ433';
delete from sinistro where valor_manu = 912.12;
delete from sinistro where quebra = 'Pneu frente e trás furou';

/*Agora nessa parte fizemos um relatório onde utilizamos Order By para classificar os resultados da consulta
de forma decrescente os valores de seguro e além disso mostra os código de seguro,pagamento e número de série.
Order by ele permite que você apresente dados recuperados da maneira que você preferir, sendo crescente ou decrescente*/
SELECT cod_seguro, pagamento, valor_seguro, num_serie
FROM seguro
ORDER BY valor_seguro DESC;

/*Nessa parte utilizamos três funções(mod,round e trunc) round é usado para arredondar um valor
númerico para um número de casas decimais, trunc tem seu uso para truncar um valor específico de casas decimais
, assim removendo as casas decimais excedentes, sem arrendondamento.
Mod é usado para calcular o resto de divisão de um número por outro.*/
select round (valor_manu) as total_valor from sinistro;
select trunc (valor_manu) as total_valor from sinistro;
select mod (valor_manu,2) as total_valor from sinistro;

/*Aqui fizemos outro relatório usando o Count, que serve para contar o número de registros em um grupo de dados. Nesse caso contamos a quantidade de clientes e seus
respectivos sexos.*/
select sexo_cliente, count(*) "total_clientes"
from cliente
group by sexo_cliente;
 
/*Esse código ele é uma subconsulta que calcula média dos valores valor_manu da tabela Sinistro.
Essa média é utilizada como parte da condição do where e a subconsulta traz de volta um único valor,
que é a média dos valores da coluna valor_manu em toda tabela sinistro. E compara os valores na coluna
valor_manu com a média calculada pela subconsulta.*/
select id_sinistro, valor_manu from sinistro
where valor_manu > (select avg(valor_manu) from sinistro);
 
/*E por último fizemos um relatório usando Left Join. Essa consulta está selecionando colunas como
valor da manutenção e seu Estado geral da tabela diagnostico e sinistro, ou seja, combinando esses dados
com base no relacionamento entre as duas tabelas e tendo como conector o id_sinistro.
O Left Join ele combina duas tabela que tenha algo em comum e retorna todas as linhas da tabela à esquerda
e as correspondentes linhas da tabela à direita, se existir. Caso não haja correspondência as colunas da tabela
à direita serão preenchidas com valores nulos no resultado da sua consulta.*/
SELECT s.valor_manu AS "Valor da manutenção", d.estado_geral AS "Estado Geral"
FROM sinistro s
LEFT JOIN diagnostico d
ON s.id_sinistro = d.id_sinistro;
commit;