$(document).on("page:change", function(){
  var pathVote = $("#path-vote");
  var pathVoteState = pathVote.data("vote-state");
  var pathVoteableId = pathVote.data("voteable-id");
  var pathVoteableType = pathVote.data("voteable-type");

  pathVote.click(function(){
   $.ajax({
        url: "/paths/"+ pathVoteableId + "/votes",
        type: "POST",
        data: {
          voteState: pathVoteState,
          voteableId: pathVoteableId,
          voteableType: pathVoteableType
        }
    }).done(function(data){
      console.log(data)
    });
  });
});
