//$(document).ready(function() {
//  alert('Страница загружена');
//});

//$(document).ready(function() {
//  $('.find').click(function() {
//    alert('нажатие кнопки произошло')
//  })
//});

$(document).ready(function() {
  $('.search_form').submit(function(){  
    var end_station;
    var start_station;
    
    start_station = $(this).find('#start_station_id');
    end_station = $(this).find('#end_station_id');

    if (start_station.val() == end_station.val()) {
      alert('message similar stationname')
      return false;
    };
  });
});
