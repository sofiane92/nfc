/**
 * Email/emailController
 *
 * @description :: Server-side logic for managing email/emails
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	sendEmail: function(nom,prenom,login,password,salt) {

		// sails.hooks.email.send(template, data, options, cb)
		sails.hooks.email.send(
		  "createLogin",
		  {
		    nom: "Benamour",
		    prenom: "Sofiane",
		    login: "sosodu27@msn.com",
		    password:'',
		    url:'localhost:1337/login/change?token='+salt
		  },
		  {
		    from: "Admin <sofiane.benamour@gmail.com>",
		    to: "sosodu27@msn.com",
		    subject: "SailsJS email test"
		  },
		  function(err) {console.log(err || "Email is sent");}
		)		
		
		//return res.send('Email Test');
	}
	
};

