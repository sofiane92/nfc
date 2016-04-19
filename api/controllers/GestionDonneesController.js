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
 var localisationController = require('./LocalisationController');
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

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	getFrequentation:function(req,res){
		emplacementController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('frequentation',{emplacements: obj.emplacements, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine' });
				return;
			}
			return res.view('frequentation',{err: obj.err});
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	getLocalisation:function(req,res){
		localisationController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('loca',{localisations: obj.localisations, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine' });
				return;
			}
			// return res.view('loca',{err: obj.err});
		})
	}
	
};

