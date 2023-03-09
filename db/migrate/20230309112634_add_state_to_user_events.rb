class AddStateToUserEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :user_events, :state, :string
  end
end
