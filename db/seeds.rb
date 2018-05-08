# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weapon.seed(:id,
  {id: 1, name: 'ランダム' , short_name: 'ランダム'},
  {id: 2, name: 'クマサン印のブラスター' , short_name: 'クマブラ'},
  {id: 3, name: 'クマサン印のシェルター' , short_name: 'クマシェル'},
  {id: 11, name: 'わかばシューター' , short_name: 'わかば'},
  {id: 12, name: 'スプラマニューバー' , short_name: 'スプラマニューバー'},
  {id: 13, name: 'スプラローラー' , short_name: 'スプラローラー'},
  {id: 14, name: 'スプラチャージャー' , short_name: 'スプラチャージャー'},
  {id: 15, name: 'スプラシューター' , short_name: 'スシ'},
  {id: 16, name: 'ホットブラスター' , short_name: 'ホッブラ'},
  {id: 17, name: 'バケットスロッシャー' , short_name: 'バケツ'},
  {id: 18, name: 'ジェットスイーパー' , short_name: 'ジェッスイ'},
  {id: 19, name: 'バレルスピナー' , short_name: 'バレスピ'},
  {id: 20, name: 'ホクサイ' , short_name: 'ホクサイ'},
  {id: 21, name: 'カーボンローラー' , short_name: 'カーボン'},
  {id: 22, name: 'ヒッセン' , short_name: 'ヒッセン'},
  {id: 23, name: 'シャープマーカー' , short_name: 'シャープマーカー'},
)

Stage.seed(:id,
  {id: 1, name: 'シェケナダム', short_name: 'シェケナダム'},
  {id: 2, name: '難破船ドン・ブラコ', short_name: 'ドンブラコ'},
  {id: 3, name: '海上集落シャケト場', short_name: 'シャケトバ'},
  {id: 4, name: 'トキシラズいぶし工房', short_name: 'トキシラズ'},
)

Event.destroy_all
Event.create([
  {start_at: Time.zone.parse('2017-07-21 15:00:00') , end_at: Time.zone.parse('2017-07-22 13:00:00'), stage_id: 1, weapon_ids: [11,12,13,14]},
  {start_at: Time.zone.parse('2017-07-22 15:00:00') , end_at: Time.zone.parse('2017-07-23 13:00:00'), stage_id: 2, weapon_ids: [15,16,17,18]},
  {start_at: Time.zone.parse('2017-07-23 15:00:00') , end_at: Time.zone.parse('2017-07-24 15:00:00'), stage_id: 1, weapon_ids: [19,20,13,12]},
  {start_at: Time.zone.parse('2017-07-25 21:00:00') , end_at: Time.zone.parse('2017-07-26 21:00:00'), stage_id: 2, weapon_ids: [21,22,13,23]},
])
