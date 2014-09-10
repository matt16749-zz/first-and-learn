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
    $.ajax({
      type: 'POST',
      url: '/tags',
      data: { tag: { name: $('[name="tag[name]"]').val() } }
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
