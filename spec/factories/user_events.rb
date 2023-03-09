FactoryBot.define do
    factory :user_event do
      user
      event
      state { "No responde" }
    end
  end