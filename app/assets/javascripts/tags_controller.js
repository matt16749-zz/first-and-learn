FirstAndLearn.TagsController = function () {
  this.addTagsListeners();
};

FirstAndLearn.TagsController.prototype = {
  addTagsListeners: function () {
    $('.create-tags-button').on('click', this.showAndHideTagCreationInput.bind(this));
    $('#add-tags').on('click', this.getTagsFromInputAndCreate.bind(this));
  },

  addTagsToPathFormAndHideAddTagsForm: function (tagsToAdd) {
    var tagsToAddString = tagsToAdd.tags.join(', ');
    $('#tags-for-path').val(tagsToAddString);
    $('#tags-partial').fadeOut(function () {
      $('[name="tag[name]"]').val('');
    });
  },

  getTagsFromInputAndCreate: function (e) {
    e.preventDefault();
    var addingTagsToThisClass = window.location.href.split('/').slice(-2, -1)[0].slice(0, -1);
    var addingTagsToThisObjectNum = window.location.href.split('/').slice(-1)[0];

    if (addingTagsToThisClass === 'path')
      tagsToCreate = { tag: { name: $('[name="tag[name]"]').val() }, path_id: parseInt(addingTagsToThisObjectNum, 10) };
    else if (addingTagsToThisClass === 'asset')
      tagsToCreate = { tag: { name: $('[name="tag[name]"]').val() }, asset_id: parseInt(addingTagsToThisObjectNum, 10) };

    $.ajax({
      type: 'POST',
      url: '/tags',
      data: tagsToCreate
    })
    .done(this.addTagsToPathFormAndHideAddTagsForm);
  },

  showAndHideTagCreationInput: function (e) {
    e.preventDefault();
    var tagsPartial = $('#tags-partial');
    if (tagsPartial.hasClass('shown'))
      tagsPartial.fadeOut();
    else
      tagsPartial.fadeIn();
    tagsPartial.toggleClass('shown');
  }
};
