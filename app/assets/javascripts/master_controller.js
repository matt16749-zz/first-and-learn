FirstAndLearn = {};

$(document).on('page:change', function () {
  var controllers = {
    assetsController: new FirstAndLearn.AssetsController()
  };

  new FirstAndLearn.MasterController(controllers);
});

FirstAndLearn.MasterController = function (controllers) {
  this.assetsController = controllers.AssetsController;
};
