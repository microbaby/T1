javascript:(function(){
  // Alphabetize Names by John K for Tiff & Jen
  // v.1a 2016/04/28
  
  // expand people list
$(".people .icon-open_circle").click();
// sorts people list
var items = $(".people .filters div");
var new_items = _.sortBy(items, function(i) { return $(i).find("a").html();
  });
$(".people .filters").html(new_items);
}());
