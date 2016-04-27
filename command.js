javascript:(function() {
var press = jQuery.Event("keypress");
press.which = 93;
$("whatever").trigger(press);
}());
