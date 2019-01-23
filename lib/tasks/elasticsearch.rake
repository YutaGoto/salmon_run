namespace :elasticsearch do
  desc 'Weaponのindex作成'
  task create_weapon_index: :environment do
    Weapon.create_index!
  end

  desc 'Weapon を Elasticsearch に登録'
  task import_weapon: :environment do
    Weapon.import
  end

  # desc 'Stageのindex作成'
  # task create_stage_index: :environment do
  #   Stage.create_index!
  # end

  # desc 'StageをElasticsearch に登録'
  # task import_stage: :environment do
  #   Stage.import
  # end
end
