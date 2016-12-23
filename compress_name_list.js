javascript:(function(){

/*
"compress 👥list"
a bookmarklet to compress names on API list names page
by PATRICK RAFANAN for BFA keywording
v.b1 created 06.09.2016
*/

  /* hide user column data */
$(".user_chooser").css({"display":"none"});

/* form margins */
$("table form").css({"margin":"0 0 0 0"});

  /* extend name field width */
$("input").css({"width":"606px"});
  
  /* reduce spacing between name fields */
$("input").css({"margin-bottom":"0px"});
$("input").css({"padding":"0px 3px 0px"});
$("input").css({"height":"18px"});

  /* table padding */
$(".table th, .table td").css({"padding":"0"});
  
  /* table width */
$(".table").css({"width":"0px"});

  /* table borders */
$(".table-bordered").css({"border":"1px solid green"});
/*$(".table th, .table td").css({"border-top":"3px solid #00FF00"});*/
/*$(".table-bordered th, .table-bordered td").css({"border-left":"3px solid blue"});*/
  
})();
