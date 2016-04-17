/**
 * GestionUtilisateurController
 *
 * @description :: Server-side logic for managing gestionutilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
 var utilisateurController = require('./UtilisateurController');
 var roleController = require('./RoleController');
 var serviceController = require('./ServiceController');
 var connexionController = require('./ConnexionController');
 var emailController = require('./Email/emailController');
 var compteController = require('./CompteController');
 var validator = require('../services/Validation');

module.exports = {
	//Afiche la page '/user/create' (recupère tous les roles et service)
	beforecreate:function(req,res){
		var messageSuccess = req.session.success;
		var messageError = req.session.error;
		delete req.session.error;
		delete req.session.success;
		serviceController.get(function(objService){
			if(objService.status){
				roleController.get(function(objRole){
					if(objRole.status){
						
						 res.view('creationUtilisateur',{
								services: objService.services,
								roles: objRole.roles,
								title:'Création',
								messageError:messageError
							});
						 return;
					}else{return res.render('creationUtilisateur', {err : objRole.err});}
				})
			}else{return res.render('creationUtilisateur', {err : objService.err});}
		})
	},

	// Creer un utilisateur ensuite un login password enfin un compte
	create:function(req,res){
		var toto = Validation.trimEscape(req);
		console.log(toto);
		Validation.creationUtilisateur(toto,function(isOk){
			if(isOk.isOk){
		utilisateurController.create(req,function(obj){
				if(obj.status){
					connexionController.createLogin(obj,function(objConnexion){
						if(objConnexion.status){
							compteController.create(obj.utilisateur.id,function(objCompte){
								if(objCompte.status){
									req.session.success ='Votre création a bien été enrengistré';
									res.redirect('/user');
									emailController.sendEmail(obj.utilisateur.nom,obj.utilisateur.prenom,objConnexion.login.login,objConnexion.login.password,objConnexion.login.salt);
									return;
								}else{
									connexionController.delete(obj.utilisateur.id,function(done){
										utilisateurController.delete(obj.utilisateur.id,function(done){
											req.session.error = "Votre création n'a pas été enrengistré";
											return res.redirect('/user'); })
									})
								}
							})
						}else{
							utilisateurController.delete(obj.utilisateur.id,function(done){
								req.session.error = "Votre création n'a pas été enrengistré";
								return res.redirect('/user');})
						}
					})
				}else{
					req.session.error = "Un utilisateur utilise déja le même mail ou/et numéro de téléphone";
					return res.redirect('/user/create');
				}	
			})
		}else{ 
			req.session.error=isOk.messageError;
			return res.redirect('/user/create');	
			} 
		})

	},

	//Suppression d'un utilisateur grace à son id 'user/delete/:id' (desactive son compte, supprime son compte de connexion et enfin supprime l'utilisateur)
	delete:function(req,res){
		id = req.param('id');
		compteController.delete(id,function(objCompte){
			if(objCompte.status){
				connexionController.delete(id,function(objConnexion){
					if(objConnexion.status){
						utilisateurController.delete(id,function(obj){
							if(obj.status){
								req.session.success = 'La suppression a bien été enrengistré';
								res.redirect('/user');
								return;
							}else{
								req.session.error = 'Erreur dans la suppression';
								res.redirect('/user');
								return;}
						})
					}else{
						req.session.error = 'Erreur dans la suppression';
						res.redirect('/user');
						return;}
				})
			}else{
				req.session.error = 'Erreur dans la suppression';
				res.redirect('/user');
				return;
			}
		})
	},

	//Affiche la page '/user/update/:id' (recup via l'id en paramètre les infos de l'utilisateur + tous les roles et services pour le formulaire) 
	beforeupdate:function(req,res){
		utilisateurController.getOneById(req.param('id'),function(obj){
			if(obj.status){
				serviceController.get(function(objService){
					if(objService.status){
						roleController.get(function(objRole){
							if(objRole.status){
							res.view('creationUtilisateur',{
								services: objService.services,
								roles: objRole.roles,
								utilisateur: obj.utilisateur,
								messageError: req.session.error,
								title:'Update' //Si il y a eu une erreur lors d'un update
							});
							delete req.session.error;
							return;
							}//else{return res.render('creationUtilisateur', {err : objRole.err});}
						})
					}//else{return res.render('creationUtilisateur', {err : objService.err});}
				})
				
			}else{ 
				req.session.error = "L'utilisateur n'existe pas ou plus";
				return res.redirect('/user');
				}
		})
	},
	//Mise à jour d'un utilisateur
	update:function(req,res){
		utilisateurController.update(req,function(obj){
			if(obj.status){
				req.session.success = "L'utilisateur a bien été modifié";
				delete req.session.error;
				return res.redirect('/user');
			}
			req.session.error = 'Email et/ou tel déja enrengistré dans la bd';
			return res.redirect('/user/update/'+req.param('id'));
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	get:function(req,res){
		utilisateurController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('gestionUtilisateur',{utilisateurs: obj.utilisateurs, messageError: messageError, messageSuccess : messageSuccess, title: 'Utilisateur' });
				return;
			}
			return res.view('gestionUtilisateur',{utilisateurs: [], err: obj.err});
		})
	}
	
};

