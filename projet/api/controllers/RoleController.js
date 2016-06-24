/**
 * RoleController
 *
 * @description :: Server-side logic for managing roles
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		Role.find()
			.exec(function(err,roles){
						if(err || roles.length == 0){
							done({status:false, error : err});
						}

           				 	done({status:true, roles : roles});
					})
	},
	create:function(req,res){
	},
	update:function(req,res){

	},
	delete:function(req,res){

	},


	
};

