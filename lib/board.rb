class Board
  attr_reader :cells 
  def initialize
    @cells = {}
  end

  def generate_cells 
    letters = ["A", "B", "C", "D"]
    numbers = [1, 2, 3, 4]

    letters.each do |letter| 
      numbers.each do |number|
        @cells["#{letter}"+"#{number}"] =
        (@cell = Cell.new("#{letter}"+"#{number}"))
      end #numbers
    end #letters
    @cells
  end #generate_cells

def valid_coordinate?(cord)
    @cells.has_key?(cord) 

  def valid_and_no_shot(cord)
    @cells.has_key?(cord) && @cells[cord].misses == 0 && @cells[cord].hit == 0
  end
  
  def verify_and_fire(cord)
    if valid_and_no_shot(cord) 
      @cells[cord].fire_upon
    else
      (@cells[cord].misses += 1)
    end
  end

  def valid_placement?(ship, coordinates)
    coordinate_letters = coordinates.map { |coord| coord[0] }
    coordinate_numbers = coordinates.map { |coord| coord[1] }

    ord = coordinate_letters.map(&:ord)
    num = coordinate_numbers.map(&:to_i)

    (ship.length == 2 && coordinates.length == 2 ||
    ship.length == 3 && coordinates.length == 3) &&
    (((coordinate_letters.uniq.size == 1 &&
    (num.each_cons(2).all? { |x,y| y == x + 1})) ||
    (num.uniq.size == 1 && ord.each_cons(2).all? { |x,y| y == x + 1}))) &&
    (coordinates.all? {|cell| @cells[cell].empty?})
    # binding.pry
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |cord|
        @cells[cord].place_ship(ship)
      end
    end
  end

  def render(show_placements = false)
   a_row = @cells.keys.select{ |keys| keys[0] == "A"}
   b_row = @cells.keys.select{ |keys| keys[0] == "B"}
   c_row = @cells.keys.select{ |keys| keys[0] == "C"}
   d_row = @cells.keys.select{ |keys| keys[0] == "D"}

   puts "                 1 2 3 4"
    if show_placements == false
     puts "              A| #{a_row.map { |key| @cells[key].render}.join(" ")} |"
     puts "              B| #{b_row.map { |key| @cells[key].render}.join(" ")} |"
     puts "              C| #{c_row.map { |key| @cells[key].render}.join(" ")} |"
     puts "              D| #{d_row.map { |key| @cells[key].render}.join(" ")} |"
   elsif show_placements == true
     puts "              A| #{a_row.map { |key| @cells[key].render(true)}.join(" ")} |"
     puts "              B| #{b_row.map { |key| @cells[key].render(true)}.join(" ")} |"
     puts "              C| #{c_row.map { |key| @cells[key].render(true)}.join(" ")} |"
     puts "              D| #{d_row.map { |key| @cells[key].render(true)}.join(" ")} |"
    end
  end
end
