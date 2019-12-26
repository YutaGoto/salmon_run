# typed: strict
class SalmonRunSchema < GraphQL::Schema
  query(Types::QueryType)
  use GraphQL::Batch
end
