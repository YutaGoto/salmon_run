require 'csv'

namespace :salmon do
  desc 'CSVデータをインポートする'
  # salmon:exec
  task exec: :environment do
    csv_data = CSV.read('lib/tasks/csv/file.csv', headers: false)
    csv_data.each do |data|
      stage = case data[3]
              when 'ダ'
                Stage.find_by(name: 'シェケナダム')
              when '船'
                Stage.find_by(name: '難破船ドン・ブラコ')
              when '集'
                Stage.find_by(name: '海上集落シャケト場')
              when '工'
                Stage.find_by(name: 'トキシラズいぶし工房')
      end

      Event.create!(
        stage_id: stage.id,
        start_at: data[1].to_datetime,
        end_at: data[1].to_datetime + data[2].to_i.hours,
        weapon_ids: [
          Weapon.find_by(name: data[4]).id,
          Weapon.find_by(name: data[5]).id,
          Weapon.find_by(name: data[6]).id,
          Weapon.find_by(name: data[7]).id
        ]
      )
    end
  end
end
