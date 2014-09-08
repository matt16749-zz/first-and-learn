$(document).on("page:change", function(){
  var voteOpts = {
    pathVote: '.path-vote',
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
    $.ajax({
      url: "/paths/"+ e.target.dataset.voteableId + "/votes",
      type: "POST",
      data: e.target.dataset
    })
    .done(function(data){
      $('#path-vote-count').html(data.vote_count);
    });
  }
};
