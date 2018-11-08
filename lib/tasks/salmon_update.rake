class SalmonUpdate
  def event_create(event_info)
    Event.create!(
      stage: Stage.find_by(name: event_info['stage']['name']),
      start_at: Time.zone.parse(event_info['start']),
      end_at: Time.zone.parse(event_info['end']),
      weapon_ids: Weapon.where(name: event_info['weapons'].map { |weapon| weapon['name'] }).ids
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
        salmon_update.event_create(eve_info)
        p 'イベントを更新しました。'
      end

      eve_info = result['result'][1]
      event = Event.find_by(start_at: Time.zone.parse(eve_info['start']))
      if event.blank?
        salmon_update.event_create(eve_info)
        p 'イベントを更新しました。'
      end
    end
  end
end
