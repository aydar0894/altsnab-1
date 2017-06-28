/* Search city */
function getJSON(url, callback) {
    var request = new XMLHttpRequest();
    request.open("GET", url, true);
    request.onload = function(e) {
        if (request.status >= 200 && request.readyState < 400) {
            var res = request.responseText;
            callback(JSON.parse(res));
        } else {
            console.error(request.statusText);
        }
    };

    request.onerror = function(e) {
        console.error(request.statusText);
    };
    request.send(null);
}
var apiURL = "http://api.sypexgeo.net/json/";

getJSON(apiURL, function(data) {
    var changecity = document.getElementById("changecity");
    var currentcity = (data['city']['name_ru']);
    changecity.innerHTML = currentcity;
});

(function($) {
  /* Show/Hide header > nav */
  function shownav1() {
    var navwidth = $("#nav > ul")[0].getBoundingClientRect().width;
    $("header .two .search").css({"width": navwidth + "px","display": "inline-block"});
    $("#nav > ul").css({"display": "none"});
    $(this).one("click", shownav2);
  }

  function shownav2() {
    $("header .two .search").css({"display": "none"});
    $("#nav > ul").css({"display": "flex"});
    $(this).one("click", shownav1);
  }
  $("#nav .search-trigger").one("click", shownav1);

  /* AddClass for RegistrationForm */
  $(".click-me.label input[type=checkbox]").click(function() {
    $(this).closest(".click-me.label").children(".extra").toggleClass("uk-display-block");
  });

  /* Check value in required input's */
  $('.uk-input.required').on('focus', function() {
    if ($(this).val()=='') $(this).removeClass("empty");
    if ($(this).val()!='') $(this).removeClass("full");
  });
  $('.uk-input.required').on('blur', function() {
      if ($(this).val()=='') $(this).toggleClass("empty");
      if ($(this).val()!='') $(this).toggleClass("full");
  });

  /* Show/Hide password in form */
  $(".uk-icon.near-password").click(function(){
    if ($(this).next().prop('type')=='password'){
        $(this).attr('uk-icon', 'icon: unlock');
        $(this).next().prop('type', 'text');
    } else {
      $(this).attr('uk-icon', 'icon: lock');
      $(this).next().prop('type', 'password');
    }
  });
})(jQuery);
