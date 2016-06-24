/**
 * Email/emailController
 *
 * @description :: Server-side logic for managing email/emails
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	sendEmail: function(template, data, mail, sujet) {

		// sails.hooks.email.send(template, data, options, cb)
		sails.hooks.email.send(
		  template,
		  {
		    donnee : data
		  },
		  {
		    from: "Admin <adm.thalos.nfc@gmail.com>",
		    to: mail,
		    subject: sujet
		  },
		  function(err) {console.log(err || "Email is sent");}
		)		
	},
	sendMDP: function(utilisateur) {

		// sails.hooks.email.send(template, data, options, cb)
		sails.hooks.email.send(
		  "newMdp",
		  {
		    url:"localhost:1337/newmdp/"+utilisateur.login+"/"+utilisateur.salt
		  },
		  {
		    from: "Admin <sofiane.benamour@gmail.com>",
		    to: "sosodu27@msn.com",
		    subject: "SailsJS email test"
		  },
		  function(err) {console.log(err || "Email is sent");}
		);		
		
		//return res.send('Email Test');
	}
};

