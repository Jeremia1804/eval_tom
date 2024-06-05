create database eval2;
\c eval2

create table admin(
    id serial primary key,
    login varchar(50),
    pwd varchar(80)
);

insert into admin (login,pwd) values('admin','password');


create table equipe(
    idequipe serial primary key,
    nom varchar(50),
    login varchar(50) unique,
    pwd varchar(80)
);


create table categorie(
    idcategorie serial primary key,
    nom varchar(30),
    sexe varchar(5),
    minage int,
    maxage int
);

create table coureur(
    idcoureur serial primary key,
    nom varchar(50),
    numero int,
    genre varchar(10),
    dtn date,
    idequipe int,
    foreign key (idequipe) references equipe(idequipe)
);

create table categorie_coureur(
    idcategorie_coureur serial primary key,
    idcategorie int,
    idcoureur int,
    foreign key (idcategorie) references categorie(idcategorie),
    foreign key (idcoureur) references coureur(idcoureur)
);

create table etape(
    idetape serial primary key,
    nom varchar(50),
    rang int,
    nombre_coureur int,
    longueur double precision,
    debut timestamp
);

create table etape_coureur(
    idetape_coureur serial primary key,
    idetape int,
    idcoureur int,
    foreign key (idetape) references etape(idetape),
    foreign key (idcoureur) references coureur(idcoureur)
);

create table point(
    idpoint serial primary key,
    classement int,
    valeur double precision
);

create table participation(
    idparticipation serial primary key,
    idcoureur int,
    idetape int,
    arrive timestamp,
    chrono double precision,
    foreign key (idetape) references etape(idetape),
    foreign key (idcoureur) references coureur(idcoureur)
);

create table penalite(
    idpenalite serial primary key,
    idcoureur int,
    idetape int,
    penalite double precision,
    foreign key (idetape) references etape(idetape),
    foreign key (idcoureur) references coureur(idcoureur)
);

insert into point (classement,valeur) values (1,10);
insert into point (classement,valeur) values (2,4);
insert into point (classement,valeur) values (3,2);


insert into equipe (nom,login,pwd) values('EQ1','equipe1','password1');
insert into equipe (nom,login,pwd) values('EQ2','equipe2','password2');
insert into equipe (nom,login,pwd) values('EQ3','equipe3','password3');

insert into categorie (idcategorie, nom) values(1,'Homme');
insert into categorie (idcategorie, nom) values(2,'Femme');
insert into categorie (idcategorie, nom) values(3,'Junior');
insert into categorie (idcategorie, nom) values(4,'Senior');

insert into etape (idetape,nom,rang,nombre_coureur,longueur,debut) values (1,'Ambanidia',1,4,7,'02-06-2024 07:00:00');
insert into etape (idetape,nom,rang,nombre_coureur,longueur,debut) values (2,'Quartz',2,2,15,'02-06-2024 11:30:00');
insert into etape (idetape,nom,rang,nombre_coureur,longueur,debut) values (3,'Cite',3,3,8,'02-06-2024 16:15:00');
insert into etape (idetape,nom,rang,nombre_coureur,longueur,debut) values (4,'Tsimbazaza',4,2,12,'03-06-2024 09:45:00');


insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (1,'Coureur1',1,'m','1998-11-06',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (2,'Coureur2',2,'m','1992-05-03',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (3,'Coureur3',3,'m','2000-07-22',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (4,'Coureur4',4,'m','2000-09-15',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (5,'Coureur5',5,'f','1999-01-12',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (6,'Coureur6',6,'f','2003-11-06',1);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (7,'Coureur7',7,'f','2005-07-13',1);

insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (8,'Coureur8',8,'m','1998-11-06',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (9,'Coureur9',9,'m','1992-05-03',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (10,'Coureur10',10,'m','2000-07-22',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (11,'Coureur11',11,'m','2000-09-15',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (12,'Coureur12',12,'f','1999-01-12',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (13,'Coureur13',13,'f','2003-11-06',2);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (14,'Coureur14',14,'f','2005-07-13',2);

insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (15,'Coureur15',15,'m','1998-11-06',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (16,'Coureur16',16,'m','1992-05-03',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (17,'Coureur17',17,'m','2000-07-22',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (18,'Coureur18',18,'m','2000-09-15',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (19,'Coureur19',19,'f','1999-01-12',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (20,'Coureur20',20,'f','2003-11-06',3);
insert into coureur (idcoureur,nom,numero,genre,dtn,idequipe) values (21,'Coureur21',21,'f','2005-07-13',3);

insert into categorie_coureur (idcategorie,idcoureur) values (1,1);
insert into categorie_coureur (idcategorie,idcoureur) values (4,1);
insert into categorie_coureur (idcategorie,idcoureur) values (1,2);
insert into categorie_coureur (idcategorie,idcoureur) values (4,2);
insert into categorie_coureur (idcategorie,idcoureur) values (1,3);
insert into categorie_coureur (idcategorie,idcoureur) values (3,3);
insert into categorie_coureur (idcategorie,idcoureur) values (1,4);
insert into categorie_coureur (idcategorie,idcoureur) values (3,4);
insert into categorie_coureur (idcategorie,idcoureur) values (2,5);
insert into categorie_coureur (idcategorie,idcoureur) values (4,5);
insert into categorie_coureur (idcategorie,idcoureur) values (2,6);
insert into categorie_coureur (idcategorie,idcoureur) values (3,6);
insert into categorie_coureur (idcategorie,idcoureur) values (2,7);
insert into categorie_coureur (idcategorie,idcoureur) values (3,7);
insert into categorie_coureur (idcategorie,idcoureur) values (1,8);
insert into categorie_coureur (idcategorie,idcoureur) values (4,8);
insert into categorie_coureur (idcategorie,idcoureur) values (1,9);
insert into categorie_coureur (idcategorie,idcoureur) values (4,9);
insert into categorie_coureur (idcategorie,idcoureur) values (1,10);
insert into categorie_coureur (idcategorie,idcoureur) values (3,10);
insert into categorie_coureur (idcategorie,idcoureur) values (1,11);
insert into categorie_coureur (idcategorie,idcoureur) values (3,11);
insert into categorie_coureur (idcategorie,idcoureur) values (2,12);
insert into categorie_coureur (idcategorie,idcoureur) values (4,12);
insert into categorie_coureur (idcategorie,idcoureur) values (2,13);
insert into categorie_coureur (idcategorie,idcoureur) values (3,13);
insert into categorie_coureur (idcategorie,idcoureur) values (2,14);
insert into categorie_coureur (idcategorie,idcoureur) values (3,14);
insert into categorie_coureur (idcategorie,idcoureur) values (1,15);
insert into categorie_coureur (idcategorie,idcoureur) values (4,15);
insert into categorie_coureur (idcategorie,idcoureur) values (1,16);
insert into categorie_coureur (idcategorie,idcoureur) values (4,16);
insert into categorie_coureur (idcategorie,idcoureur) values (1,17);
insert into categorie_coureur (idcategorie,idcoureur) values (3,17);
insert into categorie_coureur (idcategorie,idcoureur) values (1,18);
insert into categorie_coureur (idcategorie,idcoureur) values (3,18);
insert into categorie_coureur (idcategorie,idcoureur) values (2,19);
insert into categorie_coureur (idcategorie,idcoureur) values (4,19);
insert into categorie_coureur (idcategorie,idcoureur) values (2,20);
insert into categorie_coureur (idcategorie,idcoureur) values (3,20);
insert into categorie_coureur (idcategorie,idcoureur) values (2,21);
insert into categorie_coureur (idcategorie,idcoureur) values (3,21);

insert into participation(idcoureur,idetape,arrive) values (1,1,'2024-06-02 08:15:26');
insert into participation(idcoureur,idetape,arrive) values (5,1,'2024-06-02 08:45:26');
insert into participation(idcoureur,idetape,arrive) values (3,1,'2024-06-02 08:30:26');
insert into participation(idcoureur,idetape,arrive) values (6,1,'2024-06-02 09:26:26');
insert into participation(idcoureur,idetape,arrive) values (9,1,'2024-06-02 08:22:26');
insert into participation(idcoureur,idetape,arrive) values (10,1,'2024-06-02 08:14:26');
insert into participation(idcoureur,idetape,arrive) values (14,1,'2024-06-02 08:41:26');
insert into participation(idcoureur,idetape,arrive) values (11,1,'2024-06-02 08:50:26');
insert into participation(idcoureur,idetape,arrive) values (20,1,'2024-06-02 10:33:26');
insert into participation(idcoureur,idetape,arrive) values (18,1,'2024-06-02 09:40:26');
insert into participation(idcoureur,idetape,arrive) values (16,1,'2024-06-02 08:11:26');

insert into participation(idcoureur,idetape,arrive) values (2,2,'2024-06-02 13:15:26');
insert into participation(idcoureur,idetape,arrive) values (4,2,'2024-06-02 15:45:26');
insert into participation(idcoureur,idetape,arrive) values (12,2,'2024-06-02 13:22:26');
insert into participation(idcoureur,idetape,arrive) values (13,2,'2024-06-02 14:14:26');
insert into participation(idcoureur,idetape,arrive) values (21,2,'2024-06-02 15:33:26');
insert into participation(idcoureur,idetape,arrive) values (15,2,'2024-06-02 14:40:26');

insert into participation(idcoureur,idetape,arrive) values (7,3,'2024-06-02 19:15:26');
insert into participation(idcoureur,idetape,arrive) values (1,3,'2024-06-02 18:45:26');
insert into participation(idcoureur,idetape,arrive) values (6,3,'2024-06-02 20:45:26');
insert into participation(idcoureur,idetape,arrive) values (8,3,'2024-06-02 18:22:26');
insert into participation(idcoureur,idetape,arrive) values (11,3,'2024-06-02 19:00:26');
insert into participation(idcoureur,idetape,arrive) values (10,3,'2024-06-02 19:14:26');
insert into participation(idcoureur,idetape,arrive) values (17,3,'2024-06-02 20:33:26');
insert into participation(idcoureur,idetape,arrive) values (19,3,'2024-06-02 18:06:26');
insert into participation(idcoureur,idetape,arrive) values (16,3,'2024-06-02 19:40:26');

insert into participation(idcoureur,idetape,arrive) values (2,4,'2024-06-03 13:15:26');
insert into participation(idcoureur,idetape,arrive) values (3,4,'2024-06-03 11:45:26');
insert into participation(idcoureur,idetape,arrive) values (14,4,'2024-06-03 12:22:26');
insert into participation(idcoureur,idetape,arrive) values (9,4,'2024-06-03 12:14:26');
insert into participation(idcoureur,idetape,arrive) values (20,4,'2024-06-03 11:33:26');
insert into participation(idcoureur,idetape,arrive) values (15,4,'2024-06-03 13:40:26');

insert into etape_coureur(idcoureur,idetape) values (1,1);
insert into etape_coureur(idcoureur,idetape) values (5,1);
insert into etape_coureur(idcoureur,idetape) values (3,1);
insert into etape_coureur(idcoureur,idetape) values (6,1);
insert into etape_coureur(idcoureur,idetape) values (9,1);
insert into etape_coureur(idcoureur,idetape) values (10,1);
insert into etape_coureur(idcoureur,idetape) values (14,1);
insert into etape_coureur(idcoureur,idetape) values (11,1);
insert into etape_coureur(idcoureur,idetape) values (20,1);
insert into etape_coureur(idcoureur,idetape) values (18,1);
insert into etape_coureur(idcoureur,idetape) values (16,1);
insert into etape_coureur(idcoureur,idetape) values (17,1);

insert into etape_coureur(idcoureur,idetape) values (2,2);
insert into etape_coureur(idcoureur,idetape) values (4,2);
insert into etape_coureur(idcoureur,idetape) values (12,2);
insert into etape_coureur(idcoureur,idetape) values (13,2);
insert into etape_coureur(idcoureur,idetape) values (21,2);
insert into etape_coureur(idcoureur,idetape) values (15,2);

insert into etape_coureur(idcoureur,idetape) values (7,3);
insert into etape_coureur(idcoureur,idetape) values (1,3);
insert into etape_coureur(idcoureur,idetape) values (6,3);
insert into etape_coureur(idcoureur,idetape) values (8,3);
insert into etape_coureur(idcoureur,idetape) values (11,3);
insert into etape_coureur(idcoureur,idetape) values (10,3);
insert into etape_coureur(idcoureur,idetape) values (17,3);
insert into etape_coureur(idcoureur,idetape) values (19,3);
insert into etape_coureur(idcoureur,idetape) values (16,3);

insert into etape_coureur(idcoureur,idetape) values (2,4);
insert into etape_coureur(idcoureur,idetape) values (3,4);
insert into etape_coureur(idcoureur,idetape) values (14,4);
insert into etape_coureur(idcoureur,idetape) values (9,4);
insert into etape_coureur(idcoureur,idetape) values (20,4);
insert into etape_coureur(idcoureur,idetape) values (15,4);


create view v_etape_coureur as (
select e.*,eq.idequipe from etape_coureur e 
join coureur c on e.idcoureur = c.idcoureur
join equipe eq on eq.idequipe = c.idequipe
);


create or replace view resultat as (
select
    e.idetape_coureur,
    e.idetape,
    e.idequipe,
    e.idcoureur,
    c.nom,
    c.numero,
    (p.arrive-et.debut) as duree_formatted,
    EXTRACT(EPOCH FROM p.arrive - et.debut) AS duree_seconde,
    case when vp.penalite is null then 0 else vp.penalite end
from v_etape_coureur e
left join participation p on p.idetape = e.idetape and p.idcoureur = e.idcoureur
join etape et on et.idetape = e.idetape
join coureur c on c.idcoureur = e.idcoureur
left join v_pen_coureur vp on vp.idetape = e.idetape and vp.idcoureur = e.idcoureur
);

-- select TO_CHAR((interval '1 second' * duree_seconde), 'HH24:MI:SS') AS formatted_time from resultat;
-- select EXTRACT(EPOCH FROM duree_formatted) AS total_seconds from resultat;

create or replace view result_fin as (
select  * from (
select
DENSE_RANK() OVER (PARTITION BY r.idetape, c.idcategorie ORDER BY (r.duree_seconde+r.penalite)) AS rang,
r.idetape,c.idcategorie,r.idcoureur,co.idequipe, r.duree_seconde,r.duree_formatted, r.penalite,
r.duree_seconde+r.penalite as new_duree_sec,
(TO_CHAR((interval '1 second' * r.penalite), 'HH24:MI:SS')) as pen_formatted
from resultat r
join categorie_coureur c on r.idcoureur = c.idcoureur
join coureur co on co.idcoureur = r.idcoureur
) vu
union select * from (
select
DENSE_RANK() OVER (PARTITION BY r.idetape ORDER BY (r.duree_seconde+r.penalite)) AS rang,
r.idetape,0 as idcategorie,r.idcoureur,co.idequipe, r.duree_seconde,r.duree_formatted,r.penalite,
r.duree_seconde+r.penalite as new_duree_sec,
(TO_CHAR((interval '1 second' * r.penalite), 'HH24:MI:SS')) as pen_formatted
from resultat r
join coureur co on co.idcoureur = r.idcoureur
) as vu1
);

-- voloany

create or replace view result_final_point_last aS (
    select r.*,(r.duree_formatted+r.pen_formatted) as new_duree_formatted,case when p.classement is null then 0 else p.valeur end as point from result_fin r
    left join point p on p.classement = r.rang
);


create or replace view result_final_point aS (
    select * from result_final_point_last r
    union
    select * from (
    select
    DENSE_RANK() OVER (PARTITION BY vu.idcategorie ORDER BY vu.point DESC) AS rang,
    vu.idetape,
    vu.idcategorie,
    vu.idcoureur,
    vu.idequipe,
    vu.duree_seconde,
    vu.duree_formatted,
    vu.penalite,
    vu.pen_formatted,
    vu.new_duree_sec,
    vu.new_duree_formatted,
    vu.point
    from (
    select 0 as idetape, rl.idcoureur, rl.idequipe,rl.idcategorie, sum(rl.duree_seconde) as duree_seconde, sum(rl.duree_formatted) as duree_formatted,
    sum(rl.penalite) as penalite,
    sum(rl.pen_formatted) as pen_formatted,
    sum(rl.new_duree_sec) as new_duree_sec,
    sum(new_duree_formatted) as new_duree_formatted, sum(rl.point) as point from result_final_point_last rl 
    group by rl.idcoureur, rl.idequipe,rl.idcategorie
    ) vu
    ) quoi
);

-- farany


create or replace view classement_equipe as (
    select
    ROW_NUMBER() OVER (ORDER BY vu.point) AS rang,
    DENSE_RANK() OVER (PARTITION BY vu.idetape,vu.idcategorie ORDER BY vu.point desc) as laharana,
    vu.idetape, vu.idcategorie, vu.idequipe, e.nom as nomequipe, vu.point
    from (
    select r.idetape,r.idcategorie,r.idequipe,sum(point) as point
    from result_final_point r
    group by r.idetape,r.idcategorie,r.idequipe ) vu
    join equipe e on e.idequipe = vu.idequipe
);


create or replace view classement_coureur as (
    select
    ROW_NUMBER() OVER (ORDER BY r.point) AS id,
    r.rang,
    r.idetape,
    r.idcategorie,
    r.idequipe,
    c.idcoureur,
    c.nom,
    c.numero,
    e.nom as nomequipe,
    r.duree_formatted,
    r.duree_seconde,
    r.new_duree_formatted,
    r.new_duree_sec,
    r.point
    from result_final_point r
    join coureur c on c.idcoureur = r.idcoureur
    join equipe e on e.idequipe = r.idequipe
);

-- manomboka eto alefa TOm aa de afaka manao import otran olon kafa enao ee

alter table categorie add sexe varchar(5);
alter table categorie add minage int;
alter table categorie add maxage int;

update categorie set sexe='F' where idcategorie = 2;
update categorie set sexe='M' where idcategorie = 1;
update categorie set minage=0, maxage=18 where idcategorie = 3;
update categorie set minage=18, maxage=1000 where idcategorie = 4;
update categorie set minage=0, maxage=1000 where idcategorie < 3;

-- insert into categorie (nom,sexe,minage,maxage) values('Homme', 'M', 0,1000);
-- insert into categorie (nom,sexe,minage,maxage) values('Femme', 'F', 0,1000);
-- insert into categorie (nom,sexe,minage,maxage) values('Junior', null, 0,18);
-- insert into categorie (nom,sexe,minage,maxage) values('Senior', null, 18,1000);

create view v_catego_coureur as (
select vu.idcoureur,c.idcategorie from (
select idcoureur,genre,EXTRACT(YEAR FROM now()) - EXTRACT(YEAR FROM dtn) as age from coureur
) vu 
cross join categorie c
where (vu.age<= c.maxage and vu.age>minage) and (vu.genre = c.sexe or c.sexe is null)
);

select * from v_catego_coureur v 
left join categorie_coureur c on c.idcoureur = v.idcoureur and c.idcategorie = v.idcategorie
where c.idcategorie_coureur is null;

-- iyoijui

create or replace view champion as (
select
ROW_NUMBER() OVER (ORDER BY c.point) as id,
c.idcategorie,c.idequipe,ca.nom,c.nomequipe,c.point
from classement_equipe c
join categorie ca on ca.idcategorie = c.idcategorie 
where c.idetape = 0 and c.laharana = 1
);

-- Eto ndrai zalah amzay mety le penalite ee
drop table penalite;

create table penalite(
    idpenalite serial primary key,
    idequipe int,
    idetape int,
    penalite double precision,
    foreign key (idetape) references etape(idetape),
    foreign key (idequipe) references equipe(idequipe)
);

create or replace view v_penalite as (
    select p.idpenalite,e.nom as nomequipe, et.nom as nometape,
    TO_CHAR((interval '1 second' * p.penalite), 'HH24:MI:SS') AS chrono,
    p.penalite
    from penalite p
    join equipe e on e.idequipe = p.idequipe
    join etape et on et.idetape = p.idetape
);

create view v_pen_coureur as (
select p.idetape,c.idcoureur,sum(p.penalite) as penalite from coureur c 
join penalite p on c.idequipe = p.idequipe 
group by p.idetape,c.idcoureur
);

create or replace view resultat as (
select
    e.idetape_coureur,
    e.idetape,
    e.idequipe,
    e.idcoureur,
    c.nom,
    c.numero,
    (p.arrive-et.debut) as duree_formatted,
    EXTRACT(EPOCH FROM p.arrive - et.debut) AS duree_seconde,
    case when vp.penalite is null then 0 else vp.penalite end
from v_etape_coureur e
left join participation p on p.idetape = e.idetape and p.idcoureur = e.idcoureur
join etape et on et.idetape = e.idetape
join coureur c on c.idcoureur = e.idcoureur
left join v_pen_coureur vp on vp.idetape = e.idetape and vp.idcoureur = e.idcoureur
);

create or replace view result_fin as (
select  * from (
select
DENSE_RANK() OVER (PARTITION BY r.idetape, c.idcategorie ORDER BY (r.duree_seconde+r.penalite)) AS rang,
r.idetape,c.idcategorie,r.idcoureur,co.idequipe, r.duree_seconde,r.duree_formatted, r.penalite from resultat r
join categorie_coureur c on r.idcoureur = c.idcoureur
join coureur co on co.idcoureur = r.idcoureur
) vu
union select * from (
select
DENSE_RANK() OVER (PARTITION BY r.idetape ORDER BY (r.duree_seconde+r.penalite)) AS rang,
r.idetape,0 as idcategorie,r.idcoureur,co.idequipe, r.duree_seconde,r.duree_formatted,r.penalite from resultat r
join coureur co on co.idcoureur = r.idcoureur
) as vu1
);


-- ty zalah avereno alefa aloha aa

create or replace view v_pen_coureur as (
select p.idetape,c.idcoureur,sum(p.penalite) as penalite from coureur c 
join penalite p on c.idequipe = p.idequipe 
group by p.idetape,c.idcoureur
);


-- ty atao zalah pour le mise a jour aa
create or replace view v_sum_pen_equipe as (
select vu.*,(interval '1 second' * vu.penalite) AS penalite_formatted from (
select p.idetape,p.idequipe,sum(p.penalite) as penalite from penalite p
group by p.idetape,p.idequipe
) vu
);



drop view champion;
drop view classement_equipe;
drop view classement_coureur;
drop view result_final_point;
drop view result_final_point_last;
drop view result_fin;

create or replace view result_fin as (
SELECT * FROM (
        SELECT
            DENSE_RANK() OVER (PARTITION BY r.idetape, c.idcategorie ORDER BY (r.duree_seconde + r.penalite)) AS rang,
            r.idetape,
            c.idcategorie,
            r.idcoureur,
            co.idequipe,
            r.duree_seconde,
            (interval '1 second' * r.duree_seconde) AS duree_formatted,
            r.penalite,
            (interval '1 second' * r.penalite) AS pen_formatted,
            r.duree_seconde + r.penalite AS new_duree_sec
        FROM resultat r
        JOIN categorie_coureur c ON r.idcoureur = c.idcoureur
        JOIN coureur co ON co.idcoureur = r.idcoureur
    ) vu
    UNION
    SELECT * FROM (
        SELECT
            DENSE_RANK() OVER (PARTITION BY r.idetape ORDER BY (r.duree_seconde + r.penalite)) AS rang,
            r.idetape,
            0 AS idcategorie,
            r.idcoureur,
            co.idequipe,
            r.duree_seconde,
            (interval '1 second' * r.duree_seconde) AS duree_formatted,
            r.penalite,
            (interval '1 second' * r.penalite) AS pen_formatted,
            r.duree_seconde + r.penalite AS new_duree_sec
        FROM resultat r
        JOIN coureur co ON co.idcoureur = r.idcoureur
    ) vu1
);


create or replace view result_final_point_last aS (
    select r.*,(r.duree_formatted+r.pen_formatted) as new_duree_formatted,case when p.classement is null then 0 else p.valeur end as point from result_fin r
    left join point p on p.classement = r.rang
);

create or replace view result_final_point aS (
    select * from result_final_point_last r
    union
    select * from (
    select
    DENSE_RANK() OVER (PARTITION BY vu.idcategorie ORDER BY vu.point DESC) AS rang,
    vu.idetape,
    vu.idcategorie,
    vu.idcoureur,
    vu.idequipe,
    vu.duree_seconde,
    vu.duree_formatted,
    vu.penalite,
    vu.pen_formatted,
    vu.new_duree_sec,
    vu.new_duree_formatted,
    vu.point
    from (
    select 0 as idetape, rl.idcoureur, rl.idequipe,rl.idcategorie, sum(rl.duree_seconde) as duree_seconde, sum(rl.duree_formatted) as duree_formatted,
    sum(rl.penalite) as penalite,
    sum(rl.pen_formatted) as pen_formatted,
    sum(rl.new_duree_sec) as new_duree_sec,
    sum(new_duree_formatted) as new_duree_formatted, sum(rl.point) as point from result_final_point_last rl 
    group by rl.idcoureur, rl.idequipe,rl.idcategorie
    ) vu
    ) quoi
);

create or replace view classement_equipe as (
    select
    ROW_NUMBER() OVER (ORDER BY vu.point) AS rang,
    DENSE_RANK() OVER (PARTITION BY vu.idetape,vu.idcategorie ORDER BY vu.point desc) as laharana,
    vu.idetape, vu.idcategorie, vu.idequipe, e.nom as nomequipe, vu.point,
    case when s.penalite is null then 0 else s.penalite end as penalite,
    case when s.penalite is null then '00:00:00' else s.penalite_formatted end as penalite_formatted
    from (
    select r.idetape,r.idcategorie,r.idequipe,sum(point) as point
    from result_final_point r
    group by r.idetape,r.idcategorie,r.idequipe ) vu
    join equipe e on e.idequipe = vu.idequipe 
    left join v_sum_pen_equipe_final s on s.idetape  = vu.idetape and s.idequipe = e.idequipe
);

create or replace view classement_coureur as (
    select
    ROW_NUMBER() OVER (ORDER BY r.point) AS id,
    r.rang,
    r.idetape,
    r.idcategorie,
    r.idequipe,
    c.idcoureur,
    c.nom,
    c.numero,
    e.nom as nomequipe,
    r.duree_formatted,
    r.duree_seconde,
    r.new_duree_formatted,
    r.pen_formatted,
    r.new_duree_sec,
    r.point
    from result_final_point r
    join coureur c on c.idcoureur = r.idcoureur
    join equipe e on e.idequipe = r.idequipe
);

create or replace view champion as (
select
ROW_NUMBER() OVER (ORDER BY c.point) as id,
c.idcategorie,c.idequipe,
case when ca.nom is null then 'Toute categorie' else ca.nom end as nom,
c.nomequipe,c.point
from classement_equipe c
left join categorie ca on ca.idcategorie = c.idcategorie 
where c.idetape = 0 and c.laharana = 1
);

--- ito Tom aa
create or replace view v_sum_pen_equipe as (
select vu.*,(interval '1 second' * vu.penalite) AS penalite_formatted from (
select p.idetape,p.idequipe,sum(p.penalite) as penalite from penalite p
group by p.idetape,p.idequipe
) vu
);

create or replace view v_sum_pen_equipe_final as (
    select * from v_sum_pen_equipe
    union
    select 0 as idetape,idequipe,sum(penalite) as penalite, sum(penalite_formatted) as penalite_formatted from v_sum_pen_equipe
    group by idequipe
);

create or replace view classement_equipe as (
    select
    ROW_NUMBER() OVER (ORDER BY vu.point) AS rang,
    DENSE_RANK() OVER (PARTITION BY vu.idetape,vu.idcategorie ORDER BY vu.point desc) as laharana,
    vu.idetape, vu.idcategorie, vu.idequipe, e.nom as nomequipe, vu.point,
    case when s.penalite is null then 0 else s.penalite end as penalite,
    case when s.penalite is null then '00:00:00' else s.penalite_formatted end as penalite_formatted
    from (
    select r.idetape,r.idcategorie,r.idequipe,sum(point) as point
    from result_final_point r
    group by r.idetape,r.idcategorie,r.idequipe ) vu
    join equipe e on e.idequipe = vu.idequipe 
    left join v_sum_pen_equipe_final s on s.idetape  = vu.idetape and s.idequipe = e.idequipe
    join classement_equipe_miandry cc on cc.idetape = vu.idetape and cc.idcategorie = vu.idcategorie and cc.point = vu.point
);

create or replace view classement_equipe_miandry as (
    select
    ROW_NUMBER() OVER (ORDER BY vu.point) AS rang,
    DENSE_RANK() OVER (PARTITION BY vu.idetape,vu.idcategorie ORDER BY vu.point desc) as laharana,
    vu.idetape, vu.idcategorie, vu.idequipe, e.nom as nomequipe, vu.point,
    case when s.penalite is null then 0 else s.penalite end as penalite,
    case when s.penalite is null then '00:00:00' else s.penalite_formatted end as penalite_formatted
    from (
    select r.idetape,r.idcategorie,r.idequipe,sum(point) as point
    from result_final_point r
    group by r.idetape,r.idcategorie,r.idequipe ) vu
    join equipe e on e.idequipe = vu.idequipe 
    left join v_sum_pen_equipe_final s on s.idetape  = vu.idetape and s.idequipe = e.idequipe
);
create or replace view couleur as (
select idetape,idcategorie,point,count(point) as isany from classement_equipe_miandry
group by idetape,idcategorie,point
);

