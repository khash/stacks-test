worker_processes 2

working_directory "#{ENV['RAILS_STACK_PATH']}"

listen "/tmp/web_server.sock", :backlog => 64
listen 8081, :tcp_nopush => true

timeout 30

pid File.join(ENV['RAILS_STACK_PATH'], 'tmp', 'pids', 'web_server.pid')

stderr_path "#{ENV['RAILS_STACK_PATH']}/log/unicorn.stderr.log"
stdout_path "#{ENV['RAILS_STACK_PATH']}/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
