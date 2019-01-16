namespace :elasticsearch do
  desc 'Elasticsearch のindex作成'
  task create_index: :environment do
    Weapon.create_index!
  end

  desc 'Weapon を Elasticsearch に登録'
  task import_weapon: :environment do
    Weapon.import
  end
end
