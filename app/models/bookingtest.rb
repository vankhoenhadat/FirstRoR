class Bookingtest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :customer_name, type: String
  field :hotel_name, type: String
  field :night_number, type: Integer
  field :from_date, type: DateTime
  field :to_date, type: DateTime
  field :active, type: Boolean

  default_scope ->{ where(active: true) }

  embeds_many :Room
end
