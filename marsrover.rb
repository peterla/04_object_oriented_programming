# Rover class definition

class Rover
  # x is an integer from 0 to board width - 1
  # y is an integer from 0 to board height - 1
  # orientation is a string with value equal to one of "N", "E", "S", or "W"
  # grid_width
  # grid_height
  attr_accessor :x, :y, :orientation, :grid_width, :grid_height

  def initialize(x, y, orientation, grid_width, grid_height)
    @x = x
    @y = y
    @orientation = orientation
    @grid_width = grid_width
    @grid_height = grid_height
  end

  # move method moves the rover 1 block in the direction of it's orientation
  # If the rover is already at the edge of the board, no move is executed, returning nil
  def move
    case orientation
    when "N"
      # Move (0, 1)
      if (y < (grid_height - 1))
        self.y = y + 1
      end
    when "E"
      # Move (1, 0)
      if (x < (grid_width - 1))
        self.x = x + 1
      end
    when "S"
      # Move (0, -1)
      if (y > 0)
        self.y = y - 1
      end
    when "W"
      # Move (-1, 0)
      if (x > 0)
        self.x = x - 1
      end
    else
      nil
    end
  end

  # turn method takes a string with value "R" for right or "L" for left
  # If neither string is passed in to method, no turn is executed
  def turn(left_or_right)
    if (left_or_right == "R")
      # Turn right
      case orientation
      when "N"
        self.orientation = "E"
      when "E"
        self.orientation = "S"
      when "S"
        self.orientation = "W"
      else # "W"
        self.orientation = "N"
      end
    elsif (left_or_right == "L")
      # Turn left
      case orientation
      when "N"
        self.orientation = "W"
      when "E"
        self.orientation = "N"
      when "S"
        self.orientation = "E"
      else # "W"
        self.orientation = "S"
      end
    else
      nil # Do nothing, invalid argument
    end
  end

end

# Main program

rover1 = Rover.new(0, 0, "N", 5, 5)
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1.move
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1.turn("R")
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1.move
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1.turn("L")
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1.move
puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

# 1. Get input
# Will require string operations to break up strings into components

# 2. Do program logic
# Execute moves on the 2 rovers

# 3. Output results
