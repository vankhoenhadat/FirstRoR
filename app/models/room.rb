class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :descriptions, type: String
  field :minrate, type: Float
  field :active, type: Boolean

  embedded_in :Booking
end
