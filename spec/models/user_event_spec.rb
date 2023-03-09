require 'rails_helper'

RSpec.describe UserEventsController, type: :controller do
  describe "#change_state" do
    context "when UserEvent exists and state can be changed" do
      let(:user) { create(:user) }
      let(:event) { create(:event) }
      let(:user_event) { create(:user_event, user: user, event: event, state: "No responde") }

      it "changes the state of the user_event" do
        post :change_state, params: { id: user_event.id, new_state: "Asiste" }
        user_event.reload
        expect(user_event.state).to eq("Asiste")
      end
    end

    context "when UserEvent does not exist" do
      it "returns a 404 error" do
        post :change_state, params: { id: 999, new_state: "Asiste" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when UserEvent state cannot be changed" do
      let(:user) { create(:user) }
      let(:event) { create(:event) }
      let(:user_event) { create(:user_event, user: user, event: event, state: "Asiste") }

      it "returns a 422 error" do
        post :change_state, params: { id: user_event.id, new_state: "No Asiste" }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end