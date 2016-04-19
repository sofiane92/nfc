/**
 * EmplacementController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		
		Emplacement.find()
				   .exec(function(err,emplacements){
						if(err || emplacements.length == 0){
							done({status:false, error : err});
						}
						done({status:true, emplacements : emplacements});
					})
	},
	getOneByName:function(nom,done){
			
		Emplacement.findOne({nom_emplacement:nom_emplacement})
				   .exec(function(err,emplacement){
						if(err || emplacement.length == 0){
							done({status:false, error : err});
						}
						done({status:true, emplacement : emplacement});
					})
	},
	getOneById:function(id,done){
			
		Emplacement.findOne({id:id})
				   .exec(function(err,emplacement){
						if(err || emplacement.length == 0){
							done({status:false, error : err});
						}
					//	console.log(utilisateurs);
						done({status:true, emplacement : emplacement});
					})
	}
	
};

