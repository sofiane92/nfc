/**
 * UtilisateurController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		
		Utilisateur.find()
				   .populate('id_role')
				   .populate('id_service')
				   .exec(function(err,utilisateurs){
						if(err || utilisateurs.length == 0){
							done({status:false, error : err});
						}
						done({status:true, utilisateurs : utilisateurs});
					})
	},
	getOneByName:function(nom,done){
			
		Utilisateur.findOne({nom:nom})
				   .populate('id_role')
				   .populate('id_service')
				   .exec(function(err,utilisateur){
						if(err || utilisateur.length == 0){
							done({status:false, error : err});
						}
						done({status:true, utilisateur : utilisateur});
					})
	},
	getOneById:function(id,done){
			
		Utilisateur.findOne({id:id})
				   .populate('id_role')
				   .populate('id_service')
				   .exec(function(err,utilisateur){
				   	console.log(utilisateur);
						if(err || utilisateur.length == 0){
							done({status:false, error : err});
						}
					//	console.log(utilisateurs);
						done({status:true, utilisateur : utilisateur});
					})
	},



	create:function(req,done){
		var utilisateur= {
			nom : req.param('nom'),
			prenom : req.param('prenom'),
			mail : req.param('mail'),
			tel : req.param('tel'),
			id_service : req.param('service'),
			id_role : req.param('role'),
			id_nfc : 0
		}
		Utilisateur.create(utilisateur, function(err,ok){
			console.log(err);
			if(err){
				done({status:false, error : err});
			}
			done({status:true,utilisateur:ok});

		})
	},
	update:function(req,done){
		var utilisateur= {
			nom : req.param('nom'),
			prenom : req.param('prenom'),
			mail : req.param('mail'),
			tel : req.param('tel'),
			id_service : req.param('service'),
			id_role : req.param('role'),
			id_nfc : 0
		}
		Utilisateur.update({id:req.param('id')},utilisateur).exec(function(err,update){
			if (err) {
				done({status:false,error:err});
			}else{
			done({status:true,update:update});
		}
		})

	},
	delete:function(id,done){
		Utilisateur.destroy({id:id})
				   .exec(function(err,destroy){
				   	if(err){
				   		done({status:false, error : err});
				   	}
				   	done({status:true});
				   })
	}
	
};

