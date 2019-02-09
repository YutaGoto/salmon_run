namespace :elasticsearch do
  # bin/rails elasticsearch:create_weapon_index
  desc 'to create weapons index'
  task create_weapon_index: :environment do
    Weapon.__elasticsearch__.create_index! force: true
  end

  # bin/rails elasticsearch:import_weapon
  desc 'import of weapons'
  task import_weapon: :environment do
    Weapon.__elasticsearch__.import
  end
end
