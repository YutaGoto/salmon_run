class SalmonUpdate
  def event_create(event_info)
    Event.create!(
      stage: Stage.find_by(name: event_info['stage']['name']),
      start_at: Time.zone.parse(event_info['start']),
      end_at: Time.zone.parse(event_info['end']),
      weapon_ids: [
        Weapon.find_by(name: event_info['weapons'][0]['name']).id,
        Weapon.find_by(name: event_info['weapons'][1]['name']).id,
        Weapon.find_by(name: event_info['weapons'][2]['name']).id,
        Weapon.find_by(name: event_info['weapons'][3]['name']).id,
      ]
    )
  end
end

namespace :salmon_update do
  desc 'いい感じにスケジュール更新'
  # salmon_update:exec
  task exec: :environment do
    base_url = 'https://spla2.yuu26.com/coop/schedule'
    base_url_encode = URI.encode(base_url)
    base_uri = URI.parse(base_url_encode)

    https = Net::HTTP.new(base_uri.host, base_uri.port)
    https.use_ssl = true
    res = https.start do
      https.get(base_uri.request_uri)
    end

    if res.present?
      result = JSON.parse(res.body)
      eve_info = result['result'][0]
      event = Event.find_by(start_at: Time.zone.parse(eve_info['start']))
      salmon_update = SalmonUpdate.new
      if event.blank?
        p 'イベントを更新しました。'
        salmon_update.event_create(eve_info)
      end

      eve_info = result['result'][1]
      event = Event.find_by(start_at: Time.zone.parse(eve_info['start']))
      if event.blank?
        p 'イベントを更新しました。'
        salmon_update.event_create(eve_info)
      end
    end
  end
end
