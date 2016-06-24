var passport = require('passport');
var passportLocal = require('passport-local');
var bcrypt = require('bcryptjs');

passport.serializeUser(function(user, done) {
    done(null, user[0].id_utilisateur);
});

passport.deserializeUser(function(id, done) {
    Connexion.find({id_utilisateur:id}).exec(function (err, user) {
        done(err, user);
    });
});

passport.use(new passportLocal.Strategy({usernameField: 'username', passwordField: 'password'},function(username, password, done) {
   
    
    Connexion.find({ login: username}).exec(function(err, user) {
          if (err) { return done(err); }
            if (user.length==0) { return done(null, false, { message: 'Utilisateur inconnu : ' + username }); }
            if (bcrypt.compareSync(password, user[0].password) ) { return done(null, user);}
            return done(null, false, { message: 'Mot de passe incorrect' });
            
        });
    }
));