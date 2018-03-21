$(function(){
  onPageLoad('main#reserve', function(){
    console.log("");
    var intervalId = setTimeout(execReserve, 2000);
    function execReserve() {
      var userid = $('#user-id').data("user-id");
      var passwd = $('#user-passwd').data("user-passwd");
      var rsrv_month = $('#rsrv-month').data("rsrv-month");
      var rsrv_day = $('#rsrv-day').data("rsrv-day");
      var rsrv_court_name = $('#rsrv-court-name').data("rsrv-court-name");
      var rsrv_time = $('#rsrv-time').data("rsrv-time");
      $.ajax({
          type: 'GET',
          url: '/main/reserve/exec',
          data: {
            userid: userid,
            passwd: passwd,
            rsrv_month: rsrv_month,
            rsrv_day: rsrv_day,
            rsrv_court_name: rsrv_court_name,
            rsrv_time: rsrv_time
          },
          dataType: 'json'
      });
    }
  })
});
