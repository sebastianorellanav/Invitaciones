require 'rails_helper'

RSpec.describe Event, type: :model do
  context "when creating an event" do
    it "creates an event with name, date, and description" do
      event = Event.create(name: "Example Event", date: Date.today, description: "This is an example event.")
      expect(event).to be_valid
    end

    it "fails to create an event without name" do
      event = Event.create(date: Date.today, description: "This event has no name.")
      expect(event).to_not be_valid
    end

    it "fails to create an event without date" do
      event = Event.create(name: "Example Event", description: "This event has no date.")
      expect(event).to_not be_valid
    end

    it "fails to create an event without description" do
      event = Event.create(name: "Example Event", date: Date.today)
      expect(event).to_not be_valid
    end
  end
end
