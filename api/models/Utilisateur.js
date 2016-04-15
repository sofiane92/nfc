/**
 * Utilisateur.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
  	nom:'STRING',
  	prenom:'STRING',
  	mail:{
      type:'STRING',
      unique: true,
      
    },
  	tel:{
      type:'STRING',
      unique: true,
      
    },
  	id_nfc:'STRING',
  	id_service: {
      model: 'service'
    },
  	id_role: {
      model: 'role'
    },
    connexion: {
      collection: 'connexion',
      via: 'id_utilisateur'
    },
    compte: {
      collection: 'compte',
      via: 'id_utilisateur'
    }
  },
};

