/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes map URLs to views and controllers.
 *
 * If Sails receives a URL that doesn't match any of the routes below,
 * it will check for matching files (images, scripts, stylesheets, etc.)
 * in your assets directory.  e.g. `http://localhost:1337/images/foo.jpg`
 * might match an image file: `/assets/images/foo.jpg`
 *
 * Finally, if those don't match either, the default 404 handler is triggered.
 * See `api/responses/notFound.js` to adjust your app's 404 logic.
 *
 * Note: Sails doesn't ACTUALLY serve stuff from `assets`-- the default Gruntfile in Sails copies
 * flat files from `assets` to `.tmp/public`.  This allows you to do things like compile LESS or
 * CoffeeScript for the front-end.
 *
 * For more information on configuring custom routes, check out:
 * http://sailsjs.org/#!/documentation/concepts/Routes/RouteTargetSyntax.html
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` (or `views/homepage.jade`, *
  * etc. depending on your default view engine) your home page.              *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  '/': 'AuthController.homepage',

  //Connexion et deconnexion
  'get /login': 'AuthController.pageLogin',
  'get /newmdp': 'AuthController.pageNewmdp',
  'post /login':'AuthController.login',
  '/logout':'AuthController.logout',
  'post /newmdp' : 'AuthController.newmdp',
  'get /newmdp/:token' : 'AuthController.beforeupdatenewmdp',
  'post /newmdp/confirme' : 'AuthController.updatenewmdp',


  //Recupération, Création, Modification, Suppression Utilisateur
  '/user':'GestionUtilisateurAdminController.get',
  'get /user/create':'GestionUtilisateurAdminController.beforecreate',
  'post /user/create':'GestionUtilisateurAdminController.create',
  'get /user/update/:id':'GestionUtilisateurAdminController.beforeupdate',
  'post /user/update/:id':'GestionUtilisateurAdminController.update',
  '/user/delete/:id':'GestionUtilisateurAdminController.delete',
  '/user/compte':'GestionUtilisateurController.compte',

  //Recupération, Création, Modification, Suppression Pointage
  '/user/:id_utilisateur/pointage':'GestionPointageController.get',
  'get /user/:id_utilisateur/pointage/create':'GestionPointageController.beforecreate',
  'post /user/:id_utilisateur/pointage/create':'GestionPointageController.create',
  'get /user/:id_utilisateur/pointage/update/:id':'GestionPointageController.beforeupdate',
  'post /user/:id_utilisateur/pointage/update/:id':'GestionPointageController.update',
  '/user/:id_utilisateur/pointage/delete/:id':'GestionPointageController.delete',
  //Recupération, Création, Modification, Suppression Pointage user
  '/pointageCompte':'GestionPointageController.userGet',
  'post /pointage/create':'GestionPointageController.userCreate',
  '/pointage':'GestionPointageController.getPointageUsers',
  

  //Paiement
  //'/user/:id_utilisateur/paiement/remboursement/:id_ligneCommande':'GestionPaiementAdminController.createPaiementRemboursement',
  '/user/:id_utilisateur/paiement':'GestionPaiementAdminController.get',
  '/paiementCompte':'GestionPaiementAdminController.getPaiementCompte',
  '/paiement':'GestionPaiementAdminController.getPaiementUsers',


  //Data entreprise
  '/data':'GestionDonneesController.get',
  '/SalleFrequentationTotale':'GestionDonneesAdminController.getSalleFrequentationTotale',
  '/SalleFrequentationJour':'GestionDonneesAdminController.getSalleFrequentationJour',
  '/SalleAffluence':'GestionDonneesController.getSalleAffluence',
  '/CantineFrequentationTotale':'GestionDonneesAdminController.getCantineFrequentationTotale',
  '/CantineFrequentationJour':'GestionDonneesAdminController.getCantineFrequentationJour',
  '/CantineAffluence':'GestionDonneesController.getCantineAffluence',
  '/CantineNombreAchat':'GestionDonneesAdminController.getCantineNombreAchat',
  '/CENombreAchat':'GestionDonneesAdminController.getCENombreAchat',
  '/CETopTenSortie':'GestionDonneesController.getCETopTenSortie',


  //'/email':'Email/emailController.sendEmail',


  /***************************************************************************
  *                                                                          *
  * Custom routes here...                                                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the custom routes above, it   *
  * is matched against Sails route blueprints. See `config/blueprints.js`    *
  * for configuration options and examples.                                  *
  *                                                                          *
  ***************************************************************************/

};
