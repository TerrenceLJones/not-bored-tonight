(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    $(".sort").on('click', sortActivities);
  }

  function sortActivities() {
    var type = $(this).text().toLowerCase(),
        $activities = $(".dashboard__activity"),
        orderedByDateActivities


    if (type == "name") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return $(a).find(".activity__name").text() > $(b).find(".activity__name").text();
      });
      $(".user-activities").empty().html(orderedByDateActivities);
    }

    else if (type == "date") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return $(a).find(".activity__date").text() > $(b).find(".activity__date").text();
      });
      $(".user-activities").empty().html(orderedByDateActivities);
    }

    else if (type == "venue") {
      orderedByDateActivities = $activities.sort(function(a,b){
        return $(a).find(".activity__venue-name").text() > $(b).find(".activity__venue-name").text();
      });
      $(".user-activities").empty().html(orderedByDateActivities);
    }
  }
})();
