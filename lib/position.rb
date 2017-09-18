class Position
  FACINGS = %w(EAST NORTH SOUTH WEST)
  attr_reader :table, :x, :y, :facing

  def initialize(table, x, y, facing)
    @table  = table
    @x      = x
    @y      = y
    @facing = facing
  end

  def is_valid?
    table.width >= x && table.height >= y && FACINGS.include?(facing)
  end

  def output
    "#{x},#{y},#{facing}"
  end

  def turn_right
    case facing
    when 'EAST'
      @facing = 'SOUTH'
    when 'NORTH'
      @facing = 'EAST'
    when 'SOUTH'
      @facing = 'WEST'
    when 'WEST'
      @facing = 'NORTH'
    end
  end

  def turn_left
    case facing
    when 'EAST'
      @facing = 'NORTH'
    when 'NORTH'
      @facing = 'WEST'
    when 'SOUTH'
      @facing = 'EAST'
    when 'WEST'
      @facing = 'SOUTH'
    end
  end

  def move
    return unless can_move?
    case facing
    when 'EAST'
      @x += 1
    when 'NORTH'
      @y += 1
    when 'SOUTH'
      @y -= 1
    when 'WEST'
      @x -= 1
    end
  end

  private

  def can_move?
    case facing
    when 'EAST'
      x < table.width
    when 'NORTH'
      y < table.height
    when 'SOUTH'
      y > 0
    when 'WEST'
      x > 0
    end
  end
end
