lock '3.4.0'

set :application, 'h3t_site'
set :pty, true

role :app, %w{www@188.166.36.9}
role :web, %w{www@188.166.36.9}
role :db,  %w{www@188.166.36.9}

set :repo_url, 'git@github.com:h3tcz/h3t_site.git'

set :use_sudo, true
set :passenger_restart_with_sudo, true

set :keep_releases, 3

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # nothing here
    end
  end
end
