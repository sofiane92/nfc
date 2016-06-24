/**
 * ConnexionController
 *
 * @description :: Server-side logic for managing connexions
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var bcrypt = require('bcryptjs');
var randtoken = require('rand-token');
module.exports = {

	getOneByLogin:function(login,done){
		Connexion.find({login:login})
				   .populate('id_utilisateur')
				   .exec(function(err,utilisateur){
						if(err || utilisateur.length == 0 ){
							done({status:false, error : err});
						}else{done({status:true, utilisateur : utilisateur});}
						
					})
	},
	getOneByToken:function(token,done){
		Connexion.find({salt:token})
				   .populate('id_utilisateur')
				   .exec(function(err,utilisateur){
						if(err || utilisateur.length == 0 ){
							done({status:false, error : err});
						}else{done({status:true, utilisateur : utilisateur});}
						
					})
	},
	createLogin:function(req,done){
		var login = req.utilisateur.mail;
		var salt = bcrypt.genSaltSync(10);
		var hash = bcrypt.hashSync(req.utilisateur.prenom.charAt(0)+''+req.utilisateur.nom, salt);
		var token = randtoken.generate(32);
		var utilisateur = {
			id_utilisateur : req.utilisateur.id,
			login : login,
			password : hash,
			salt : token
		}
		Connexion.create(utilisateur,function (err,ok){
			if(err){
				done({status:false, error :err});
			}else{
				done({status:true,login:ok});
			}
			
		})
	},

	updatePassword:function(login,password,done){
		var salt = bcrypt.genSaltSync(10);
		var hash = bcrypt.hashSync(password, salt);
		var token = randtoken.generate(32);
		Connexion.update({login:login},{password:hash, salt:token})
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

