# frozen_string_literal: true

namespace :db do
  desc 'Backup remote DB'
  task backup: :environment do
    puts '1. Starting connection to remote server for DB backup'
    Net::SSH.start(remote_ip, 'root') do |ssh|
      date = Time.zone.now.to_date.to_s
      ssh.exec("dokku postgres:export #{remote_db_name} > /tmp/production-#{date}.sql")
    end
    puts 'DB backup on remote server finished'
  end

  desc 'Download backup from remote server'
  task download_backup: :environment do
    puts '2. Starting download of DB dump'
    date = Time.zone.now.to_date.to_s
    `scp root@#{remote_ip}:/tmp/production-#{date}.sql tmp/`
    puts "DB dump downloaded to ./tmp/production-#{date}.sql"
  end

  desc 'Import Downloaded backup to local DB'
  task import_backup: :environment do
    Rake::Task['db:download_backup'].invoke
    puts '3. Starting to import DB dump'
    date = Time.zone.now.to_date.to_s
    puts 'First dropping old DB'
    Rake::Task['db:drop'].invoke
    puts 'Second creating it again'
    Rake::Task['db:create'].invoke
    puts 'Third importing backup'
    `pg_restore -d #{local_db_name} tmp/production-#{date}.sql`
    puts 'Backup import finished :)'
  end

  desc 'Backup, download and import from remote to local DB'
  task backup_and_import: :environment do
    Rake::Task['db:backup'].invoke
    Rake::Task['db:import_backup'].invoke
  end

  def local_db_name
    Rails.application.config.database_configuration[Rails.env]['database']
  end

  def remote_db_name
    Rails.application.secrets.dokku['db_name']
  end

  def remote_ip
    Rails.application.secrets.dokku['ip_address']
  end
end
