
#set :keep_releases, 3

#set :rbenv_type, :user # or :system, depends on your rbenv setup
#set :rbenv_ruby, '2.6.0'

#set :rbenv_map_bins, %w{rake gem bundle ruby rails}
#set :rbenv_roles, :all # default value

#set :linked_dirs, %w{log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
#set :linked_files, %w{config/credentials.yml.enc}

lock "3.11.0"

set :repo_url, "https://github.com/MasamiOno/ppaphotel" #自分のリポジトリURLに変更

# base
set :application, 'ppaphotel' #自分のapp_nameに変更
set :branch, 'main'
set :user, 'ec2-user'
set :deploy_to, '/opt/ppaphotel'

#set :rbenv_path, '/opt/rbenv'
#set :bundle_path, './vendor/bundle'
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"

#set :bundle_path, '/home/linuxbrew/.linuxbrew/bin//bundle'
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_ruby, '2.6.0'
set :pty,             false
set :use_sudo,        true
set :stage,           :production
set :deploy_via,      :remote_cache
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
                                               'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/credentials.yml.enc', 'config/master.key')


# puma
set :puma_threads, [4, 16]
set :puma_workers, 0
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true

# sidekiq
#set :sidekiq_config, "#{current_path}/config/sidekiq.yml"

namespace :puma do
    desc 'Create Directories for Puma Pids and Socket'
    task :make_dirs do
        on roles(:app) do
            execute "mkdir #{shared_path}/tmp/sockets -p"
            execute "mkdir #{shared_path}/tmp/pids -p"
        end
    end
    
    before :start, :make_dirs
end

namespace :redis do
    %w[start stop restart].each do |command|
        desc "#{command} redis"
        task command do
            on roles(:app) do
                sudo "service redis #{command}"
            end
        end
    end
end

namespace :deploy do
    desc 'Make sure local git is in sync with remote.'
    task :check_revision do
        on roles(:app) do
            #unless 'git rev-parse HEAD' == 'git rev-parse origin/master'
            #puts 'WARNING: HEAD is not the same as origin/master'
            #puts 'Run `git push` to sync changes.'
            #exit
            #end
        end
    end
    
    desc 'upload important files'
    task :upload do
        on roles(:app) do
            sudo :mkdir, '-p', "#{shared_path}/config"
            sudo %(chown -R #{fetch(:user)}.#{fetch(:user)} /opt/#{fetch(:application)})
            sudo :mkdir, '-p', '/etc/nginx/sites-enabled'
            sudo :mkdir, '-p', '/etc/nginx/sites-available'
            
            upload!('config/database.yml', "#{shared_path}/config/database.yml")
            upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
            upload!('config/master.key', "#{shared_path}/config/master.key")
        end
    end
    
    #desc 'Restart application'
    #task :restart do
    #on roles(:app), in: :sequence, wait: 5 do
    #Rake::Task["puma:restart"].reenable
    #invoke 'puma:restart'
    #end
    #end
    
    before :starting, :upload
    #before 'check:linked_files', 'puma:nginx_config'
    before :starting, :check_revision
end

after 'deploy:published', 'nginx:restart'

