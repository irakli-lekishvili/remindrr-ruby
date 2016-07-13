module Remindrr
  class Reminder
    extend Request

    def initialize(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(app)
      reminders = get("v1/apps/#{app.id}/reminders")
      reminders.map { |reminder| new reminder }
    end

    def self.find(app, id)
      reminder = get("/v1/apps/#{app.id}/reminders/id")
      new reminder
    end
  end
end
