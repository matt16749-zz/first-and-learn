FirstAndLearn.TagsController = function () {
  this.addTagsListeners();
};

FirstAndLearn.TagsController.prototype = {
  addTagsListeners: function () {
    $('.create-tags-button').on('click', this.showTagCreationInput.bind(this));
    $('#add-tags').on('click', this.getTagsFromInputAndCreate.bind(this));
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

  showTagCreationInput: function (e) {
    e.preventDefault();
    $('#tags-partial').fadeIn();
  }
};
