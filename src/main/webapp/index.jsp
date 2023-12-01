<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <!-- 画面解像度により文字サイズを対応(モバイル対応) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 言語 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
  /* bodyスタイル */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* カレンダーのヘッダースタイル(年月がある部分) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
</style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
</head>

<form action="RegisterServlet" method="GET">
	<button>送信</button>
</form>
  <!-- calendarタグ -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  <script>
  (function(){
    $(function(){
      // calendarエレメント取得
      var calendarEl = $('#calendar')[0];
      // full-calendar生成する。
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendarの高さ設定
        expandRows: true, // 画面に合わせて高さを再設定
        slotMinTime: '08:00', // Dayカレンダーに開始時間
        slotMaxTime: '20:00', // Dayカレンダーに終了時間
        // ヘッダーに表示するツールバー
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 初期ロードする時、見えるカレンダーの画面(基本設定:月)
        initialDate: '2021-07-15', // 初期日付設定(設定しなければ基本的に本日の日付で設定)
        navLinks: true, // 日付を選択するとDayカレンダーやWeekカレンダーにリンク
        editable: true, // 修正可能
        selectable: true, // カレンダーのドラッグ設定可能
        nowIndicator: true, // 現在時間マーク
        dayMaxEvents: true, // イベントの数がオバーすると高さの制限(+のマークと何個式で表現)
        locale: 'ja', // 日本語設定
        eventAdd: function(obj) { // イベントが追加すると発生するイベント
          console.log("add");
          
        },
        eventChange: function(obj) { // イベントが修正されたら発生するイベント
          console.log(obj);
        },
        eventRemove: function(obj){ // イベントが削除すると発生するイベント
          console.log(obj);
        },
        select: function(arg) { // カレンダーでドラックでイベントを生成することが可能。
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title : title,
              start : arg.start,
              end : arg.end,
              allDay: arg.allDay
            })
            $(function(){
                
                // ボタン押下時の処理
                  $.ajax({
                    url: "RegisterServlet",
                    type: "POST",
                    data: {
                        title : title,
                        start : arg.start,
                        end : arg.end,
                        allDay: arg.allDay
                        }
                  
                  }).done(function (result) {
                    // 通信成功時のコールバック
                    $("#text1").val(result);
                  }).fail(function () {
                    // 通信失敗時のコールバック
                    alert("読み込み失敗");
                  }).always(function (result) {
                	  console.log(title);
                    // 常に実行する処理
                  });
                });
                
             
          }
          console.log("select");
          calendar.unselect()
        }
        // イベント
        //events: [
    
        //]
      });
      // カレンダーレンダリング
      calendar.render();
    });
  })();
</script>

</body>
</form>
</html>


Reference: https://www.nowonbun.com/266.html [明月の開発ストーリ]