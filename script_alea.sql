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

create or replace view classement_equipe as (
    select
    ROW_NUMBER() OVER (ORDER BY vu.point) AS rang,
    DENSE_RANK() OVER (PARTITION BY vu.idetape,vu.idcategorie ORDER BY vu.point desc) as laharana,
    vu.idetape, vu.idcategorie, vu.idequipe, e.nom as nomequipe, vu.point,
    case when s.penalite is null then 0 else s.penalite end as penalite,
    case when s.penalite is null then '00:00:00' else s.penalite_formatted end as penalite_formatted,
    cc.isany
    from (
    select r.idetape,r.idcategorie,r.idequipe,sum(point) as point
    from result_final_point r
    group by r.idetape,r.idcategorie,r.idequipe ) vu
    join equipe e on e.idequipe = vu.idequipe 
    left join v_sum_pen_equipe_final s on s.idetape  = vu.idetape and s.idequipe = e.idequipe
    join couleur cc on cc.idetape = vu.idetape and cc.idcategorie = vu.idcategorie and cc.point = vu.point
);