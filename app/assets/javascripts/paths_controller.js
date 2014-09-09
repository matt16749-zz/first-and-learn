FirstAndLearn.PathsController = function () {
  this.addAssetListeners();
};

FirstAndLearn.PathsController.prototype = {
  addAssetListeners: function () {
    $('.create-assets-button').on('click', this.showAssetsForm.bind(this));
    $('[value="Save Asset"]').on('click', this.saveAsset.bind(this));
  },

  clearAssetFormAndAppendToSelectMenu: function (asset) {
    $('#assets-partial').fadeOut('fast', function () {
      $('#asset_title').val('');
      $('#asset_description').val('');
      $('#asset_url').val('');
    });
    $('#asset_asset_id').append('<option value="' + asset.id + '">' + asset.title + '</option>');
    $('[value="' + asset.id + '"]').prop('selected', true);
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
    .done(this.clearAssetFormAndAppendToSelectMenu.bind(this));
  }
};
