/**
 * Role.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
	connection:'mysqlServer',
	tableName:'role',
  attributes: {
  	nom_role:{       type: 'STRING'     },
  	utilisateur: {
      collection: 'utilisateur',
      via: 'id_role'
    }
  }
};

