/*Inova X - RM:550790 Lucas dos Santos Lopes, RM:552258 Lais Alves da Silva Cruz,
RM:551823 Gustavo Marques Catelan, RM:550718 Murilo Machado, RM:97900 Victor Taborda Rodrigues*/
/*Na linha "drop table cliente cascade constraints" � utilizada para se excluir a tabela que se chama "cliente"
caso ela j� exista. O cascade constraints ele pega tudo que est� acoplado � tabela e s�o excluidas no processo.
Na linha abaixo "create table cliente" estamos denominando a coluna como "cliente", al�m disso o cpf � um varchar2,seu m�ximo ser� 15 caracteres e ser� uma chave prim�ria(pk)
Ou seja os valores na coluna cpf ser�o exclusivos em cada linha da tabela e n�o poder�o ser nulos.
Agora definimos a coluna do telefone do cliente com um varchar2 e seu m�ximo ser� 14 caracteres, ela tamb�m tem sua restri��o clie_tel_nn,
s� que diferente do cpf ela n�o ser� chave prim�ria e ter� not null como uma das restri��es,que server para nunca ser nulo o campo de telefone.
Dessa vez ser� o email do cliente e ser� um varchar2 com no m�ximo 50 caracteres. Ela tamb�m tem suas restri��es
que no caso a primeira � o not null e o unique(uk) que serve para garantir que os valores da coluna email sejam �nicos em toda a tabela.
E por �ltimo na tabela cliente definimos o endere�o com um varchar2 e no m�ximo 60 caracteres. 
Ele tem tamb�m sua restri��o de not null para ter uma garantia que ser� posto um valor nessa coluna.
Criamos outras duas colunas de nome e sexo do cliente com restri��o not null e seu valor � de varchar2.
Outras colunas que tivemos que criar foi ano_nasc com restri��o not null e seu valor � de number(4), senha com restri��o de not null e seu valor � varchar2.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "cliente".*/
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
/*Essa linha iremos fazer o drop table bike para que se a tabela j� existir, seja excluida 
juntos com as restri��es que ela obter (chave estrangeira).
Logo ap�s isso iremos criar a tabela bike onde sua primeira coluna ser� "n�mero de s�rie" que ter� 
varchar2 com m�ximo de 25 caracteres e colocamos uma restri��o de not null, a segunda coluna ser� "ano de fabrica��o"
e ser� number, seu m�ximo � de 4 n�meros com restri��o de not null; A terceira coluna � "cor" varchar2 seu m�ximo � de 10 caracteres com restri��o not null.
A �ltima coluna � "modelo" varchar2 onde seu m�ximo � de 25 caracteres e tamb�m tem resti��o not null.
E por fim � foi adicionado a restri��o de primary key para tabela "bike", essa restri��o se chama "bike_pk" e ser� aplicada na coluna
"num_serie",ou seja, assim se torna a chave prim�ria da tabela.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "bike"*/
drop table bike cascade constraints;
create table bike (num_serie varchar2(25) constraint bik_num_serie_nn not null,
                ano_compra number(4) constraint bik_ano_nn not null,
                cor varchar2(10) constraint bik_cor_nn not null,
                modelo varchar2(25) constraint bik_mod_nn not null);
alter table bike add constraint bike_pk primary key(num_serie);
select * from bike;
/*Aqui novamente fizemos o drop table caso a tabela "seguro" j� exista ela possa ser excluida junto das restri��es que estiverem dentro dela.
Na segunda linha criamos a tabela "seguro" e a primeira coluna que criamos foi "c�digo de seguro" com varchar2 e seu m�ximo � de 25 caracteres e sua restri��o
� not null. A segunda coluna � "data de contrata��o" com varchar2, seu m�ximo de 10 caracteres e sua restri��o � not null, a terceira coluna "clausulas" com varchar2 e seu m�ximo � de 500 caracteres
e sua restri��o � not null; A quarta coluna � "pagamento" do tipo varchar2, seu m�ximo � de 50 caracteres e sua restri��o � not null para que n�o possa ser permitido conter valores nulos, 
a quinta coluna e �ltima "num_serie" onde mais tarde iremos fazer uma chave estrangeira(fk) mas nesse momento adicionamos um varchar2 com m�ximo de 25 caracteres e n�o cont�m restri��o.
Por fim esse alter table ele executa a restri��o da chave prim�ria � tabela "seguro", essa restri��o se chamar� "seguro_pk" e ser� adicionada na coluna "cod_seguro". Portanto os valores das 
chaves prim�rias tem que ser �nicos e n�o podem ser nulos.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "seguro"*/
drop table seguro cascade constraints;
create table seguro (cod_seguro varchar2(25) constraint seg_cod_nn not null,
                    dt_contratacao varchar2(10) constraint seg_dt_nn not null,
                    clausulas varchar2(500) constraint seg_cla_nn not null,
                    pagamento varchar2(50) constraint seg_pag_nn not null,
                    valor_seguro number(6,2) constraint seg_val_nn not null,
                    num_serie varchar2(25));
