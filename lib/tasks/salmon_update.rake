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
      if event.blank?
        Event.create!(
          stage_id: Stage.find_by(name: eve_info['stage']['name']).id,
          start_at: Time.zone.parse(eve_info['start']),
          end_at: Time.zone.parse(eve_info['end']),
          weapon_ids: [
            Weapon.find_by(name: eve_info['weapons'][0]['name']).id,
            Weapon.find_by(name: eve_info['weapons'][1]['name']).id,
            Weapon.find_by(name: eve_info['weapons'][2]['name']).id,
            Weapon.find_by(name: eve_info['weapons'][3]['name']).id,
          ]
        )
      end
    end
  end
end
