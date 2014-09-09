FirstAndLearn.PathsController = function () {
  this.addAssetListeners();
};

FirstAndLearn.PathsController.prototype = {
  addAssetListeners: function () {
    $('.create-assets-button').on('click', this.showAssetsForm.bind(this));
  },

  showAssetsForm: function (e) {
    e.preventDefault();
    $('#assets-partial .login').toggleClass('login');
    $('#assets-partial').fadeIn('slow');
  }
};
