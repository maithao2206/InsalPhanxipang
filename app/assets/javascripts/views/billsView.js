function enableEdit() {
  $('.show-data').attr('disabled',false); // remove attr disable of input tag (can use $('.show-data').removeAttr('disabled');)
  $('.show-data-edit').focus(); //set cursor in input-text
}
function disableEdit() {
  $('.show-data').attr('disabled',true);
}
