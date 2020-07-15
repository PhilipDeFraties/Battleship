require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'mocha/minitest'
require 'pry'

class GameTest < Minitest::Test


  def setup
    @game = Game.new
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_main_menu
    @game.stubs(:get_user_input).returns("p")

    assert_equal [], @game.main_menu
  end

  def test_cpu_place_cruiser
    refute nil, @game.cpu_place_cruiser
    refute nil, @game.cpu_place_sub
    binding.pry
    p @game.cpu_board.render
  end

  # def test_cpu_place_cruiser
  #   @game.board.place(@cpu_cruiser, ["A1", "A2", "A3"])
  #   @game.cpu_place_sub
  # end



  def test_cpu_fire
    #skip
    @game.board.verify_and_fire("A1")
    @game.board.verify_and_fire("A2")
    @game.board.verify_and_fire("A3")
    @game.board.verify_and_fire("A4")
    @game.board.verify_and_fire("B1")
    @game.board.verify_and_fire("B2")
    @game.board.verify_and_fire("B3")
    @game.board.verify_and_fire("B4")
    @game.board.verify_and_fire("C1")
    @game.board.verify_and_fire("C2")
    @game.board.verify_and_fire("C3")
    @game.board.verify_and_fire("C4")
    @game.board.verify_and_fire("D1")
    @game.board.verify_and_fire("D2")
    @game.board.verify_and_fire("D3")
    #assert_equal "D4", @game.cpu_fire
    assert_equal "I missed!? Are you moving your ships?", @game.cpu_fire
  end

  def test_cpu_miss
    #skip
    #@game.board.place(@cpu_sub, ["D3", "D4"])
    assert_equal "I missed!? Are you moving your ships?", @game.cpu_fire
  end

  def test_cpu_hit
    #skip
    @game.board.place(@cpu_sub, ["D3", "D4"])
    @game.board.verify_and_fire("A1")
    @game.board.verify_and_fire("A2")
    @game.board.verify_and_fire("A3")
    @game.board.verify_and_fire("A4")
    @game.board.verify_and_fire("B1")
    @game.board.verify_and_fire("B2")
    @game.board.verify_and_fire("B3")
    @game.board.verify_and_fire("B4")
    @game.board.verify_and_fire("C1")
    @game.board.verify_and_fire("C2")
    @game.board.verify_and_fire("C3")
    @game.board.verify_and_fire("C4")
    @game.board.verify_and_fire("D1")
    @game.board.verify_and_fire("D2")
    assert_equal "Ha! I got you!", @game.cpu_fire
  end

  def test_cpu_sink
  #  skip
    @game.board.place(@cpu_sub, ["D3", "D4"])
    @game.board.verify_and_fire("A1")
    @game.board.verify_and_fire("A2")
    @game.board.verify_and_fire("A3")
    @game.board.verify_and_fire("A4")
    @game.board.verify_and_fire("B1")
    @game.board.verify_and_fire("B2")
    @game.board.verify_and_fire("B3")
    @game.board.verify_and_fire("B4")
    @game.board.verify_and_fire("C1")
    @game.board.verify_and_fire("C2")
    @game.board.verify_and_fire("C3")
    @game.board.verify_and_fire("C4")
    @game.board.verify_and_fire("D1")
    @game.board.verify_and_fire("D2")
    @game.board.verify_and_fire("D3")
    assert_equal "Ha! I got you! One down. One to go.", @game.cpu_fire
  end


  def test_game_over_p1_win
    skip
    @game.board.place(@cpu_sub, ["B1", "B2"])
    @game.board.place(@cpu_cruiser, ["A1", "A2", "A3"])
    @game.board.verify_and_fire("A1")
    @game.board.verify_and_fire("A2")
    @game.board.verify_and_fire("A3")
    @game.board.verify_and_fire("B1")
    @game.board.verify_and_fire("B2")
    assert_equal true, @cpu_sub.sunk?
    assert_equal true, @cpu_cruiser.sunk?
    assert_equal "You won!", @game.human_win?
  end

  def test_game_over_cpu_win
    skip
    @game.board.place(@sub, ["B1", "B2"])
    @game.board.place(@cruiser, ["A1", "A2", "A3"])
    @game.board.verify_and_fire("A1")
    @game.board.verify_and_fire("A2")
    @game.board.verify_and_fire("A3")
    @game.board.verify_and_fire("B1")
    @game.board.verify_and_fire("B2")
    assert_equal true, @sub.sunk?
    assert_equal true, @cruiser.sunk?
    assert_equal "Computer win!", @game.cpu_win?
  end


  def test_turn_human_fire_miss
    skip
    @game.board.place(@sub, ["A1", "A2"])
    @game.board.render
    assert_equal "Your shot missed", @game.turn
  end

  def test_turn_human_fire_sink
    skip
    @game.cpu_board.place(@cpu_sub, ["A1", "A2"])
    @game.cpu_board.render(true)
    @game.cpu_board.verify_and_fire("A1")
    assert_equal "Sunk", @game.turn
  end

  def test_turn_human_fire_hit
    skip
    @game.cpu_board.place(@cpu_sub, ["A1", "A2"])
    @game.cpu_board.render
    assert_equal "Hit", @game.turn
  end



  def test_turn
    skip
    # game = Game.new
    # # @board = Board.new
    # # @board.generate_cells
    # cruiser = Ship.new("Cruiser", 3)
    # submarine = Ship.new("Submarine", 2)
    @game.board.place(@cruiser, ["A1", "B1", "C1"])
    #binding.pry
    @game.turn
  end

  #test game_board
  #108 -- test_game_over_p1
  #121 est_game_over_cpu_win

end
