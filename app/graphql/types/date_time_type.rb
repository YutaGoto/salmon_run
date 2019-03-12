Types::DateTimeType = GraphQL::ScalarType.define do
  name 'DateTimeType'

  coerce_input ->(value, _context) { Time.zone.parse value }
  coerce_result ->(value, _context) { I18n.l(value, format: :default) }
end
