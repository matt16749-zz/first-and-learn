FirstAndLearn = {};

$(document).on('page:change', function () {
  var controllers = {
    pathsController: new FirstAndLearn.PathsController()
  };

  new FirstAndLearn.MasterController(controllers);
});

FirstAndLearn.MasterController = function (controllers) {
  this.pathsController = controllers.pathsController;
};
