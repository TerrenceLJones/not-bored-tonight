(function(){
  $(document).ready(init);

  function init(){
    $("#stay-in").on('click', showMenuItems);
    $("#go-out").on('click', showMenuItems);
  }

  function showMenuItems(event) {
    event.preventDefault();
    var id = $(this).attr("id");

    if(id == "stay-in") {
      $(".navigation__stay-in").addClass("active");
      $(".navigation__go-out").removeClass("active");
    }
    else if(id == "go-out")  {
      $(".navigation__go-out").addClass("active");
      $(".navigation__stay-in").removeClass("active");

    }
  }
})();
