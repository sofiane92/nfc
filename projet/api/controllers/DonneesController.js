/**
 * DonneesController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	getCantineFrequentationTotale:function(done){
		Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine' GROUP BY Nom, Type,Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Cantine' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine') ORDER BY Nombre DESC", function(err, donnees) {		  
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getCantineFrequentationJour:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Cantine' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE) ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getCantineAffluence:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Cantine' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Cantine' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP) ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getSalleFrequentationTotale:function(done){
		Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle' GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Salle' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle') ORDER BY Nombre DESC", function(err, donnees) {		  
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getSalleFrequentationJour:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Salle' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE) ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getSalleAffluence:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, l.date_entree as Entree, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP GROUP BY Nom, Place, Entree UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Entree, 0 as Nombre FROM emplacement e WHERE e.type = 'Salle' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Salle' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP) ORDER BY Nombre ASC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getCantineNombreAchat:function(done){
	Donnee.query("SELECT a.nom_article as Nom, a.type_article as Type, SUM(quantite) as Nombre, prix_article as Prix FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'Plat' GROUP BY Nom, Type UNION SELECT a.nom_article, a.type_article as Type, 0 as Nombre, a.prix_article as Prix FROM article a WHERE a.type_article = 'Plat' AND a.nom_article NOT IN (SELECT a.nom_article as Nom FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'Plat') ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getCENombreAchat:function(done){
	Donnee.query("SELECT a.nom_article as Nom, a.type_article as Type, SUM(quantite) as Nombre, prix_article as Prix FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'CE' GROUP BY Nom, Type UNION SELECT a.nom_article, a.type_article as Type, 0 as Nombre, a.prix_article as Prix FROM article a WHERE a.type_article = 'CE' AND a.nom_article NOT IN (SELECT a.nom_article as Nom FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'CE') ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getCETopTenSortie:function(done){
	Donnee.query("SELECT a.nom_article as Nom, a.type_article as Type, SUM(quantite) as Nombre, prix_article as Prix FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'CE' GROUP BY Nom, Type UNION SELECT a.nom_article, a.type_article as Type, 0 as Nombre, a.prix_article as Prix FROM article a WHERE a.type_article = 'CE' AND a.nom_article NOT IN (SELECT a.nom_article as Nom FROM article a, lignecommande l WHERE a.id = l.id_article AND a.type_article = 'CE') ORDER BY Nombre DESC LIMIT 10", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},
};

