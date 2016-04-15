module.exports = function(req, res, next) {

  // User is allowed, proceed to the next policy, 
  // or if this is the last policy, the controller
  if(typeof req.session.user.id_role !== 'undefined'){
  	if (req.session.user.id_role.id==1) {
    	return next();
    }
  }
  // User is not allowed
  // (default res.forbidden() behavior can be overridden in `config/403.js`)
  return res.forbidden();
};