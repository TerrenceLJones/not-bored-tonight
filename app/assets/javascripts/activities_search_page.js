
(function(){
  "use strict"
  $(document).ready(init);

  function init(){
    $(".query-item").on('click', getSearchResults);
  }

  function getSearchResults(event){
    event.preventDefault();

    var searchParams = {
        searchTerm: $(this).text().toLowerCase(),
        searchDate: $("select#search-date option:selected").val().toLowerCase().trim().split(" ").join(""),
        searchLocation: $("#search-location").val(),
        searchRadius: $("select#search-radius option:selected").val()
    };

    $.ajax({url:'/getData', type:'GET', data:searchParams});
  }




})();
