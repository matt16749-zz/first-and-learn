FirstAndLearn.AssetsController = function () {
  this.addAssetListeners();
};

FirstAndLearn.AssetsController.prototype = {
  addAssetListeners: function () {
    $('.create-assets-button').on('click', this.showAssetsForm.bind(this));
    $('[value="Save Asset"]').on('click', this.saveAsset.bind(this));
  },

  appendNewAsset: function (asset) {
    var newAssetHTML =  '<div style="display: none" class="asset">' +
                        '<h3>' + asset.title +'</h3>' +
                        '<button class="styled-button"><a href="/assets/' + asset.id + '">Details</a></button>' + " " +
                        '<button class="styled-button"><a href="' + asset.url + '">View Asset</a></button>' +
                        '<p>Description: ' + asset.description  + '</p>' +
                        '</div>';
    $('#asset-list').prepend(newAssetHTML);
    $('#asset-list div:first').fadeIn('slow');
  },

  appendNewAssetToSelectMenu: function (asset) {
    $('#asset_asset_id').append('<option value="' + asset.id + '">' + asset.title + '</option>');
    $('[value="' + asset.id + '"]').prop('selected', true);
    this.highlightAssetAndThenRemove();
  },

  clearAssetForm: function (asset) {
    $('#assets-partial').fadeOut('fast', function () {
      $('#asset_title').val('');
      $('#asset_description').val('');
      $('#asset_url').val('');
      $('#asset_asset_type').prop('selectedIndex', 0)
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
        url: e.target.form.asset_url.value,
        asset_type: e.target.form.asset_asset_type.value
      }
    };

    $.ajax({
      url: '/assets',
      type: 'POST',
      data: newAssetData
    })
    .done(this.clearAssetForm.bind(this))
    .fail(function (failData) {
      console.log('Asset creation failed: ');
      console.log(failData);
      console.log(Object.keys(failData));
    });
  },

  whereToAppendNewAsset: function (asset) {
    if ($('#asset_asset_id').length > 0)
      this.appendNewAssetToSelectMenu(asset);
    else
      this.appendNewAsset(asset);
  }
};
