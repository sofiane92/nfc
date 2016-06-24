/**
 * GestionUtilisateurController
 *
 * @description :: Server-side logic for managing userGestions
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
	
	// Affiche la page '/getCantineAffluence' 
	getCantineAffluence:function(req,res){
		donneesController.getCantineAffluence(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCantineAffluence',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine Entreprise' });
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

	getCETopTenSortie:function(req,res){
		donneesController.getCETopTenSortie(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCETopTen',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Comité Entreprise' });
				return;
			}
		})
	},

};

