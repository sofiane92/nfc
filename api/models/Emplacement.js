/**
 * Emplacement.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
  	nom_emplacement:'STRING',
  	type:'STRING',
    nb_place:'STRING',
    localisation: {
      collection: 'localisation',
      via: 'id'
    }
  }
};

