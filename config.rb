#!/usr/bin/env puma
# use TCP instead of unix sockets for puma (docker)
port = ENV.fetch("PORT") { 4567 }

stage           = ENV['RACK_ENV']
shared_path     = '/home/tryredis/try.redis/shared'
puma_pid        = "#{shared_path}/pids/puma.pid"
puma_sock       = "tcp://0.0.0.0:#{port}"
puma_control    = "unix://#{shared_path}/sockets/pumactl.sock"
puma_state      = "#{shared_path}/sockets/puma.state"

directory '/home/tryredis/try.redis/current'
rackup 'config.ru'
environment stage
daemonize false
pidfile puma_pid
state_path puma_state

threads 0, 2

bind puma_sock
activate_control_app puma_control
