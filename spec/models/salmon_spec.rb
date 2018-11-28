# == Schema Information
#
# Table name: salmons
#
#  id          :bigint(8)        not null, primary key
#  salmon_type :integer          not null
#  name        :string           not null
#  image_url   :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Salmon, type: :model do
end
