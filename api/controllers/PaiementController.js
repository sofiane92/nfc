/**
 * PaiementController
 *
 * @description :: Server-side logic for managing utilisateurs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	getPaiementCompte:function(id,done){
		Paiement.query("SELECT DATE_FORMAT(t.date,'%d/%m/%y') as date,l.id_commande, a.nom_article,l.quantite,(a.prix_article*l.quantite)as prix_total, t.type_transaction, t.id, t.id_compte FROM transaction t LEFT JOIN compte c on t.id_compte = c.id RIGHT JOIN lignecommande l on t.id_commande = l.id_commande RIGHT JOIN article a ON l.id_article = a.id WHERE t.type_transaction = 'Débit' AND c.id_utilisateur = " + id + " UNION SELECT DATE_FORMAT(t.date,'%d/%m/%y') as date, t.id_commande, t.commentaire, 1, t.montant, t.type_transaction, t.id, t.id_compte FROM transaction t JOIN compte c ON t.id_compte = c.id WHERE t.type_transaction='Remboursement' AND c.id_utilisateur = " + id + " ORDER BY DATE_FORMAT(date,'%d/%m/%y')", function(err, paiements) {		  
			if(err || paiements.length == 0){
				done({status:false, error : err});
			}
			console.log(paiements);
			done({status:true, paiements : paiements});
		})
	},

	getTransaction:function(id,done){
		Paiement.query("SELECT DATE_FORMAT(t.date,'%d/%m/%y') as date,l.id_commande, a.nom_article,l.quantite,(a.prix_article*l.quantite)as prix_total, t.type_transaction, t.id FROM transaction t LEFT JOIN compte c on t.id_compte = c.id RIGHT JOIN lignecommande l on t.id_commande = l.id_commande RIGHT JOIN article a ON l.id_article = a.id WHERE t.type_transaction = 'Débit' AND t.id = " + id, function(err, paiements) {		  
			if(err || paiements.length == 0){
				done({status:false, error : err});
			}
			console.log(paiements);
			done({status:true, paiements : paiements});
		})
	},

	createPaiementRemboursement:function(id_compte,montant,id_commande,article,done){
		Paiement.query("INSERT INTO transaction(id_compte, type_transaction, montant, date, id_commande, commentaire, createdat, updatedat) VALUES ("+id_compte+",'Remboursement',"+montant+",NOW(),"+id_commande+",'"+article+"',NOW(),NOW())", function(err, paiements) {		  
			if(err || paiements.length == 0){
				done({status:false, error : err});
			}
			console.log(paiements);
			done({status:true, paiements : paiements});
		})
	},



};

