# Court Booker
テニスコート自動予約ツール
コンフィグ（config.rb）の内容をもとに指定したコートを予約

## How to
`$ bundle exec ruby main.rb`

## Config
- @userid : スポーツ施設利用者カード登録番号
- @passwd : パスワード
- @rsrv_year : 予約を希望する年
- @rsrv_month : 予約を希望する月
- @rsrv_day : 予約を希望する日
- @rsrv_court_name : 予約を希望するコート. 配列形式で, 希望する優先度が高い方から順に記載
- @rsrv_time : 予約を希望する時間. 配列形式で, 希望する優先度が高い方から順に記載

## Issues
- コート+時間検索の繰り返し処理が一定時間経過後 Net::ReadTimeout となってしまったときの処理が必要
- 公園が複数指定されている場合、ページをまたぐ公園が指定されていた場合はエラーとなってしまう
- 予約を希望する年,月が現在日付と異なるとエラーとなっていしまう
```
driver.find_element(:id, 'purposeSearch').click
# Today's Month を取得、引数(月)と一致しているか判定
  # today_date = Time.now
  # today_year = today_date.year
  # today_month = today_date.month
# 一致していたらカレンダーから引数(日)の日をクリック
calender_days = driver.find_elements(:class, 'calclick')
i = 0
calender_days.each do |day|
  calender_days[i] = day.text
  i+=1
end
rsrv_day = calender_days.index(@rsrv_day)
driver.find_elements(:class, 'calclick')[rsrv_day].click
# 一致していなかったら"次月"をクリックしてからカレンダーから引数(日)の日をクリック
```


## UseCase
1. /top/login から登録番号を入力して /main/index へ
1. /main/index でコートブッカーを使った予約状況を閲覧
1. /main/index から予約条件を入力してから予約ボタンを押して /main/reserve/confirm へ
1. /main/reserve/confirm から予約条件を確認し、検索実行ボタンを押して /main/reserve でタスクを実行
1. タスク実行中は /main/reserve で /reserve/doing をポーリング（jsコンソールで進捗は確認可能）
1. タスク実行中は /main/reserve の 中止ボタン で起動中のタスクをkillして /main/reserve へ戻ることができる
  1. 成功したら /main/reserve/success 画面へ
  1. エラーが出たら /main/reserve/failure 画面へ
1. /main/reserve/success or failure で結果を確認したら 戻るボタン で /main/index へ
