/**
 * CompteController
 *
 * @description :: Server-side logic for managing comptes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		Compte.find().populate('id_utilisateur')
					 .exec(function(err,comptes){
					 	if(err || comptes.length == 0){
							done({status:false, error : err});
						}
						done({status:true, comptes : comptes});
					 })
	},
	getOneById:function(id,done){
		Compte.find({id_utilisateur:id}).populate('id_utilisateur')
					 .exec(function(err,compte){
					 	if(err || compte.length == 0){
							done({status:false, error : err});
						}
						done({status:true, compte : compte});
					 })
	},
	create:function(id,done){
		var tt = 1.22;
		console.log('///////////////////////');
		console.log(typeof tt);
		
		var compte={
			id_utilisateur:id,
			argent:0.00,
			active:true
		}
		Compte.create(compte,function(err,ok){
			if(err){
				done({status:false,error : err});
			}else{done({status:true, ok :ok});}
			
		})
	},
	update:function(id,argent,done){
		Compte.update({id_utilisateur:id},{argent:argent}).exec(function(err,update){
			if(err){
				done({status:false, error :err});
			}
			done({status:true,update:update});
		})
	},

	delete:function(id,done){
		Compte.update({id_utilisateur:id},{active:false}).exec(function(err,destroy){
			if(err){
				done({status:false, error:err});
			}
			done({status:true, destroy:destroy});
		})
	}
};

