$(document).ready(function() {   
  $('select').change(function() {
    var tip = $(this).val();
    var up_p = $('.up_p').show();
    var down_p = $('.field.down_p').show();
    var up_side_p = $('.field.up_side_p').show();
    var down_side_p = $('.field.down_side_p').show();
    var seat_p = $('.field.seat_p').show();

    if (tip === "SeatWagon") {
      up_p.hide();
      down_p.hide();
      up_side_p.hide();
      down_side_p.hide();
    } else if (tip === "PlatscartWagon") {
      seat_p.hide();
    } else if (tip === "SvWagon") {
      seat_p.hide();
      down_side_p.hide();
      up_side_p.hide();
      up_p.hide();
    } else if (tip === "CoupeWagon") {
      down_side_p.hide();
      seat_p.hide();
      up_side_p.hide();
    } 
  });
  var seat_p = $('.field.seat_p').hide();
});
