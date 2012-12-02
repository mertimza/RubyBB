class Notification < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :message
  attr_accessible :user_id, :message_id

  after_update :increment_notifications_counter

  def increment_notifications_count
    self.user.increment(:notifications_count)
  end
end
