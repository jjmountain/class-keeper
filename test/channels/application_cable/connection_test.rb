require 'test_helper'

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with devise" do
    user = users(:one)
    connect_with_user(user)
    assert_equal connection.current_user, user
  end

  test "unauthorized without devise" do
    assert_raises ActionCable::Connection::Authorization::UnauthorizedError do
      connect env: { 'warden' => FakeEnv.new(nil) }
    end
  end

  private

  def connect_with_user(user)
    connect env: { 'warden' => FakeEnv.new(user) }
    
  end

  class FakeEnv
    attr_reader :user

    def initialize(user)
      @user = user
    end
  end
end