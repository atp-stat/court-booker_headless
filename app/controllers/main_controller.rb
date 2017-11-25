class MainController < ApplicationController
  include CourtBook

  def index
    @account_number = params[:account_number]
    @court_names = set_court_names
    @rsrv_times = set_rsrv_times
  end

  def reserve
    @debug = params
    @userid = params[:userid]
    @passwd = params[:passwd]
    @rsrv_month = params[:rsrv_month]
    @rsrv_day = params[:rsrv_day]
    @rsrv_court_name = params[:rsrv_court_name]
    @rsrv_time = params[:rsrv_time]
    @court_book_result = court_book(@userid, @passwd, @rsrv_month, @rsrv_day, @rsrv_court_name, @rsrv_time)
  end

  def reserve_confirm
    @userid = params[:userid]
    @passwd = params[:passwd]
    @rsrv_month = params[:rsrv_month]
    @rsrv_day = params[:rsrv_day]
    @rsrv_court_name = params[:rsrv_court_name]
    @rsrv_time = params[:rsrv_time]
  end

  def reserve_seccess
    @account_number = params[:account_number]
  end

  def reserve_failure
    @account_number = params[:account_number]
  end

  private

  def set_court_names
    court_names = [
      "日比谷公園",\
      "芝公園",\
      "猿江恩賜公園",\
      "亀戸中央公園",\
      "木場公園",\
      "祖師谷公園"\
      "東白鬚公園",\
      "浮間公園",\
      "城北中央公園Ａ",\
      "城北中央公園Ｂ",\
      "赤塚公園",\
      "東綾瀬公園",\
      "舎人公園",\
      "篠崎公園Ａ",\
      "大島小松川公園Ａ",\
      "汐入公園",\
      "善福寺川緑地",\
      "光が丘公園",\
      "石神井公園Ｂ",\
      "井の頭恩賜公園",\
      "武蔵野中央公園",\
      "小金井公園",\
      "野川公園",\
      "府中の森公園",\
      "東大和南公園",\
      "大井ふ頭海浜公園Ａ（ハード）",\
      "大井ふ頭海浜公園Ａ（人工芝）",\
      "大井ふ頭海浜公園B（ハード）",\
      "有明テニスの森公園Ａ（ハード）",\
      "有明テニスの森公園Ｂ（ハード）",\
      "有明テニスの森公園Ｃ／テニス（人工芝）"
    ]
    return court_names
  end

  def set_rsrv_times
    rsrv_times = [
      "9:00",\
      "11:00",\
      "13:00",\
      "15:00",\
      "17:00",\
      "19:00"
    ]
    return rsrv_times
  end
end
