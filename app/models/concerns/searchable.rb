module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    index_name [model_name.collection, Rails.env].join('_')
  end
end
