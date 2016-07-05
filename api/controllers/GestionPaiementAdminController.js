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
 var paiementController = require('./PaiementController');
 var validator = require('../services/Validation');

module.exports = {

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	get:function(req,res){
		id_utilisateur = req.param('id_utilisateur');
		paiementController.getPaiementCompte(id_utilisateur,function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				console.log(obj.paiements)
				res.view('paiementGestion',{paiements: obj.paiements, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Paiement Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/CantineFrequentationTotale' 
	getPaiementCompte:function(req,res){
		console.log(req.session.user);
		paiementController.getPaiementCompte(req.session.user.id,function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				console.log(obj.paiements)
				res.view('paiementCompte',{paiements: obj.paiements, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Paiement Entreprise' });
				return;
			}
		})
	},

	// Affiche la page '/user' (recup tout les utilisateurs de la bd)
	getPaiementUsers:function(req,res){
		utilisateurController.get(function(obj){
			if(obj.status){
				var messageSuccess = req.session.success;
				var messageError = req.session.error;
				delete req.session.error;
				delete req.session.success;
				res.view('paiementUsers',{utilisateurs: obj.utilisateurs, messageError: messageError, messageSuccess : messageSuccess, title: 'Paiement' });
				return;
			}
			return res.view('paiementUsers',{utilisateurs: [], err: obj.err});
		})
	},

		// Affiche la page '/CantineFrequentationTotale' 
	createPaiementRemboursement:function(req,res){
		id_compte = req.param('id_compte');
		montant = req.param('montant');
		id_commande = req.param('id_commande');
		article = req.param('quantite') + " x " + req.param('article');
		paiementController.createPaiementRemboursement(id_compte,montant,id_commande,article,function(obj){
			if(obj.status){
				id_utilisateur = req.param('id_utilisateur');
				paiementController.getPaiementCompte(id_utilisateur,function(obj){
					if(obj.status){
						var messageSuccess = req.session.success;
						var messageError = req.session.error;
						delete req.session.error;
						delete req.session.success;
						console.log(obj.paiements)
						res.view('paiementGestion',{paiements: obj.paiements, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Paiement Entreprise' });
						return;
					}
				})
			}
		})
	},

	// Affiche la page '/CantineFrequentationTotale' 
	// createPaiementRemboursement:function(req,res){
	// 	id_compte = req.param('id_compte');
	// 	montant = req.param('montant');
	// 	id_commande = req.param('id_commande');
	// 	article = req.param('article');
	// 	paiementController.createPaiementRemboursement(id_compte,montant,id_commande,article,function(obj){
	// 		if(obj.status){
	// 			var messageSuccess = req.session.success;
	// 			var messageError = req.session.error;
	// 			delete req.session.error;
	// 			delete req.session.success;
	// 			console.log(obj.paiements)
	// 			res.view('paiementGestion',{paiements: obj.paiements, messageError: messageError, messageSuccess : messageSuccess, title: 'Données Paiement Entreprise' });
	// 			return;
	// 		}
	// 	})
	// },
};
