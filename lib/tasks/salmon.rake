require 'csv'

namespace :salmon do
  desc 'CSVデータをインポートする'
  # salmon:exec
  task exec: :environment do
    csv_data = CSV.read('lib/tasks/csv/file.csv', headers: false)
    csv_data.each do |data|
      stage = Stage.find_by(name: data[3])
      Event.create!(
        stage_id: stage.id,
        start_at: Time.zone.parse(data[1]),
        end_at: Time.zone.parse(data[1]) + data[2].to_i.hours,
        weapon_ids: [
          Weapon.find_by(name: data[4]).id,
          Weapon.find_by(name: data[5]).id,
          Weapon.find_by(name: data[6]).id,
          Weapon.find_by(name: data[7]).id,
        ]
      )
    end
  end
end
