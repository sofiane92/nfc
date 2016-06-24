/**
 * Validation.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
 var validator = require('validator');
module.exports = {

trimEscape: function(req){

        var param = req.params.all();
        for(var p in param){
          if(p != 'commit'){
            param[p] = validator.escape(param[p]);
            param[p] = validator.trim(param[p]);
          }
          if(p=='tel'){
            param[p] = param[p].replace(/\D+/g,'')
          }
        }
        return param;
},

userCreation: function(req,res){
        var regtel ='/^0[1-689][0-9]{8}$/';
        isOk = true;
        messageError='';
        
        if(!validator.isEmail(req.mail)){
          console.log('11111111111111111111111');
          isOk=false;
          messageError += 'Le mail n\'est pas correct \n';
        }
        if(!validator.isAlpha(req.nom,['fr-FR'])){
          console.log('22222222222222222222222');
          isOk=false;
          messageError += "Le nom doit être composé que de lettre \n";
        }
        if(!validator.isAlpha(req.prenom,['fr-FR'])){
          console.log('33333333333333333333333');
          isOk=false;
          messageError += "Le prenom doit être composé que de lettre \n";
        }
        if(req.tel.length != 10){
          console.log('444444444444444444444444444');
          isOk=false;
          messageError += "Le numéro de téléphone ne doit pas être inférieur ou supérieur à 10 chiffre \n";
        }
        if(regtel.match(req.tel)){
          console.log('5555555555555555555555555555');
          isOk = false;
          messageError += "Le numéro de téléphone doit commencé par '0' \n";
        }
        return res({isOk:isOk, messageError:messageError});
}

// pointageCreation: function(req,res){
//         var regdate = '/^(([0]?[1-9]|1[0-2])/([0-2]?[0-9]|3[0-1])/[1-2]\d{3}) (20|21|22|23|[0-1]?\d{1}):([0-5]?\d{1})$/';
//         isOk = true;
//         messageError='';

//         if(!regdate.match(req.date_entree) && !regdate.match(req.date_sortie)){
//           console.log('11111111111111111111111');
//           isOk = false;
//           messageError += "Erreur de date \n";
//         }
//         else{
//           if(new Date(req.date_entree)  > new Date(req.date_sortie) ){
//             console.log('22222222222222222222222');
//             isOk = false;
//             messageError += "Erreur ordre des dates \n";
//           }
//         }

//         return res({isOk:isOk, messageError:messageError});
// }
  
};

