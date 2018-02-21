$(document).ready(function() { 
//  $(document).on('turbolinks:load', function() {

    $('a.edit_station').click(function(e) {
      e.preventDefault();
  console.log("It works on each visit!")

      var station_id;
      var form;
      var title;

      station_id = $(this).data('stationId');
      form = $('#edit_railway_station_' + station_id);
      title = $('#railway_station_title_' + station_id);

      if (!$(this).hasClass('cancel')){
        //form.show();  //потереть и ..
        //title.hide(); //потереть и ..

        $(this).html('Отмена ред.')
        $(this).addClass('cancel')
      } else {
        //form.hide();  // потереть и ..
        //title.show();  // потереть и ..

        $(this).html('Редактировать');
        $(this).removeClass('cancel');  
      }
      // и написть тут код что ниже:
      form.slideToggle();
      title.slideToggle();  
    });
  });  
//});
