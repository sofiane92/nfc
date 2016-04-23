/**
 * DonneesController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	getRestaurantFrequentationTotale:function(done){
		Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' GROUP BY Nom, Type,Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Restaurant' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant') ORDER BY Nombre DESC", function(err, donnees) {		  
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getRestaurantFrequentationJour:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Restaurant' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' AND DATE_FORMAT(l.date_entree,'%Y-%m-%d') = CURRENT_DATE) ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getRestaurantAffluence:function(done){
	Donnee.query("SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP GROUP BY Nom, Type, Place UNION SELECT e.nom_emplacement as Nom, e.type as Type, e.nb_place as Place, 0 as Nombre FROM emplacement e WHERE e.type = 'Restaurant' AND e.id NOT IN (SELECT DISTINCT l.code_emplacement FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' AND l.date_entree between DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 HOUR) and CURRENT_TIMESTAMP) ORDER BY Nombre DESC", function(err, donnees) {
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

	getNombreAchatCE:function(done){
	Donnee.query("SELECT a.nom_article as Nom, a.tye_article as Type, SUM(quantite) as Nombre, prix_article as Prix FROM article a, lignecommande l WHERE a.id = l.id_article AND a.tye_article = 'Plat' GROUP BY Nom, Type UNION SELECT a.nom_article, a.tye_article as Type, 0 as Nombre, a.prix_article as Prix FROM article a WHERE a.tye_article = 'Plat' AND a.nom_article NOT IN (SELECT a.nom_article as Nom FROM article a, lignecommande l WHERE a.id = l.id_article AND a.tye_article = 'Plat') ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},

	getNombreAchatCantine:function(done){
	Donnee.query("SELECT a.nom_article as Nom, a.tye_article as Type, SUM(quantite) as Nombre, prix_article as Prix FROM article a, lignecommande l WHERE a.id = l.id_article AND a.tye_article = 'CE' GROUP BY Nom, Type UNION SELECT a.nom_article, a.tye_article as Type, 0 as Nombre, a.prix_article as Prix FROM article a WHERE a.tye_article = 'CE' AND a.nom_article NOT IN (SELECT a.nom_article as Nom FROM article a, lignecommande l WHERE a.id = l.id_article AND a.tye_article = 'CE') ORDER BY Nombre DESC", function(err, donnees) {
			if(err || donnees.length == 0){
				done({status:false, error : err});
			}
			console.log(donnees);
			done({status:true, donnees : donnees});
		})
	},
};

