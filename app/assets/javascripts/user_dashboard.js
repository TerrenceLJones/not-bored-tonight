(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    $(".sort").on('click', sortActivities);
    $(".user-activities").on('click', ".card", showDescription);
  }

  function sortActivities() {
    var type = $(this).text().toLowerCase(),
        $activities = $(".user-activity"),
        orderedByDateActivities = [];

    if (type == "name") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return $(a).find(".activity__name").text() > $(b).find(".activity__name").text();
      });
      $(".user-activities").empty().append(orderedByDateActivities);
    }

    else if (type == "date") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return (new Date($(a).find(".activity__date").text())) > (new Date($(b).find(".activity__date").text()));
      });
      $(".user-activities").empty().append(orderedByDateActivities);
    }

    else if (type == "venue") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return $(a).find(".activity__venue-name").text() > $(b).find(".activity__venue-name").text();
      });
      $(".user-activities").empty().append(orderedByDateActivities);
    }
  }


  function showDescription() {
    var selectedActvity = $(this).closest('.user-activity');
    var description = selectedActvity.find('.activity__description').toggleClass("hidden");
  }


})();
