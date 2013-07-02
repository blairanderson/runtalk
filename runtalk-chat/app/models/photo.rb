require 'ostruct'

class Photo < OpenStruct

  def to_h
    @table.dup
  end
  
end
