FirstAndLearn.TagsController = function () {
  this.addTagsListeners();
};

FirstAndLearn.TagsController.prototype = {
  addTagsListeners: function () {
    $('.create-tags-button').on('click', this.showAndHideTagCreationInput.bind(this));
    $('#add-tags').on('click', this.getTagsFromInputAndCreate.bind(this));
  },

  addTagsToPathTagList: function (tagsToAdd) {
    var tagsToAddArray = tagsToAdd.tags;
    var tagsShowing = this.getTagsFromPage();
    var newTagsLength = tagsToAddArray.length;

    for (var i = 0; i < newTagsLength; i++) {
      if (tagsShowing.indexOf(tagsToAddArray[i]) !== -1)
        tagsShowing.push(tagsToAddArray[i]);
    }

    var allTagsHTML = this.sortAndCreateHTML(tagsShowing);

    $('#path-tags').empty().html(allTagsHTML);
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
