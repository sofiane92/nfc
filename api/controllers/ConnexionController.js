/**
 * ConnexionController
 *
 * @description :: Server-side logic for managing connexions
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var bcrypt = require('bcryptjs');
module.exports = {

	getOneByLogin:function(login,done){
		Connexion.find({login:login})
				   .populate('id_utilisateur')
				   .exec(function(err,utilisateur){
				   		console.log(utilisateur);
						if(err || utilisateur.length == 0 ){
							done({status:false, error : err});
						}else{done({status:true, utilisateur : utilisateur});}
						
					})
	},
	createLogin:function(req,done){
		var login = req.utilisateur.prenom.charAt(0)+''+req.utilisateur.nom;
		var salt = bcrypt.genSaltSync(10);
		var hash = bcrypt.hashSync(login, salt);
		var utilisateur = {
			id_utilisateur : req.utilisateur.id,
			login : login,
			password : hash,
			salt : salt
		}
		Connexion.create(utilisateur,function (err,ok){
			if(err){
				done({status:false, error :err});
			}
			done({status:true,login:ok});
		})
	},

	updatePassword:function(id,password,done){
		Connexion.update({id_utilisateur:id},{password:password})
				 .exec(function(err,ok){
				 	if(err){
				 		done({status:false,err:err});
				 	}
				 	done({status:true});
				 })
	},
	
	delete:function(id,done){
		Connexion.destroy({id_utilisateur:id}).exec(function(err,destroy){
			if (err){
				done({status:false, error : err});
			}
			done({status : true})
		})
	}
};

