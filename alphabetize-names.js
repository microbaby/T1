javascript:(function(){
  // alphabetize names
  // expand people list
$(".people .icon-open_circle").click();
// sorts people list
var items = $(".people .filters div");
var new_items = _.sortBy(items, function(i) { return $(i).find("a").html();
  });
$(".people .filters").html(new_items);
}());
