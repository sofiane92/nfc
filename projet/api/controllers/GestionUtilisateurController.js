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
 var validator = require('../services/Validation');

module.exports = {
	// Affiche la page '/user' (recup un utilisateur de la bd)
	compte:function(req,res){
		console.log(req.session.user);
		var messageSuccess = req.session.success;
		var messageError = req.session.error;
		delete req.session.error;
		delete req.session.success;
		return res.view('userCompte',{utilisateurs: req.session.user, messageError: messageError, messageSuccess : messageSuccess, title: 'Compte' });
	}
};

