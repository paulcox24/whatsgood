$(document).ready(function() {
  $("#feed .page").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: "#feed tr.post"
  });
});