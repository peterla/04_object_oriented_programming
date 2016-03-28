# Rover class definition



class Rover
  # x is an integer from 0 to board width - 1
  # y is an integer from 0 to board height - 1
  # orientation is a string with value equal to one of "N", "E", "S", or "W"
  # plateau_width > admittedly, not the most elegant place to store this, should have a plateau object
  # plateau_height > ditto
  attr_accessor :x, :y, :orientation, :plateau_width, :plateau_height

  def initialize(x, y, orientation, plateau_width, plateau_height)
    @x = x
    @y = y
    @orientation = orientation
    @plateau_width = plateau_width
    @plateau_height = plateau_height
  end

  # move method moves the rover 1 block in the direction of it's orientation
  # If the rover is already at the edge of the board, no move is executed, returning nil
  def move
    case orientation
    when "N"
      # Move (0, 1)
      if (y < (plateau_height - 1))
        self.y = y + 1
      end
    when "E"
      # Move (1, 0)
      if (x < (plateau_width - 1))
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

# rover1 = Rover.new(0, 0, "N", 5, 5)
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"
#
# rover1.move
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"
#
# rover1.turn("R")
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"
#
# rover1.move
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"
#
# rover1.turn("L")
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"
#
# rover1.move
# puts "Rover 1 is at (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

# 1. Get input
# Will require string operations to break up strings into components

puts "Enter plateau size:"
input_line1 = gets

puts "Enter Rover 1 coordinates and orientation:"
input_line2 = gets

puts "Enter Rover 1 instructions:"
input_line3 = gets

puts "Enter Rover 2 coordinates and orientation:"
input_line4 = gets

puts "Enter Rover 2 instructions:"
input_line5 = gets

puts "You entered the following information:"
puts input_line1
puts input_line2
puts input_line3
puts input_line4
puts input_line5

# Parse input

# Plateau width and height
plateau_width = 1
plateau_height = 1
input_line1_array = input_line1.split(" ")
if input_line1_array[0] != nil
  plateau_width = input_line1_array[0].to_i
end
if input_line1_array[1] != nil
  plateau_height = input_line1_array[1].to_i
end
puts "Plateau width: #{plateau_width} height: #{plateau_height}"

# Rover 1 position
rover1_x = 0
rover1_y = 0
rover1_orientation = "N"
input_line2_array = input_line2.split(" ")
if input_line1_array[0] != nil
  rover1_x = input_line2_array[0].to_i
end
if input_line2_array[1] != nil
  rover1_y = input_line2_array[1].to_i
end
if input_line2_array[1] != nil
  rover1_orientation = input_line2_array[2]
end
puts "Rover 1 status - x: #{rover1_x} y: #{rover1_y} orientation: #{rover1_orientation}"

# Rover 1 instructions
rover1_instructions = input_line3.split('') # Why does this give me one extra array element at the end?
puts rover1_instructions

# Rover 2 position
rover2_x = 0
rover2_y = 0
rover2_orientation = "N"
input_line4_array = input_line4.split(" ")
if input_line4_array[0] != nil
  rover2_x = input_line4_array[0].to_i
end
if input_line4_array[1] != nil
  rover2_y = input_line4_array[1].to_i
end
if input_line4_array[1] != nil
  rover2_orientation = input_line4_array[2]
end
puts "Rover 2 status - x: #{rover2_x} y: #{rover2_y} orientation: #{rover2_orientation}"

# Rover 2 instructions
rover2_instructions = input_line5.split('') # Why does this give me one extra array element at the end?
puts rover2_instructions

# 2. Do program logic
# Execute moves on the 2 rovers

rover1 = Rover.new(rover1_x, rover1_y, rover1_orientation, plateau_width, plateau_height)
puts "Rover 1 initial status - (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover1_instructions.each do |instruction|
  case instruction
  when "R"
    rover1.turn("R")
  when "L"
    rover1.turn("L")
  when "M"
    rover1.move
  else
    # do nothing
  end
end

puts "Rover 1 final status - (#{rover1.x}, #{rover1.y}) and facing #{rover1.orientation}"

rover2 = Rover.new(rover2_x, rover2_y, rover2_orientation, plateau_width, plateau_height)
puts "Rover 2 initial status - (#{rover2.x}, #{rover2.y}) and facing #{rover2.orientation}"

rover2_instructions.each do |instruction|
  case instruction
  when "R"
    rover2.turn("R")
  when "L"
    rover2.turn("L")
  when "M"
    rover2.move
  else
    # do nothing
  end
end

puts "Rover 2 final status - (#{rover2.x}, #{rover2.y}) and facing #{rover2.orientation}"