alter table seguro add constraint seguro_pk primary key(cod_seguro);
select * from seguro;

/*Primeiro criamos o drop table para que seja excluido caso a tabela j� exista e o cascade constraints
ele exclui o que est� incluso na tabela(como chave estrangeiras) isso caso tenha tamb�m 
Ap�s isso criamos a tabela inspecao, a primeira coluna � o "c�digo de s�rie" � varchar2, seu m�ximo � de 50 caracteres
al�m disso ela tem a restri��o de chave prim�ria, a segunda coluna que criamos � "an�lise" que � varchar2, seu m�ximo � de 500 caracteres e
sua restri��o nesse caso � not null. 
A terceira coluna que foi criada � "custo" ela � um number(5,2), ou seja, � uma coluna n�merica e tem uma precis�o de 5 d�gitos e 2 casas
decimais e tamb�m essa coluna tem a restri��o de not null. A quarta coluna que � "data de inspe��o" ela � uma coluna de varchar2 com m�ximo de 10 caracteres e tamb�m cont�m a restri��o de not null, a quinta coluna
que � "qtd_inspecao" ir� mostrar quantas vezes o cliente j� solicitou a inspe��o seu valor � number e seu m�ximo de n�mero � 3 e por fim a sexta coluna � fiscaliza��o que ir� mostrar 
como est� o processo da inspe��o ou se j� foi finalizada.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "inspe��o"*/
drop table inspecao cascade constraints;
create table inspecao ( cod_serie varchar2(50) constraint ins_cod_pk primary key,
                        analise varchar2(500) constraint ins_ana_nn not null,
                        custo number(5,2) constraint ins_cus_nn not null,
                        dt_inspecao varchar2(10) constraint ins_dt_nn not null,
                        qtd_inspecao number(3) constraint ins_qtd_nn not null,
                        fiscalizacao varchar2(30) constraint ins_fis_nn not null);
select * from inspecao;
/*Na primeira linha repetimos de novo o drop table s� que dessa vez digitamos diagnostico caso a tabela j� exista.
Logo ap�s ser criada a tabela de diagn�stico e definimos registro_avaria como varchar2,seu m�ximo de 700 caracteres e ele imp�e a restri��o
da chave prim�ria(pk)
Depois foi criado a coluna estado_geral como varchar2, seu m�ximo de 2000 caracteres e colocamos a restri��o de not null para que nunca seja nulo
esse campo.
Criamos a coluna danos com varchar2 e m�ximo de 500 caracteres e novamente colocamos a restri��o de not null.
E por �ltimo utilizamos a coluna id_sinistro que fica na tabela sinistro, criamos a restri��o de chave estrangeira(fk) 
e referimos a tabela sinistro.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "diagnostico"*/
drop table diagnostico cascade constraints;
create table diagnostico (registro_avaria varchar2(700) constraint dg_re_pk primary key,
                        estado_geral varchar2(2000) constraint dg_est_nn not null,
                        danos varchar2(500) constraint dg_dan_nn not null,
                        id_sinistro varchar2(25));                         
select * from diagnostico;
/*Na primeira linha fizemos novamente outro drop table para caso a tabela j� exista, possa excluir a tabela e suas restri��es.
Com a constru��o da tabela "gera" foi criado 2 colunas, a primeira foi "inspe��o do c�digo de s�rie" ela � a do tipo varchar2
que permite armazenar at� 50 caracteres, a segunda coluna foi "diagnostico do registro de avaria" que � do tipo varchar2 que pode 
armazenar 700 caracteres e ambas cont�m a restri��o de not null.
Ap�s a constru��o das colunas, foi realizado o comando alter table para fazer a restri��o de chave prim�ria nas duas colunas de "inspe��o e
coluna" isso mostra que a jun��o dessas duas colunas deve ser �nico em cada linha da tabela, assim n�o trar� duplicatas com a mesma combina��o
nas duas colunas.
O select ele serve para fazer uma consulta e mostra todos os registros da tabela em qual ele for utilizado, no caso dessa � a tabela "gera"*/
drop table gera cascade constraints;
create table gera (inspecao_cod_serie varchar2(50) constraint ger_insp_cod_ser_nn not null,
                diagnostico_registro_avaria varchar2(700) constraint ger_dg_regs_ava_nn not null);
