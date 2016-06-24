var bcrypt = require('bcryptjs');
var passport = require('passport');
var connexionController = require('./ConnexionController');
var utilisateurController = require('./UtilisateurController');
var emailController = require('./Email/emailController');
module.exports = {

   homepage:function(req,res){
    return res.view('homepage', {title:'Homepage'});
   },
   pageLogin:function(req,res){
    if(typeof req.session.user === 'undefined'){
      res.view('login');

    }else{
      res.redirect("/");
    }
   },
   pageNewmdp:function(req,res){
    if(typeof req.session.user === 'undefined'){
      console.log('ok');
      res.view('newmdp');
    }else{
      console.log("nope");
      res.redirect("/");
    }
   },
   login: function(req, res)
      {
          passport.authenticate('local', function(err, user, info)
          {
              if ((err) || (!user))
              {
                  res.view('login',info);
                  return;
              }
              req.logIn(user, function(err)
              {
                  if (err)
                  {
                    res.view('login',info);
                      return;
                  }
                  utilisateurController.getOneById(user[0].id_utilisateur,function(obj){
                    req.session.user= obj.utilisateur;
                    return res.redirect('/');
                  });
              });
          })(req, res);
      },

   logout: function (req,res){
    req.logout();
    req.session.destroy();
    res.redirect('/login');
  },
  newmdp:function(req,res){
    connexionController.getOneByLogin(req.param('username'),function(obj){
      if(obj.status){
        emailController.sendEmail("newMdp",obj.utilisateur[0],obj.utilisateur[0].id_utilisateur.mail,"Nouveau mot de passe"); 
        res.view('newmdp',{messageSuccess : "Un mail vous a été envoyé pour la modification de votre mot de passe." });
        return;
        
      }else{
        console.log("user n'existe ");
        res.view('newmdp',{messageError : "Le login n'existe pas." });
        //user n'existe pas
      }

    })
    //emailController.sendEmail(obj.utilisateur.nom,obj.utilisateur.prenom,objConnexion.login.login,objConnexion.login.password,objConnexion.login.salt);            
  },
  beforeupdatenewmdp:function(req,res){
    console.log('toto');
    var login = req.param('login');
    var token = req.param('token');
    connexionController.getOneByToken(token,function(obj){
      if(obj.status){
        if(obj.utilisateur[0].salt === token){
          res.view('modification');
        }else{
          return res.redirect('/');
        }
      }else{
         return res.redirect('/');
      }
    })
  },
  updatenewmdp:function(req,res){
    var token = req.param('token');
    connexionController.getOneByToken(token,function(obj){
      console.log(obj.status);
      if(obj.status){
        if(obj.utilisateur[0].salt == token){
          if(req.param('mdp') == req.param('confirmation')){
            console.log("////////////////");
            connexionController.updatePassword(obj.utilisateur[0].login,req.param('mdp'),function(done){
              console.log(done);
              if(done.status){
                return res.redirect('/');
              }else{
                console.log(done.err);
                return res.redirect('/');
              }
            })
          }else{
            console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            return res.redirect('/');
          }
        }else{
          return res.redirect('/');
        }
      }else{
         return res.redirect('/');
      }
    })
  }

};