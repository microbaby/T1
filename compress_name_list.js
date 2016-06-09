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
$("form").css({"margin":"0"});

/* table padding */
$(".table th, .table td").css({"padding":"0"});

/* table width */
$(".table").css({"width":"0px"});

/* table border */
$(".table-bordered,.table-bordered th, .table-bordered td,.table th, .table td").css({"border":"3px solid red"});

/*
.table-bordered th, .table-bordered td
border-left
*/

})();