select * from gera;

/*Este c�digo tem como objetivo criar uma tabela chamada "sinistro" que ser� usada para registrar informa��es relacionadas a sinistros ou danos. 
A tabela "sinistro" � projetada para armazenar dados importantes sobre ocorr�ncias de sinistros, como roubos, quebras, gravidade e valor de manuten��o.
"id_sinistro" (chave prim�ria): Ela � do tipo varchar2 e pode conter at� 30 caracteres.
"roubo": Esta coluna � do tipo varchar2 e pode conter at� 20 caracteres. Ela armazena informa��es relacionadas a roubos ocorridos no contexto do sinistro
"gravidade": � do tipo varchar2 e pode conter at� 50 caracteres. Ela � usada para registrar informa��es sobre quebras que possam estar associadas ao sinistro. 
"valor_manu": � do tipo number(6,2) e � usada para armazenar valores num�ricos, representando o custo da manuten��o associada ao sinistro.*/
drop table sinistro cascade constraints;
create table sinistro ( id_sinistro varchar2(30) constraint sin_id_pk primary key,
                        roubo varchar2(20) constraint sin_rou_nn not null,
                        quebra varchar2(50) constraint sin_qubr_nn not null,
                        gravidade varchar2(50) constraint sin_gra_nn not null,
                        valor_manu number(6,2) constraint sin_val_nn not null);
select * from sinistro;
/*O primeiro alter table que � do "seguro" ele faz a restri��o da chave estrangeira � tabela "seguro",
a restri��o se chamar� "seg_bike_fk" e ela tem a ver com a coluna "num_serie" e est� fazendo refer�ncia na tabela "bike".
Ou seja, na tabela "seguro" ir� conter valores que ter�o que existir na coluna "num_serie" da tabela "bike".*/
alter table seguro add constraint seg_bike_fk
foreign key(num_serie) references bike;
/*O segundo alter table eu mencionei acima na explica��o da cria��o da tabela "diagnostico" que eu precisaria fazer ele para criar a restri��o da chave
estrangeira e essa restri��o que se chama "dg_sinistro_fk" ir� ser adicionada � tabela "diagnostico". Al�m disso ela tem rela��o com a coluna id_sinistro
e isso mostra que deve contervalores que existir� na coluna "id_sinistro" da tabela "sinistro". Portanto essa restri��o garante que cada cont�udo adicionado
na tabela diagnostico ser� associado a um registro v�lido na tabela "sinistro".*/
alter table diagnostico add constraint dg_sinistro_fk
foreign key(id_sinistro) references sinistro;
/*O terceiro alter table ele tem uma restri��o de chave estrangeira(fk) que se chama "ger_dg_fk" e vai ser adicionado � tabela "gera", que tem refer�ncia a tabela
"diagnostico" na coluna "registro_avaria", ou seja na coluna "diagnostico_registro_avaria" na tabela gera, ter� que conter valores que existam na coluna "registro_avaria"
da tabela "diagnostico". Portanto essa restri��o garante que cada cont�udo novo registrado na tabela "gera" seja associado a um cont�udo que seja v�lido na tabela "diagnostico".*/
alter table gera add constraint ger_dg_fk 
foreign key(diagnostico_registro_avaria) references diagnostico(registro_avaria);
/*E o �ltimo alter table ele adiciona uma restri��o de chave estrangeira que se chama "ger_insp_fk" na tabela "gera", ela tem rela��o com a coluna "inspe��o c�digo de s�rie" da tabela "gera"
que est� tendo refer�ncia na tabela "inspe��o" na coluna do "c�digo de s�rie".Portanto a coluna "inspe��o do c�digo de s�rie" na tabela "gera" deve conter valores que existam na coluna "cod_serie"
da tabela "inspe��o".Consecutivamente essa restri��o refor�a que cada registro na tabela "gera" estar� associado a um cont�udo v�lido na tabela "inspe��o."
O commit serve para gravar todas as altera��es que foi feita e gravar pernanentemente no banco de dados.*/
alter table gera add constraint ger_insp_fk 
foreign key(inspecao_cod_serie) references inspecao(cod_serie);

