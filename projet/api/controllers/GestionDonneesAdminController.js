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

	// Affiche la page '/CantineFrequentationTotale' 
	getCantineFrequentationTotale:function(req,res){
		donneesController.getCantineFrequentationTotale(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCantineEnterpriseTotal',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/getCantineFrequentationJour' 
	getCantineFrequentationJour:function(req,res){
		donneesController.getCantineFrequentationJour(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCantineEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine Entreprise' });
				return;
			}
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

	// Affiche la page '/getSalleFrequentationTotale' 
	getSalleFrequentationTotale:function(req,res){
		donneesController.getSalleFrequentationTotale(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataSalleEnterpriseTotal',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
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
				res.view('dataSalleEnterprise',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Salle de réunion' });
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

	getCENombreAchat:function(req,res){
		donneesController.getCENombreAchat(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCEPurchase',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Comité Entreprise' });
				return;
			}
		})
	},

	getCantineNombreAchat:function(req,res){
		donneesController.getCantineNombreAchat(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('dataCantinePurchase',{donnees: obj.donnees, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Cantine Entreprise' });
				return;
			}
		})
	},

};

