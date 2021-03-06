
class Cell

attr_reader :coordinate, :ship, :misses, :hit

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @misses = 0
    @hit = 0
  end

  def empty?
    @ship == nil
  end

  def place_ship(type)
    @ship = type
  end

  def fire_upon
    if empty?
      @misses += 1
    elsif @ship != nil
      @ship.hit
      @hit += 1
    end
  end

  def fired_upon?
    if !empty? && (@hit > 0)
      true
    elsif @misses == 0
      false
    elsif @misses > 0
      true
    end
  end

  def render(show_placements = false)
    if show_placements == false
      if fired_upon? == false
         "."
      elsif fired_upon? == true && empty?
         "M"
      elsif fired_upon? == true && @ship.sunk? == true
         "X"
      elsif fired_upon? == true && @ship.sunk? == false
         "H"
      end
    else show_placements == true
      if empty? == false && fired_upon? == false #place_shape = true
        "S"
      elsif fired_upon? == false
        "." #misses == 0
      elsif fired_upon? == true && empty?
        "M" #misses>0 || (not empty && hit > 0)
      elsif fired_upon? == true && @ship.sunk? == true
        "X" #misses = 0 && @health == 0
      elsif fired_upon? == true && @ship.sunk? == false
        "H" #misses == 0 && health > 0
      end#nested if
    end
  end#def render
end#class
