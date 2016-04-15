var bcrypt = require('bcryptjs');
var passport = require('passport');
var connexionController = require('./ConnexionController');
var utilisateurController = require('./UtilisateurController');
module.exports = {

   homepage:function(req,res){
    return res.view('homepage', {title:'Homepage'});
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
    res.redirect('/login');
  }
};