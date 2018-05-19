# == Schema Information
#
# Table name: events_weapons
#
#  id         :bigint(8)        not null, primary key
#  event_id   :integer
#  weapon_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EventsWeaponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
