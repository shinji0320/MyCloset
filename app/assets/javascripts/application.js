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

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function () {
    var API_KEY = "#{ENV['OPEN_WEATHER_MAP_API']}"; // APIキー(環境変数)を変数に代入
    var city = "#{current_user.prefecture}"; // 該当ユーザーの都道府県名を変数に代入
    // APIを読み込み変数に代入
    var url = 'https://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'GET',
      })
      .done(function (data) {
        var insertHTML = '';
        var cityName = data.city.name;
        $('#city-name').html(cityName);
        // デフォルトでは3時間ごとの天気を取得するため、
        // 8の倍数でデータを取得することにより、24時間ごとの天気を取得する
        for (var i = 0; i <= 32; i = i + 8) {
          insertHTML += buildHTML(data, i);
        }
        $('#weather').html(insertHTML);
      })
      .fail(function (data) {
        alert('天気予報取得に失敗しました');
      });
  });
   // 日本語化
  function buildHTML(data, i) {
    var Week = new Array('(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)');
    var date = new Date(data.list[i].dt_txt);
    date.setHours(date.getHours() + 9);
    var month = date.getMonth() + 1;
    var day = month + '/' + date.getDate() + Week[date.getDay()];
    var icon = data.list[i].weather[0].icon;
    var html =
      '<div class="weather-report">' +
        '<img src="https://openweathermap.org/img/w/' + icon + '.png">' +
        '<span class="weather-date">' + day + "</span>" +
        '<div class="weather-temp-max">' + '最高：' + Math.round(data.list[i].main.temp_max) + "℃</div>" +
        '<span class="weather-temp-min">' + '最低：' + Math.floor(data.list[i].main.temp_min) + "℃</span>" +
      '</div>';
    return html
  }