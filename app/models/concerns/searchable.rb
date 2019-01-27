module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    INDEX_FIELDS = 'name'.freeze

    index_name "es_weapon_#{Rails.env}"

    settings do
      mapping dynamic: 'false' do
        indexes :name, analyzer: 'kuromoji', type: 'string'
      end
    end

    def as_indexed_json(_options = [])
      as_json.select { |k, _| INDEX_FIELDS.include?(k) }
    end
  end

  module ClassMethods
    def create_index!
      client = __elasticsearch__.client
      begin
        client.indices.delete index: index_name
      rescue StandardError
        nil
      end
      client.indices.create(
        index: index_name,
        body: { settings: settings.to_hash, mappings: mappings.to_hash }
      )
    end
  end
end
