/**
 * ServiceController
 *
 * @description :: Server-side logic for managing services
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
			Service.find()
				.exec(function(err,services){
						if(err || services.length == 0){
							done({status:false, error : err});
						}

           				 	done({status:true, services : services});
					})
	},
	create:function(req,res){
	},
	update:function(req,res){

	},
	delete:function(req,res){

	},
};

