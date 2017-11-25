require 'rails_helper'

RSpec.describe TopController, type: :controller do

  describe "GET #login" do
    context "正常系" do
      it "isReturnsHttpSuccess" do
        get :login
        expect(response).to have_http_status(:success)
      end
    end
  end

end
