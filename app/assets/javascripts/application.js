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
    select = $(this).attr('class');//変更された最終注文日のクラスを取得
    N = select.replace(/^select_date_/, '');//そのクラスのkiban.idを抽出
    select_1i = String(N) + "_date_1i"//kiban.idに該当する年のidを作成
    select_2i = String(N) + "_date_2i"//kiban.idに該当する月のidを作成
    select_3i = String(N) + "_date_3i"//kiban.idに該当する日のidを作成
    return $.ajax({
      type: 'POST',
      url: '/kibans/index',//actionのindexを叩く
      dateType: 'json',
      data: {
        id: N,//kiban.id
        date_1i: $('#' + select_1i).val(), //変数をセレクタに用いる例  (kiban.idに新たに書き込む年)
        date_2i: $("#" + select_2i).val(),//(kiban.idに新たに書き込む月)
        date_3i: $("#" + select_3i).val(),//(kiban.idに新たに書き込む日)
        zero: $("input[class^=zero]:checked").val(),//期限なしの基板を含むかのパラメータ
        finish: $("input[class^=finish]:checked").val(),//終了している基板を含むかのパラメータ
        time_change: $(".time_change").val(),//期限のパラメータ
        all: $("input[class^=all]:checked").val()//全表示のパラメータ
      }
    }).done(function(data){
      return $("#new").html(data)//htmlの書き換え
    });
  });
