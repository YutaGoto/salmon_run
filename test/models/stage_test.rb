# == Schema Information
#
# Table name: stages
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
