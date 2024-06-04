-- ovaina itoooooo
create or replace view v_impetape as (
select i.etape, i.rang, i.nb_coureur, i.longueur, date_depart + heure_depart AS debut from import_etape i
left join etape e on e.rang = i.rang
where e.idetape is null
);

insert into etape (nom,rang,nombre_coureur,longueur,debut) select * from v_impetape;

create or replace view v_impequipe as (
select  nom, nom as login, nom as pwd from ( 
select distinct(equipe) as nom from import_resultat
) vu where vu.nom not in (select nom from equipe)
);

insert into equipe (nom,login,pwd) select * from v_impequipe;

create or replace view v_impcoureur as (
select vu.nom,vu.numero_dossard,vu.genre,vu.date_naissance,e.idequipe from (
select distinct i.nom,i.numero_dossard,i.genre,i.date_naissance,i.equipe from import_resultat i
) vu 
join equipe e on e.nom = vu.equipe
where vu.numero_dossard not in (select numero from coureur)
);

insert into coureur (nom,numero,genre,dtn,idequipe) select * from v_impcoureur;

create or replace view v_impetapecoureur as (
select e.idetape,c.idcoureur from import_resultat i
join coureur c on c.numero  = i.numero_dossard
join etape e on e.rang = i.etape_rang
left join etape_coureur ec on ec.idetape = e.idetape and ec.idcoureur = c.idcoureur
where ec.idetape_coureur is null
);


insert into etape_coureur(idetape,idcoureur) select * from v_impetapecoureur;

create or replace view v_impparticipation as (
select e.idetape,c.idcoureur,i.arrivee from import_resultat i
join coureur c on c.numero  = i.numero_dossard
join etape e on e.rang = i.etape_rang
left join participation ec on ec.idetape = e.idetape and ec.idcoureur = c.idcoureur
where ec.idparticipation is null
);

insert into participation (idetape,idcoureur,arrive) select * from v_impparticipation;