FirstAndLearn = {};

$(document).on('page:change', function () {
  var controllers = {
    assetsController: new FirstAndLearn.AssetsController(),
    tagsController: new FirstAndLearn.TagsController()
  };

  new FirstAndLearn.MasterController(controllers);
});

FirstAndLearn.MasterController = function (controllers) {
  this.assetsController = controllers.AssetsController;
  this.tagsController = controllers.tagsController;
};