/*Agora iremos adicionar valores nas colunas de cada tabela, a primeira � "cliente" e para isso utilizaremos o insert into.*/
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente,sexo_cliente,ano_nasc,senha)
values ('123.456.789-00', '12347-5678', 'cliente@email.com', '123 Paulista', 'Paulo','Masculino',1997,'batman897');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('123.745.785-98','9945871245', 'marinete@gmail.com','Avenida Paulista n78','Marinete','Feminino',2012,'barbie123');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('987.654.321-09', '9876543210', 'joao@email.com', 'Rua Ouro n50', 'Jo�o', 'Masculino',1989,'batman1989');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('876.543.210-98', '8765432109', 'leticia@email.com', 'Rua Borba Gato, n99', 'Leticia', 'Feminino',1998,'ellie2010');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('765.432.109-87', '7654321098', 'carlos@email.com', 'Rua Prata, n78', 'Carlos', 'Masculino',1970,'batmanskywalker');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('654.321.098-76', '6543210987', 'laura@email.com', 'Rua marapes, n100', 'Laura', 'Feminino',1940,'jurisvaldo3434');
insert into cliente (cpf, tel_cliente, email, endereco, nome_cliente, sexo_cliente,ano_nasc,senha)
values ('543.210.987-65', '5432109876', 'jose@email.com', 'Rua Augusta, n180', 'Jos�', 'Masculino',1990,'narutinho999');


/*A segunda tabela � "bike" e faremos outro insert into*/
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

/*A terceira tabela � "seguro" e faremos outro insert into*/
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('12345ABC', '10-08-23', 'Clausulas do Seguro', 'Pagamento Mensal',200.00,'ABC123');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S951', '2023-01-15', 'Clausulas para Seguro A', 'Cart�o de Cr�dito', 250.00, 'FT7YJK');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S522', '2023-02-20', 'Clausulas para Seguro B', 'Boleto Banc�rio', 300.00, 'LEP445');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S893', '2023-03-10', 'Clausulas para Seguro C', 'Transfer�ncia Banc�ria', 400.00, 'GF7U65');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S515', '2023-04-05', 'Clausulas para Seguro D', 'Cart�o de Cr�dito', 350.00, 'B6NM90');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S852', '2023-05-15', 'Clausulas para Seguro E', 'Boleto Banc�rio', 450.00, 'NJF872');
insert into seguro (cod_seguro, dt_contratacao, clausulas, pagamento,valor_seguro,num_serie)
values ('S254', '2023-06-20', 'Clausulas para Seguro F', 'Transfer�ncia Banc�ria', 500.00, 'FR55H8');

