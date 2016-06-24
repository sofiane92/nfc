/**
 * Paiement.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
  	date:'TIMESTAMP',
  	num_commande:'INTEGER',
  	nom_article:'STRING',
  	prix_total:'FLOAT',
  	type_transaction:'STRING',
  },
};

