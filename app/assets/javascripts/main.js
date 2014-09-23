(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    $("#search-box").on("change",searchActivities);
  }

  function searchActivities() {
    var searchParams = {
      searchTerm: $("#search-box").val().toLowerCase(),
      searchDate: "future",
      searchLocation: coords,
      searchRadius: "20",
      isHeaderSearchSelector: true
    };

    if (searchParams.searchLocation == undefined) {
      console.log("null");
    }
    else {
      $.ajax({url:"/activities", type:'GET', data:searchParams});
    }

  }



})();
