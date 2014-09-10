FirstAndLearn.PathsController = function () {
  this.addAssetListeners();
};

FirstAndLearn.PathsController.prototype = {
  addAssetListeners: function () {
    $('.create-assets-button').on('click', this.showAssetsForm.bind(this));
    $('[value="Save Asset"]').on('click', this.saveAsset.bind(this));
  },

  clearAssetForm: function (asset) {
    $('#assets-partial').fadeOut('fast', function () {
      $('#asset_title').val('');
      $('#asset_description').val('');
      $('#asset_url').val('');
      this.whereToAppendNewAsset(asset);
    }.bind(this));
  },

  highlightAssetAndThenRemove: function () {
    $('#asset_asset_id').css('border','3px solid green');
    setTimeout(this.removeGreenBorder, 3000);
  },

  removeGreenBorder: function () {
    $('#asset_asset_id').css('border', 'none');
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
    .done(this.clearAssetForm.bind(this));
  },

  whereToAppendNewAsset: function (asset) {
    if ($('#asset_asset_id').length > 0)
      this.appendNewAssetToSelectMenu(asset);
    else
      this.appendNewAsset(asset);
  }
};
