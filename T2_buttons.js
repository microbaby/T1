javascript: (function() {
/*
"🙈bulk_tag_buttons (hide'm)"
Cleans up thumbnails on bulk_tag keywording API
by PATRICK RAFANAN for BFA keywording

v.91 06/09/2016 increase width of thumbnail area
v.9s 06/04/2016 adapt for tag search pages
v.9b 04/17/2016 reduce top padding; expand caption height; really hide filename
v.904/15/2016 thumnail area widen, tags list narrow; add big buttons
v.8 03/17/2016 reinstate rounded corner
v.7 03/11/2016 hide thumbnail filename div
v.6 01/19/2016 thumbnail & tags background & border styling
v.5 12/15/2015 caption & border styling, hide caption filename
v.4 11/03/2015 hides hero slider
v.3 10/23/2015 hides icons on front end, extends tags field
v.2 10/19/2015 hides filenames in captions
*/

/* All siblings of div with specific class will be hidden */ 
$('.events').siblings().hide(); /* from bfa.com */
$('#header').hide();
$('.content-slider').hide();
$('.hero-slider').hide();
$('.icons').hide();
$('.navbar').hide();
$('#search-box').hide();
$('.search-header').hide();
$('.sidebar').hide();
$("body").css({"padding-top": "0px"});

/* from api */
$(".container").css({"margin-left": "30px"});
$(".container").css({"width": "2000px"});
/* $('.navbar').hide();$('#footer').hide();*/
/* All div's with class as cat will be shown. */
$('.photos-list').show();

/* THUMBNAILS BOX */
/*$(".span9 .well").css({"background-color":"#ddd"});
$(".row-fluid .span9").css({"width":"91%"}); */
$(".span9").css({"width": "88%"});

/* THUMBNAIL BORDER */
$(".bulk-tag-photo-wrapper").css({"border-width": "8px"});
$(".thumbnail").css({"padding": "0px"});
$(".thumbnail,.well").css({"-webkit-box-shadow": "0px"});
$(".thumbnail,.well").css({"-moz-box-shadow": "0px"});
$(".thumbnail,.well").css({"box-shadow": "none"});
$(".content").css({"padding": "0px"});

/*$(".thumbnail,.well").css({"-webkit-border-radius":"0px"});
$(".thumbnail,.well").css({"-moz-border-radius":"0px"});
$(".thumbnail,.well").css({"border-radius":"0px"}); */

/* THUMBNAIL CAPTION NAME */
$(".bulk-photo-caption").css({"background-color": "aquamarine"});
$(".bulk-photo-caption").css({"visibility": "visible"});
$(".bulk-photo-caption").css({"max-height": "none"});
$(".bulk-photo-caption").css({"overflow-y": "visible"});
$(".bulk-photo-caption").css({"position": "relative"});
$(".bulk-photo-caption").css({"top": "-20px"});

/* HIDE THUMBNAIL CAPTION FILENAME */
/* $(".bulk-photo-caption.nosle").css({"background-color":"#ddd"}); */
/* $(".bulk-photo-caption.nosle").css({"color":"#ddd"}); */
/* $(".bulk-photo-caption.nosle").css({"display":"none"}); */
$(".bulk-photo-caption.nosle").css({"visibility": "hidden"});

/* TAGS LIST */
$(".active_tag_list_wrapper").css({"max-height": "800px"});
$(".active_tag_list_wrapper").css({"width": "300px"});
$(" .span3 .well").css({"border-color": "whitesmoke"});
$(".row-fluid .span3").css({"width": "10%"});
/*$(".row-fluid .span3").css({"width":"250px"}); doesn't work because scrolling reverts css */
$(".row-fluid .span3").css({"margin-left": "13px"});
/*$(".well").css({"width":"inherit"}); */

/* BIG BUTTONS */
$(".add-tag-link,.prev_page,.next_page").css({"font-size": "14px"});
$(".add-tag-link,.prev_page,.next_page").css({"display": "inline-block"});
$(".add-tag-link,.prev_page,.next_page").css({"margin": "3px 3px"});
$(".add-tag-link,.prev_page,.next_page").css({"padding": "6px 8px"});
$(".add-tag-link,.prev_page,.next_page").css({"cursor": "pointer"});
$(".add-tag-link,.prev_page,.next_page").css({"outline": "none"});
$(".add-tag-link,.prev_page,.next_page").css({"text-align": "center"});
$(".add-tag-link,.prev_page,.next_page").css({"text-decoration": "none"});
$(".add-tag-link,.prev_page,.next_page").css({"text-transform": "capitalize"});
$(".add-tag-link,.prev_page,.next_page").css({"background-color": "#FEFEFE/* platinum */"});
$(".add-tag-link,.prev_page,.next_page").css({"border": "1px solid #ddd"});
$(".add-tag-link,.prev_page,.next_page").css({"border-radius": "4px"});
/*$(".add-tag-link").css({"box-shadow":"0 9px #999"});*/
/*$(".add-tag-link:hover").css({"background-color":"#3e8e41"}); */
$(".add-tag-link:active").css({"background-color": "#3e8e41"});
$(".add-tag-link:active").css({"box-shadow": "0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19)"});
$(".add-tag-link:active").css({"transform": "translateY(4px)"});

/* SEARCH SUBMIT BUTTON */
$("input[type=submit]").css({"-webkit-appearance": "none"});
$('input[type=submit]').hide();

})();
