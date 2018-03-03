$(document).ready(function() {   
    $('a.edit_route').click(function(e) {
      e.preventDefault();

      var route_id;
      var form;
      var title;

      route_id = $(this).data('routeId');
      form = $('#edit_route_' + route_id);
      title = $('#route_title_' + route_id);

      if (!$(this).hasClass('cancel')){
        $(this).html('Отмена ред.')
        $(this).addClass('cancel')
      } else {
        $(this).html('Редактировать');
        $(this).removeClass('cancel');  
      }
      form.slideToggle();
      title.slideToggle();
    
  });
});
