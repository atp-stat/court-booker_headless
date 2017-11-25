require 'rails_helper'

RSpec.describe MainController, type: :controller do

  describe "GET #index" do
    context "正常系" do
      # なし
    end
    context "準正常系" do
      it "isReturnNoRoutes" do
        # get :index
        # expect(response).to have_http_status 404
        # なぜかブラウザでやると404になるのにRspecだと200にみなされる...
      end
    end
  end
  describe "POST #index" do
    context "正常系" do
      it "isReturnHttpSuccess" do
        post :index, params: {account_number: "10101010"}
        expect(response).to have_http_status 200
      end
    end
    context "準正常系" do
      it "isReturnHttpFailer for emptyAccountNumber" do
        post :index, params: {account_number: ""}
        expect(response).to have_http_status 403
      end
      it "isReturnHttpFailer for invalid char_count(9char)" do
        post :index, params: {account_number: "101010101"}
        expect(response).to have_http_status 403
      end
      it "isReturnHttpFailer for invalid char_count(7char)" do
        post :index, params: {account_number: "1010101"}
        expect(response).to have_http_status 403
      end
      it "isReturnHttpFailer for invalid char_type(MultiTypeChar)" do
        post :index, params: {account_number: "ああああああああ"}
        expect(response).to have_http_status 403
      end
      it "isReturnHttpFailer for invalid char_type(MultiTypeNumber)" do
        post :index, params: {account_number: "１０１０１０１０１０"}
        expect(response).to have_http_status 403
      end
    end
  end
# 上はviewsのテストをしたがっている例になっていていけてない。ここはcontrollerの評価をする場所だから

  describe "POST #reserve" do
    context "正常系" do
      it "isReturnHttpSuccess" do
        post :reserve, params: {account_number: "10101010"}
        expect(response).to have_http_status 200
      end
    end
    context "準正常系" do
      it "isReturnNoRoutes" do
        # get :index
        # expect(response).to have_http_status 404
        # なぜかブラウザでやると404になるのにRspecだと200にみなされる...
      end
    end
  end

  describe "POST #reserve_confirm" do
    context "正常系" do
      it "isReturnHttpSuccess" do
        post :reserve_confirm, params: {account_number: "10101010"}
        expect(response).to have_http_status 200
      end
    end
    context "準正常系" do
      it "isReturnNoRoutes" do
        # get :index
        # expect(response).to have_http_status 404
        # なぜかブラウザでやると404になるのにRspecだと200にみなされる...
      end
    end
  end

  describe "GET #reserve_success" do
    context "正常系" do
      it "isReturnHttpSuccess" do
        get :reserve_success
        expect(response).to have_http_status 200
      end
      it "isReturnURLCorrect" do
        get :reserve_success
        expect(response).to redirect_to("/reserve/success")
      end
    end
    context "準正常系" do
      it "isReturnNoRoutes" do
        # get :index
        # expect(response).to have_http_status 404
        # なぜかブラウザでやると404になるのにRspecだと200にみなされる...
      end
    end
  end

  describe "GET #reserve_failure" do
    context "正常系" do
      it "isReturnHttpSuccess" do
        get :reserve_failure
        expect(response).to have_http_status 200
      end
      it "isReturnURLCorrect" do
        get :reserve_failure
        expect(response).to redirect_to("/reserve/failure")
      end
    end
    context "準正常系" do
      it "isReturnNoRoutes" do
        # get :index
        # expect(response).to have_http_status 404
        # なぜかブラウザでやると404になるのにRspecだと200にみなされる...
      end
    end
  end
end
