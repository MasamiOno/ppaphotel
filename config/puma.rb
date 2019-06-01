# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#

#追加部分

#rails_root = File.expand_path('../../', __FILE__)
#rails_env = ENV['RAILS_ENV'] || "development"

#worker_processes 2
#working_directory rails_root

listen "#{rails_root}/tmp/#{rails_env}_puma.sock"
listen 3000
pid "#{rails_root}/tmp/#{rails_env}_puma.pid"

stderr_path "#{rails_root}/log/#{rails_env}_puma_error.log"
stdout_path "#{rails_root}/log/#{rails_env}_puma.log"

environment 'production'
port 3000
daemonize true
state_path 'tmp/pids/puma.state'
pidfile 'tmp/pids/puma.pid'
threads 0,16
workers 2

#追加部分終わり


threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#


#port        ENV.fetch("PORT") { 3000 }


# Specifies the `environment` that Puma will run in.
#
#environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
