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

	userCreate:function(req,done){

		format_date = function(string){
			var explode = string.split(" ")
			var date = explode[0].split("-")
			var time = explode[1].split(":")
			return new Date(date[2], date[1], date[0], time[1], date[0])
		}

		Pointage.query("SELECT * FROM pointage WHERE date_sorti IS NULL ORDER BY date_entree DESC LIMIT 1", function(err, pointages){
			if(err) return done({status:false, error : err});

			if( pointages.length != 0 ){
				var pointage = pointages[0];
				pointage.date_sorti = new Date();

				Pointage.update(pointage.id, pointage, function(err,ok){
					if(err){
						return done({status:false, error : err});
					}
					else{
						return done({status:true,pointage:ok});
					}
				})
			}
			else{
				var pointage = {
					id_utilisateur : req.session.user.id,
					date_entree : new Date(),
					date_sorti : null
				}

				Pointage.create(pointage, function(err,ok){
					if(err){
						console.log("creation", err)
						return done({status:false, error : err});
					}
					else{
						return done({status:true,pointage:ok});
					}
				})
			}

		});


	},


	create:function(req,done){

		format_date = function(string){
			var explode = string.split(" ")
			var date = explode[0].split("-")
			var time = explode[1].split(":")
			return new Date(date[2], date[1], date[0], time[1], date[0])
		}

		var pointage= {
			id_utilisateur : req.param('id_utilisateur'),
			date_entree : format_date(req.param('date_entree')),
			date_sorti : format_date(req.param('date_sorti'))
		}
		Pointage.create(pointage, function(err,ok){
			if(err){
				done({status:false, error : err});
			}
			else{
				done({status:true,pointage:ok});
			}

		})
	},
	update:function(req,done){

		format_date = function(string){
			var explode = string.split(" ")
			var date = explode[0].split("-")
			var time = explode[1].split(":")
			return new Date(date[2], date[1], date[0], time[1], date[0])
		}

		var pointage= {
			id_utilisateur : req.param('id_utilisateur'),
			date_entree : format_date(req.param('date_entree')),
			date_sorti : format_date(req.param('date_sorti')),
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

