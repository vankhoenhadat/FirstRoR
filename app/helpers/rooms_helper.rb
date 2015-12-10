module RoomsHelper
end
class RoomValidator
  include Veto.validator

  validates :name, :presence => {:message => "Tên phòng không để trống"}
  validates :minrate, :inclusion => 0..100
end
