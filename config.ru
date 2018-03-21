# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
run Rails.application

# # 下記、サブディレクトリ運用時の設定
# # This file is used by Rack-based servers to start the application.
# RAILS_RELATIVE_URL_ROOT = "/court-booker"
# require ::File.expand_path('../config/environment',  __FILE__)
# if RAILS_RELATIVE_URL_ROOT
#   map RAILS_RELATIVE_URL_ROOT do
#     run Rails.application
#   end
# else
#   run Rails.application
# end

# require ::File.expand_path('../../config/environment',  __FILE__)
# Rails.application.eager_load!
#
# run ActionCable.server
