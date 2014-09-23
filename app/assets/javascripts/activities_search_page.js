(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    geoLocation();
    $(".query-item").on('click', getSearchResults);
    $("#search-results").on('click', "#save-activity", addToCalendar);
  }

  var coords;

  function getSearchResults(event){
    event.preventDefault();

    var searchParams = {
      searchTerm: $(this).text().toLowerCase(),
      searchDate: $("select#search-date option:selected").val().toLowerCase().trim().split(" ").join(""),
      searchLocation: $("#search-location").val() || coords || "37215",
      searchRadius: $("select#search-radius option:selected").val(),
      isHeaderSearchSelector: false
    };

    $.ajax({url:"/activities", type:'GET', data:searchParams, dataType:"script"});
  }

  function addToCalendar(event) {
    event.preventDefault();
    var parent = $(this).closest('.search-results__activity'),
        activity = {
        name: parent.children('.activity__name').text(),
        venue_name: parent.children('.activity__venue-name').text(),
        time: parent.children('.activity__time').text(),
        location: parent.children('.activity__location').text(),
        description: parent.children('.activity__description').text()
      };

    $.ajax({url:'/activities', type:'POST', data:activity});
  }

})();
