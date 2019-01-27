namespace :elasticsearch do
  desc 'to create weapons index'
  task create_weapon_index: :environment do
    Weapon.create_index!
  end

  desc 'import of weapons'
  task import_weapon: :environment do
    Weapon.import
  end
end
