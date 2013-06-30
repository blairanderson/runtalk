require 'ostruct'

class PhotoProxy < OpenStruct

  def to_h
    @table.dup
  end
  
end
