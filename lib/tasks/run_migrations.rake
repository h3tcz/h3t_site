# frozen_string_literal: true
# lib/tasks/run_migrations.rake
Rake::Task['assets:clean'].enhance do
  Rake::Task['db:migrate'].invoke
end
