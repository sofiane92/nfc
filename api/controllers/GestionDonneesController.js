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
 var emplacementController = require('./EmplacementController');
 var donneesController = require('./DonneesController');
 var validator = require('../services/Validation');

module.exports = {

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	get:function(req,res){
		utilisateurController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataHomepage',{utilisateurs: obj.utilisateurs, messageError: messageError, messageSuccess : messageSuccess, title: 'Données entreprise' });
				return;
			}
			return res.view('dataHomepage',{err: obj.err});
		})
	},

	// Affiche la page '/RestaurantFrequentationTotale' 
	getRestaurantFrequentationTotale:function(req,res){
		donneesController.getRestaurantFrequentationTotale(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Restaurant Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/getRestaurantFrequentationJour' 
	getRestaurantFrequentationJour:function(req,res){
		donneesController.getRestaurantFrequentationJour(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Restaurant Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/getRestaurantAffluence' 
	getRestaurantAffluence:function(req,res){
		donneesController.getRestaurantAffluence(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataRestaurantAffluence',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Restaurant Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/getSalleFrequentationTotale' 
	getSalleFrequentationTotale:function(req,res){
		donneesController.getSalleFrequentationTotale(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
				return;
			}
		})
	},

	// Affiche la page '/getSalleFrequentationJour' 
	getSalleFrequentationJour:function(req,res){
		donneesController.getSalleFrequentationJour(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
				return;
			}
		})
	},
	
	// Affiche la page '/getSalleAffluence' 
	getSalleAffluence:function(req,res){
		donneesController.getSalleAffluence(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataSalleAffluence',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
				return;
			}
		})
	},

	getNombreAchatCE:function(req,res){
		donneesController.getNombreAchatCE(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataPurchase',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
				return;
			}
		})
	},

	getNombreAchatCantine:function(req,res){
		donneesController.getNombreAchatCantine(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataPurchase',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
				return;
			}
		})
	},

};

