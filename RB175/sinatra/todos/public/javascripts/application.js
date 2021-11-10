$(function() { 
  $('form.delete').submit(function(event) {
    event.preventDefault();
    event.stopPropagation();

    var ok = confirm('Remove task? This cannot be undone.')
    if (ok) {
      this.submit();
    }
  });
});