/*A quarta tabela � "inspecao" e faremos outro insert into*/
insert into inspecao (cod_serie, analise, custo, dt_inspecao,qtd_inspecao,fiscalizacao)
values ('XCY456', 'An�lise da bicicleta em bom estado', 50.00, '13-08-2023',3,'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao,qtd_inspecao,fiscalizacao)
values ('XBY467', 'An�lise da bicicleta em otimo estado', 40.00, '10-06-2023',3,'Finalizado');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('ABC133', 'An�lise da bicicleta em bom estado', 60.00, '2023-09-25', 2, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('DEF234', 'An�lise da bicicleta com desgaste nas rodas', 45.50, '2023-08-15', 1, 'Finalizado');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('GHI345', 'An�lise da bicicleta com riscos na pintura', 30.00, '2023-07-05', 2, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('JKL456', 'An�lise da bicicleta com problemas no sistema de freios', 75.00, '2023-06-12', 1, 'Em andamento');
insert into inspecao (cod_serie, analise, custo, dt_inspecao, qtd_inspecao, fiscalizacao)
values ('MNO567', 'An�lise da bicicleta em excelente estado', 50.00, '2023-05-20', 3, 'Finalizado');

/*A quinta tabela � "sinistro" e faremos outro insert into*/
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('SEN143','N�o houve roubo','Pneu estorou','Grave',1000.23);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('MMP039','N�o houve roubo','Guid�o Quebrou','M�dia',7123.45);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('LKZ433','Houve roubo','N�o houve quebra','Grave',3987.55);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('WZX088','N�o houve roubo','Pedal da bicicleta do lado direito quebrou','M�dia-Alta', 2534.59);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('ULI900','N�o houve roubo','Freio a disco saiu do lugar','Grave',3534.40);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('RFK653','N�o houve roubo','Aro quebrou', 'M�dio',912.12);
insert into sinistro (id_sinistro,roubo,quebra,gravidade,valor_manu)
values ('RS937','N�o houve roubo','Pneu frente e tr�s furou', 'Baixo', 587.99);

/*A sexta tabela � "diagnostico" e faremos outro insert into*/
insert into diagnostico (registro_avaria, estado_geral, danos,id_sinistro)
values ('A avaria em quest�o refere-se ao momento em que o pneu da bicicleta explodiu devido a v�rios fatores.
O relato inicial indica que a bicicleta estava em uso, e o ciclista sentiu um impacto s�bito e uma perda repentina de controle. 
O estouro do pneu foi o evento central, resultando em situa��es perigosas, como dificuldade de controle e poss�vel les�o. 
Para evitar explos�es de pneus, ciclistas devem manter a manuten��o regular, 
verificando a press�o dos pneus e garantindo que esteja dentro das especifica��es recomendadas pelo fabricante.', 'Danos graves', 'Roda traseira danificada.','SEN143');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A quebra do guid�o pode causar acidentes graves devido a problemas na qualidade do material, manuten��o inadequada ou uso excessivo. 
Para evitar isso, fa�a manuten��o regular, inspecione rachaduras e opte por guid�es de alta qualidade e resist�ncia', 'Seu estado � mediano', 'Guid�o quebrado', 'MMP039');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A bicicleta foi roubada', '-', 'Perda total da bicicleta', 'LKZ433');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('Manter a bicicleta requer manuten��o regular. Verifique pedais, correntes, freios e rodas para prevenir desgaste e problemas s�rios.
Aperte bem os pedais para evitar desgaste prematuro e quebra. 
Investigue causas de avaria para garantir seguran�a e durabilidade.', 'Estado cr�tico', 'A bicicleta ainda funciona s� que, tem s�rios problemas para se locomover', 'WZX088');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manuten��o adequada e exposi��o a condi��es clim�ticas adversas. 
O superaquecimento tamb�m � um problema, causado por frenagens bruscas. 
Evite esses problemas com manuten��o regular, pe�as de qualidade e condu��o respons�vel', 'Condi��o razo�vel', 'O disco de freio precisa ser trocado.', 'ULI900');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('A causa da quebra do aro pode variar, mas algumas possibilidades incluem desgaste devido ao uso prolongado, 
impactos bruscos, falta de manuten��o preventiva, qualidade dos materiais ou problemas de projeto. 
Prevenir avarias requer manuten��o regular, buscando desgaste, rachaduras ou danos que possam causar quebras.', 'Condi��o ruim', 'Aro da bicicleta est� quebrado e precisa de substitui��o.', 'RFK653');
insert into diagnostico (registro_avaria, estado_geral, danos, id_sinistro)
values ('Avarias podem ocorrer devido a diversos fatores, como objetos estranhos na estrada, buracos, objetos pontiagudos, ou at� mesmo desgaste natural do pneu. 
Verificar os pneus cuidadosamente para identificar qualquer objeto estranho alojado neles � importante. 
� crucial manter a manuten��o regular dos pneus, verificando a press�o de infla��o de acordo com as especifica��es do fabricante e 
inspecionando-os quanto a danos ou desgaste excessivo. A calibragem adequada dos pneus � essencial para minimizar o risco de furos,
pois pneus subinflados s�o mais propensos a danos.', 'Condi��o aceit�vel', 'Pneu traseiro e o da frente precisam ser substitu�dos devido aos desgastes.', 'RS937');




/*A s�tima tabela � "gera" e faremos outro insert into*/
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('XBY467', 'A quebra do guid�o pode causar acidentes graves devido a problemas na qualidade do material, manuten��o inadequada ou uso excessivo. 
Para evitar isso, fa�a manuten��o regular, inspecione rachaduras e opte por guid�es de alta qualidade e resist�ncia');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('ABC133', 'A bicicleta foi roubada');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('DEF234', 'Manter a bicicleta requer manuten��o regular. Verifique pedais, correntes, freios e rodas para prevenir desgaste e problemas s�rios.
Aperte bem os pedais para evitar desgaste prematuro e quebra. 
Investigue causas de avaria para garantir seguran�a e durabilidade.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('GHI345', 'O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manuten��o adequada e exposi��o a condi��es clim�ticas adversas. 
O superaquecimento tamb�m � um problema, causado por frenagens bruscas. 
Evite esses problemas com manuten��o regular, pe�as de qualidade e condu��o respons�vel');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('JKL456', 'A causa da quebra do aro pode variar, mas algumas possibilidades incluem desgaste devido ao uso prolongado, 
impactos bruscos, falta de manuten��o preventiva, qualidade dos materiais ou problemas de projeto. 
Prevenir avarias requer manuten��o regular, buscando desgaste, rachaduras ou danos que possam causar quebras.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('MNO567', 'Avarias podem ocorrer devido a diversos fatores, como objetos estranhos na estrada, buracos, objetos pontiagudos, ou at� mesmo desgaste natural do pneu. 
Verificar os pneus cuidadosamente para identificar qualquer objeto estranho alojado neles � importante. 
� crucial manter a manuten��o regular dos pneus, verificando a press�o de infla��o de acordo com as especifica��es do fabricante e 
inspecionando-os quanto a danos ou desgaste excessivo. A calibragem adequada dos pneus � essencial para minimizar o risco de furos,
pois pneus subinflados s�o mais propensos a danos.');
insert into gera (inspecao_cod_serie, diagnostico_registro_avaria)
values ('XCY456', 'O desgaste excessivo do disco de freio traseiro pode resultar de uso prolongado sem manuten��o adequada e exposi��o a condi��es clim�ticas adversas. 
O superaquecimento tamb�m � um problema, causado por frenagens bruscas. 
Evite esses problemas com manuten��o regular, pe�as de qualidade e condu��o respons�vel');






/*Agora iremos utilizar as quatro opera��es fundamentais em banco de dados. Primeiramente iremos fazer os UPDATES, ele � usado para fazer modifica��es 
nos dados, permitindo que voc� atualize
os valores de uma ou mais colunas. Na primeira tabela(cliente) alteramos (nome,sexo e endere�o),
segunda tabela(Bike) alteramos (cor,modelo,ano de compra),
terceira tabela(Seguro) alteramos (valor do seguro,modelo e ano de compra),
quarta tabela(Inspe��o) alteramos (custo,quantidade de inspe��o e an�lise)
quinta tabela(Diagn�stico) alteramos (estado geral e danos)
sexta tabela(Gera) alteramos (diagnostico_registro)
e �ltima tabela � (Sinistro) alteramos (roubo,quebra e gravidade)*/
update cliente set nome_cliente = 'Marina' where cpf = '123.745.785-98';
update cliente set sexo_cliente = 'Feminino' where cpf = '123.456.789-00';
update cliente set endereco = '800 Rua Jap�o' where cpf = '876.543.210-98';

update bike set cor = 'Branco' where num_serie = 'GF7U65';
update bike set modelo = 'Mountain' where num_serie = 'B6NM90';
update bike set ano_compra = 2018 where num_serie = 'NJF872';

update seguro set valor_seguro = 275.00 where cod_seguro = 'S951';
update seguro set pagamento = 'Cart�o de D�bito' where cod_seguro = 'S522';
update seguro set dt_contratacao = '2023-03-15' where cod_seguro = 'S893';

update inspecao set custo  = 100 where cod_serie = 'XCY456';
update inspecao set qtd_inspecao  =  5 where cod_serie  = 'XBY467';
update inspecao set analise = 'Dano no guid�o esquerdo' where cod_serie = 'DEF234';

update diagnostico set estado_geral = 'Danos graves' where id_sinistro = 'MMP039';
update diagnostico set danos = 'Roda traseira danificada.' where id_sinistro = 'LKZ433';
update diagnostico set danos = 'Pneu traseiro e o da frente precisam ser substitu�dos devido aos desgastes.' where id_sinistro = 'RFK653';

update gera set diagnostico_registro_avaria = 'Erro no pedal' where inspecao_cod_serie = 'LKYG97B';
update gera set diagnostico_registro_avaria = 'Falha no freio' where inspecao_cod_serie = 'MKPS800';
update gera set diagnostico_registro_avaria = 'Falha no Guid�o' where inspecao_cod_serie = 'LKAPS07';

update sinistro set roubo = 'Houve roubo' where id_sinistro = 'SEN143';
update sinistro set quebra = 'Pneus da bicicleta foram roubados' where id_sinistro = 'MMP039';
update sinistro set gravidade = 'Baixa' where id_sinistro = 'LKZ433';

/*A segunda opera��o que iremos usar dessa vez � o DELETE, que diferente do UPDATE ele � utilizado para excluir registros de uma tabela em banco de dados
com base em suas condi��es especificadas. E repetimos a mesma sequ�ncia que fizemos no UPDATE, s� que dessa vez de DELETE. 
Nesses tr�s primeiros DELETES, excluimos os cpf da tabela cliente, o segundo deletes agora da tabela Bike excluimos os n�meros de serie,
no terceiro delete, agora na tabela seguro exclu�mos os c�digo de seguro. No pr�ximo foi sobre a tabela diagn�stico onde apagamos (c�digo de s�rie, custo e fiscaliza��o),
depois disso excluimos inspecao_cod_serie e diagnostico_registro_avaria da tabela gera. E por fim a �ltima tabela sinistro exclu�mos dados de id do sinistro, gravidade e roubo.*/
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
delete from inspecao where analise = 'An�lise da bicicleta em excelente estado';

delete from diagnostico where estado_geral = 'Condi��o ruim';
delete from diagnostico where id_sinistro = 'LKZ433';
delete from diagnostico where id_sinistro = 'RS937';

delete from sinistro where id_sinistro = 'LKZ433';
delete from sinistro where valor_manu = 912.12;
delete from sinistro where quebra = 'Pneu frente e tr�s furou';

/*Agora nessa parte fizemos um relat�rio onde utilizamos Order By para classificar os resultados da consulta
de forma decrescente os valores de seguro e al�m disso mostra os c�digo de seguro,pagamento e n�mero de s�rie.
Order by ele permite que voc� apresente dados recuperados da maneira que voc� preferir, sendo crescente ou decrescente*/
SELECT cod_seguro, pagamento, valor_seguro, num_serie
FROM seguro
ORDER BY valor_seguro DESC;

/*Nessa parte utilizamos tr�s fun��es(mod,round e trunc) round � usado para arredondar um valor
n�merico para um n�mero de casas decimais, trunc tem seu uso para truncar um valor espec�fico de casas decimais
, assim removendo as casas decimais excedentes, sem arrendondamento.
Mod � usado para calcular o resto de divis�o de um n�mero por outro.*/
select round (valor_manu) as total_valor from sinistro;
select trunc (valor_manu) as total_valor from sinistro;
select mod (valor_manu,2) as total_valor from sinistro;

/*Aqui fizemos outro relat�rio usando o Count, que serve para contar o n�mero de registros em um grupo de dados. Nesse caso contamos a quantidade de clientes e seus
respectivos sexos.*/
select sexo_cliente, count(*) "total_clientes"
from cliente
group by sexo_cliente;
 
/*Esse c�digo ele � uma subconsulta que calcula m�dia dos valores valor_manu da tabela Sinistro.
Essa m�dia � utilizada como parte da condi��o do where e a subconsulta traz de volta um �nico valor,
que � a m�dia dos valores da coluna valor_manu em toda tabela sinistro. E compara os valores na coluna
valor_manu com a m�dia calculada pela subconsulta.*/
select id_sinistro, valor_manu from sinistro
where valor_manu > (select avg(valor_manu) from sinistro);
 
/*E por �ltimo fizemos um relat�rio usando Left Join. Essa consulta est� selecionando colunas como
valor da manuten��o e seu Estado geral da tabela diagnostico e sinistro, ou seja, combinando esses dados
com base no relacionamento entre as duas tabelas e tendo como conector o id_sinistro.
O Left Join ele combina duas tabela que tenha algo em comum e retorna todas as linhas da tabela � esquerda
e as correspondentes linhas da tabela � direita, se existir. Caso n�o haja correspond�ncia as colunas da tabela
� direita ser�o preenchidas com valores nulos no resultado da sua consulta.*/
SELECT s.valor_manu AS "Valor da manuten��o", d.estado_geral AS "Estado Geral"
FROM sinistro s
LEFT JOIN diagnostico d
ON s.id_sinistro = d.id_sinistro;
commit;