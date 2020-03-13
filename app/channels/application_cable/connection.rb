module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_member

    def connect
      self.current_member = find_verified_member
      logger.add_tags "ActionCable", "User #{current_member.id}"
    end
  
    protected

    def find_verified_member
      if current_member = env['warden'].user(:user)
        current_member
      elsif current_member = env['warden'].user(:student)
        current_member
      else
        reject_unauthorized_connection
      end
    end

  end
end
