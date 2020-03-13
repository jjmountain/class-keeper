class LessonChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "lesson_channel"
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd "online", current_member.id
    stream_from "lesson:users"
    broadcast_to "users", { id: current_member.id, status: "online" }
  end

  def unsubscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem "online", current_member.id

    broadcast_to "users", { id: current_member.id, status: "offline" }

  end
end
