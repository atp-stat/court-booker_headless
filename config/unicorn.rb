# worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
# timeout 15
# preload_app true
#
# listen '/home/court-booker/court-booker/tmp/unicorn.sock'
# pid    '/home/court-booker/court-booker/tmp/unicorn.pid'
#
# before_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
#     Process.kill 'QUIT', Process.pid
#   end
#
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.connection.disconnect!
# end
#
# after_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
#   end
#
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.establish_connection
# end
#
# stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
# stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
#



rails_root = '/home/court-booker/court-booker' # Railsのルートパス
rails_env = ENV['RAILS_ENV'] || "development"

worker_processes  Integer(ENV["WEB_CONCURRENCY"] || 3)
working_directory rails_root
# Time-out
timeout 300

listen "#{rails_root}/tmp/unicorn.sock"
pid "#{rails_root}/tmp/unicorn.pid"

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

# Path to logs
stderr_path "#{rails_root}/log/#{rails_env}_unicorn_error.log"
stdout_path "#{rails_root}/log/#{rails_env}_unicorn.log"
