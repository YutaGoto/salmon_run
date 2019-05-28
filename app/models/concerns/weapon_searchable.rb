module WeaponSearchable
  extend ActiveSupport::Concern

  included do
    include Searchable

    settings index: Rails.application.config.weapon_index_analysis['weapon_index_analysis']

    mappings dynamic: 'false' do
      indexes "name", "analyzer": "kuromoji_analyzer"
    end

    def as_indexed_json(_options = {})
      attributes.symbolize_keys.slice(:name)
    end
  end
end
