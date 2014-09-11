$(document).on("page:change", function(){
  var voteOpts = {
    pathVote: '.vote',
  };
  var pathVote = new PathVoteController(voteOpts);
});

var PathVoteController = function (opts) {
  this.pathVoteSelector = opts.pathVote;

  this.addPathVoteListeners();
};

PathVoteController.prototype = {
  addPathVoteListeners: function () {
    $(this.pathVoteSelector).on('click', this.sendVote.bind(this));
  },

  sendVote: function (e) {
    e.preventDefault();
    if (e.target.dataset.voteableId === undefined)
      var pathId = window.location.href.split('/').slice(-1)[0];
    else
      var pathId = e.target.dataset.voteableId;
    $.ajax({
      url: "/paths/" + pathId + "/votes",
      type: "POST",
      data: e.target.dataset
    })
    .done(function(data){
      $('#vote-count').html('Votes: ' + data.vote_count);
    });
  }
};
