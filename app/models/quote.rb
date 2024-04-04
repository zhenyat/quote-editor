class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # 1) after_create_commit callback to instruct the App that the expression in the
  #    lambda should be executed every time a new quote is inserted into the database
  # 2) The second part of the expression in the lambda instructs the App
  #    that the HTML of the created quote should be broadcasted to users
  #    subscribed to the "quotes" stream and prepended to the DOM node with the id of "quotes".

  # Full code:
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # Shorter code:
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }
  # the best
  # after_create_commit -> { broadcast_prepend_to "quotes" }
  # after_update_commit -> { broadcast_prepend_to "quotes" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }

  # Broadcasting aynchronous with ActiveCable
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }

  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
