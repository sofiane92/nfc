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
  'get /login': {
    view: 'login'
  },
  'post /login':'AuthController.login',
  '/logout':'AuthController.logout',



  //Recupération, Création, Modification, Suppression Utilisateur
  '/user':'GestionUtilisateurController.get',
  'get /user/create':'GestionUtilisateurController.beforecreate',
  'post /user/create':'GestionUtilisateurController.create',
  'get /user/update/:id':'GestionUtilisateurController.beforeupdate',
  'post /user/update/:id':'GestionUtilisateurController.update',
  '/user/delete/:id':'GestionUtilisateurController.delete',

  //Recupération, Création, Modification, Suppression POintage
  '/user/:id_utilisateur/pointage':'GestionPointageController.get',
  'get /user/:id_utilisateur/pointage/create':'GestionPointageController.beforecreate',
  'post /user/:id_utilisateur/pointage/create':'GestionPointageController.create',
  'get /user/:id_utilisateur/pointage/update/:id':'GestionPointageController.beforeupdate',
  'post /user/:id_utilisateur/pointage/update/:id':'GestionPointageController.update',
  '/user/:id_utilisateur/pointage/delete/:id':'GestionPointageController.delete',

  //Data entreprise
  '/data':'GestionDonneesController.get',
  '/SalleFrequentationTotale':'GestionDonneesController.getSalleFrequentationTotale',
  '/SalleFrequentationJour':'GestionDonneesController.getSalleFrequentationJour',
  '/SalleAffluence':'GestionDonneesController.getSalleAffluence',
  '/CantineFrequentationTotale':'GestionDonneesController.getCantineFrequentationTotale',
  '/CantineFrequentationJour':'GestionDonneesController.getCantineFrequentationJour',
  '/CantineAffluence':'GestionDonneesController.getCantineAffluence',
  '/CantineNombreAchat':'GestionDonneesController.getCantineNombreAchat',
  '/CENombreAchat':'GestionDonneesController.getCENombreAchat',
  '/CETopTenSortie':'GestionDonneesController.getCETopTenSortie',
  //'/frequentation':'GestionDonneesController.getFrequentation',
  //'/localisation':'GestionDonneesController.getLocalisation',

  //Recupération, Création, Modification, Suppression POintage user
  '/pointage':'GestionPointageController.userGet',
  'post /pointage/create':'GestionPointageController.userCreate',

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
