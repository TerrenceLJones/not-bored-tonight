(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    $(".browse-menu__query-item").on("click",searchActivities);
  }

  function searchActivities(event) {

    var item = $(this).text().toLowerCase();

    if (item != "more") {

      event.preventDefault();

      var searchParams = {
        searchTerm: $(this).text().toLowerCase(),
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
  }



})();
