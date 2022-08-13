# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    alice = users(:alice)
    bob = users(:bob)
    day_one = reports(:day_one)

    assert day_one.editable?(alice)
    assert_not day_one.editable?(bob)
  end

  test 'created_on' do
    day_one = reports(:day_one)

    assert_not_equal Time.zone.today, day_one.created_at
    assert_equal Time.zone.today, day_one.created_on
  end
end
