/**
 * Connexion.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  	login:{
      type:'STRING',
      unique: true,
      
    },
  	password:'STRING',
  	salt:'STRING',
  	id_utilisateur: {
      model: 'utilisateur'
    }
  }
};

