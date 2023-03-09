class Event < ApplicationRecord
  has_rich_text :description
  has_many :user_events
  has_many :users, through: :user_events

  validate :date_cannot_be_in_the_past
  validates :name, presence: { message: "El campo nombre es requerido." }
  validates :date, presence: { message: "El campo fecha es requerido." }

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date_past, "La fecha es incorrecta.")
    end
  end  
end
