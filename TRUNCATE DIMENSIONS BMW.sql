SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE dw_vente_bmw.tf_ventes_marque_bmw;
TRUNCATE dw_vente_bmw.tf_ventes_zone_geo_bmw;
TRUNCATE dw_vente_bmw.dim_marque;
TRUNCATE dw_vente_bmw.dim_zone_geo;
TRUNCATE dw_vente_bmw.dim_annee;
TRUNCATE dw_vente_bmw.referentiel_prix;

SET FOREIGN_KEY_CHECKS = 1;