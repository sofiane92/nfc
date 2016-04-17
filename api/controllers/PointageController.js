/**
 * PointageController
 *
 * @description :: Server-side logic for managing pointages
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	get:function(done){
		
		Pointage.find()
				   .populate('id_utilisateur')
				   .exec(function(err,pointages){
						if(err || pointages.length == 0){
							done({status:false, error : err});
						}
						done({status:true, pointages : pointages});
					})
	},
	getAllByUser:function(id_utilisateur,done){
			
		Pointage.find({id_utilisateur:id_utilisateur})
				   .populate('id_utilisateur')
				   .exec(function(err,pointages){
						if(err || pointages.length == 0){
							done({status:false, error : err});
						}
						done({status:true, pointages : pointages});
					})
	},
	getOneById:function(id,done){
			
		Pointage.findOne({id:id})
				   .populate('id_utilisateur')
				   .exec(function(err,pointage){
						if(err || pointage.length == 0){
							done({status:false, error : err});
						}
						done({status:true, pointage : pointage});
					})
	},



	create:function(req,done){
		var pointage= {
			id_utilisateur : req.param('id_utilisateur'),
			date_entree : new Date(req.param('date_entree')),
			date_sorti : new Date(req.param('date_sorti')),
			createdat : new Date(),
			updatedat : new Date()
		}
		Pointage.create(pointage, function(err,ok){
			if(err){
				done({status:false, error : err});
			}
			done({status:true,pointage:ok});

		})
	},
	update:function(req,done){
		var pointage= {
			id_utilisateur : req.param('id_utilisateur'),
			date_entree : new Date(req.param('date_entree')),
			date_sorti : new Date(req.param('date_sorti')),
		}
		Pointage.update({id:req.param('id')},pointage).exec(function(err,update){
			if (err) {
				done({status:false,error:err});
			}else{
			done({status:true,update:update});
		}
		})

	},
	delete:function(id,done){
		Pointage.destroy({id:id})
			.exec(function(err,destroy){
				if(err){
					done({status:false, error : err});
				}
				done({status:true});
			})
	}
	
};

