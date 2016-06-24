/**
 * GestionPointageController
 *
 * @description :: Server-side logic for managing userGestions
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
 var utilisateurController = require('./UtilisateurController');
 var pointageController = require('./PointageController');
 var roleController = require('./RoleController');
 var serviceController = require('./ServiceController');
 var connexionController = require('./ConnexionController');
 var emailController = require('./Email/emailController');
 var compteController = require('./CompteController');

module.exports = {
	//Afiche la page '/user/create' (recupère tous les roles et service)
	beforecreate:function(req,res){
		var messageSuccess = req.session.success;
		var messageError = req.session.error;
		delete req.session.error;
		delete req.session.success;

		res.view('pointageCreation',{
			title:'Création',
			id_utilisateur: req.param('id_utilisateur'),
			messageError:messageError
		});
		return;
	},

	// Creer un utilisateur ensuite un login password enfin un compte
	create:function(req,res){
		id_utilisateur = req.param('id_utilisateur');
		pointageController.create(req,function(obj){
			if(obj.status){
				req.session.success ='Votre création a bien été enrengistré';
				return res.redirect('/pointageCompte');
			}else{
				req.session.error = "Erreur pointage";
				return res.redirect('/user/'+id_utilisateur+'/pointage/create');
			}
		})

	},

	//Suppression d'un utilisateur grace à son id 'user/delete/:id' (desactive son compte, supprime son compte de connexion et enfin supprime l'utilisateur)
	delete:function(req,res){
		id = req.param('id');
		id_utilisateur = req.param('id_utilisateur');
		pointageController.delete(id,function(obj){
			if(obj.status){
				req.session.success = 'La suppression a bien été enrengistré';
				res.redirect('/user/'+id_utilisateur+'/pointage');
				return;
			}else{
				req.session.error = 'Erreur dans la suppression';
				res.redirect('/user/'+id_utilisateur+'/pointage');
				return;
			}
		});
	},

	//Affiche la page '/user/update/:id' (recup via l'id en paramètre les infos de l'utilisateur + tous les roles et services pour le formulaire)
	beforeupdate:function(req,res){
		id_utilisateur = req.param('id_utilisateur');
		pointageController.getOneById(req.param('id'),function(obj){
			if(obj.status){
				res.view('pointageCreation',{
					pointage: obj.pointage,
					messageError: req.session.error,
					title:'Update', //Si il y a eu une erreur lors d'un update
					id_utilisateur: id_utilisateur
				});
				delete req.session.error;
				return;
				//else{return res.render('userCreation', {err : objRole.err});}
			}else{
				req.session.error = "Le pointage n'existe pas ou plus";
				return res.redirect('/user/'+id_utilisateur+'/pointage');
			}
		})
	},
	//Mise à jour d'un utilisateur
	update:function(req,res){
		id_utilisateur = req.param('id_utilisateur');
		pointageController.update(req,function(obj){
			if(obj.status){
				req.session.success = "Le pointage a bien été modifié";
				delete req.session.error;
				return res.redirect('/user/'+id_utilisateur+'/pointage');
			}
			req.session.error = 'Erreur enregistrement pointage';
			return res.redirect('/user/'+id_utilisateur+'/pointage');
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	get:function(req,res){
		id_utilisateur = req.param('id_utilisateur');
		pointageController.getAllByUser(id_utilisateur, function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('pointageGestion',{id_utilisateur: id_utilisateur,pointages: obj.pointages, messageError: messageError, messageSuccess : messageSuccess, title: 'Pointage' });
				return;
			}
			//return res.view('pointageGestion',{pointages: [], err: obj.err});
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	userGet:function(req,res){
		id_utilisateur = req.session.user.id;
		pointageController.getAllByUser(id_utilisateur, function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('pointageCompte',{pointages: obj.pointages, messageError: messageError, messageSuccess : messageSuccess, title: 'Pointage' });
				return;
			}
			//return res.view('pointageGestion',{pointages: [], err: obj.err});
		})
	},

	// Creer un utilisateur ensuite un login password enfin un compte
	userCreate:function(req,res){
		id_utilisateur = req.session.user.id;
		pointageController.userCreate(req,function(obj){
			if(obj.status){
				req.session.success ='Votre pointage a bien été enrengistré';
				return res.redirect('/pointageCompte');
			}else{
				req.session.error = "Erreur pointage";
				return res.redirect('/pointageCompte');
			}
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	getPointageUsers:function(req,res){
		utilisateurController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('pointageUsers',{utilisateurs: obj.utilisateurs, messageError: messageError, messageSuccess : messageSuccess, title: 'Pointage' });
				return;
			}
			return res.view('pointageUsers',{utilisateurs: [], err: obj.err});
		})
	},
};

