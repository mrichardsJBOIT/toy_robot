class SquareTableTop
  attr_reader :side_length

  def initialize(side_length = 5)
    @side_length = side_length.to_i
  end

  def check_position_exist(x_ord, y_ord)
    x_ord.to_i <= @side_length && @side_length >= y_ord.to_i && x_ord.to_i >= 0 && y_ord.to_i >= 0 ? true : false
  end

end
