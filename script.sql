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
    nom varchar(30)
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
    valeur double precision,
    idetape int,
    foreign key (idetape) references etape(idetape)
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

insert into point (classement,valeur,idetape) values (1,10,1);
insert into point (classement,valeur,idetape) values (2,6,1);
insert into point (classement,valeur,idetape) values (3,2,1);

insert into point (classement,valeur,idetape) values (1,15,2);
insert into point (classement,valeur,idetape) values (2,10,2);
insert into point (classement,valeur,idetape) values (3,4,2);
insert into point (classement,valeur,idetape) values (4,1,2);

insert into point (classement,valeur,idetape) values (1,8,3);
insert into point (classement,valeur,idetape) values (2,3,3);
insert into point (classement,valeur,idetape) values (3,1,3);

insert into point (classement,valeur,idetape) values (1,10,4);
insert into point (classement,valeur,idetape) values (2,7,4);
insert into point (classement,valeur,idetape) values (3,4,4);

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

create view v_etape_coureur as (
select e.*,eq.idequipe from etape_coureur e 
join coureur c on e.idcoureur = c.idcoureur
join equipe eq on eq.idequipe = c.idequipe
);