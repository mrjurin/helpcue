require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "toggle status from waiting to being-helped" do
    requests(:one).toggle_status.save

    assert_equal Request::STATUS_OPTIONS[1], requests(:one).reload.status
  end

  test "toggle status from being-helped to waiting" do
    requests(:two).toggle_status.save

    assert_equal Request::STATUS_OPTIONS[0], requests(:two).reload.status
  end

  test "adds current time when changing status to being-helped" do
    Timecop.freeze
    requests(:one).toggle_status.save
    assert_equal Time.zone.now.to_s, requests(:one).reload.helped_at.to_s
  end

  test "adds current time when changing status to done" do
    Timecop.freeze
    requests(:one).remove_from_queue.save

    assert_equal Time.zone.now.to_s, requests(:one).reload.done_at.to_s
  end

  test "time waiting" do
    request = Request.create
    Timecop.freeze(Time.zone.now + 30.minutes) do
      request.toggle_status.save
      assert_equal 30.minutes, request.time_waiting
    end
  end

  test "help duration" do
    request = Request.create
    request.toggle_status.save

    Timecop.freeze(Time.zone.now + 40.minutes) do
      request.remove_from_queue.save
      assert_equal 40.minutes, request.help_duration
    end
  end
end
