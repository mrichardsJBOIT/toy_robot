class Robot

  attr_reader :location, :table, :facing

  def initialize(table = nil, x_ord = nil, y_ord = nil, facing = nil)
    @table = table
    @location = [x_ord, y_ord]
    @facing = facing
    @placed = false
  end

  def warning
    'DANGER WILL ROBINSON'
  end

  def report
    puts "Output: #{@location[0]}, #{@location[1]}, #{@facing}"
  end

  def place(args = {})
    return unless @table.check_position_exist(args[:x_ord], args[:y_ord])

    @placed = true
    @location[0] = args[:x_ord]
    @location[1] = args[:y_ord]
    @facing = args[:facing]
  end

  def do(command)
    command_symbol = command.command.downcase.to_sym
    if @placed || command_symbol == :place
      if command.args
        send(command_symbol, command.args)
      else
        send(command_symbol)
      end
    end
  end

  def directions
    %w[NORTH EAST SOUTH WEST]
  end

  def move
    new_location = [@location[0], @location[1]]
    new_location[1] = @location[1].to_i + 1 if @facing == 'NORTH'
    new_location[1] = @location[1].to_i - 1 if @facing == 'SOUTH'
    new_location[0] = @location[0].to_i + 1 if @facing == 'EAST'
    new_location[0] = @location[0].to_i - 1 if @facing == 'WEST'

    if @table.check_position_exist(new_location[0], new_location[1])
      @location[0] = new_location[0]
      @location[1] = new_location[1]
    end
  end

  def left
    currently_facing_index = directions.index(@facing)
    next_facing_index = (currently_facing_index == 0 ? 3 : currently_facing_index - 1)
    @facing = directions[next_facing_index]
  end

  def right
    currently_facing_index = directions.index(@facing)
    next_facing_index = (currently_facing_index == 3 ? 0 : currently_facing_index + 1)
    @facing = directions[next_facing_index]
  end

end
