// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery3
//= require popper
//= require_tree .


$(document).on('change','[class^=select_date]', function() {　
    var select,N,select_1i,select_2i,select_3i
    select = $(this).attr('class');
    N = select.replace(/^select_date_/, '');
    select_1i = String(N) + "_date_1i"
    select_2i = String(N) + "_date_2i"
    select_3i = String(N) + "_date_3i"
    return $.ajax({
      type: 'POST',
      url: '/kibans/index',
      dateType: 'json',
      data: {
        id: N,
        date_1i: $('#' + select_1i).val(), //変数をセレクタに用いる例
        date_2i: $("#" + select_2i).val(),
        date_3i: $("#" + select_3i).val(),
        zero: $("input[class^=zero]:checked").val(),
        finish: $("input[class^=finish]:checked").val(),
        time_change: $(".time_change").val()
      }
    }).done(function(data){
      return $("#new").html(data)
    });
  });
