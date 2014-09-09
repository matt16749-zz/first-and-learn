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
    $('#assets-partial').fadeIn();
  },

  saveAsset: function (e) {
    e.preventDefault();
    var newAssetData = {
      asset: {
        title: e.target.form.asset_title.value,
        description: e.target.form.asset_description.value,
        url: e.target.form.asset_url.value
      }
    };

    $.ajax({
      url: '/assets',
      type: 'POST',
      data: newAssetData
    })
    .done(this.addAssetToSelectMenu);
  }
};
