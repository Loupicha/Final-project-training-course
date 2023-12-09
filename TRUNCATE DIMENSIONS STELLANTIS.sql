SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE dw_vente_stellantis.tf_ventes_marque_stellantis;
TRUNCATE dw_vente_stellantis.tf_ventes_zone_geo_stellantis;
TRUNCATE dw_vente_stellantis.dim_zone_geo;
TRUNCATE dw_vente_stellantis.dim_annee;
truncate dw_vente_stellantis.referentiel_prix;

SET FOREIGN_KEY_CHECKS = 1;