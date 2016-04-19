/**
 * LocalisationController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		Localisation.query("SELECT e.nom_emplacement as Nom,count(*) as Nombre FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' GROUP BY e.id, e.nom_emplacement UNION SELECT e.nom_emplacement, 0 as Nombre FROM emplacement e WHERE e.type = 'Restaurant' AND e.nom_emplacement NOT IN (SELECT e.nom_emplacement as Nom FROM localisation l, emplacement e WHERE l.code_emplacement = e.id AND e.type = 'Restaurant' GROUP BY e.id, e.nom_emplacement) ORDER BY Nombre DESC", function(err, localisations) {
		  // if (err) return done.serverError(err);
		  
		  // return done.ok(localisations.rows);

		  if(err || localisations.length == 0){
				done({status:false, error : err});
			}
			console.log(localisations);
			done({status:true, localisations : localisations});
		})
		// Emplacement.find()
		// 		   .exec(function(err,emplacements){
		// 				if(err || emplacements.length == 0){
		// 					done({status:false, error : err});
		// 				}
		// 				done({status:true, emplacements : emplacements});
		// 			})
	}
	
};

