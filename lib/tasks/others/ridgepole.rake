namespace :ridgepole do
  class RidgepoleCommand
    def self.command
      'bundle exec ridgepole -c config/database.yml --apply -f schemas/Schemafile'
    end
  end

  task apply: :environment do
    sh RidgepoleCommand.command do
      Rake::Task['db:schema:dump'].invoke
    end
  end
end

task 'db:migrate' => :environment do
  Rake::Task['ridgepole:apply'].invoke
end

task 'db:migrate:reset' => :environment do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['ridgepole:apply'].invoke
end

task 'db:migrate:reset_and_seed' => :environment do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['ridgepole:apply'].invoke
  Rake::Task['db:seed'].invoke
end
