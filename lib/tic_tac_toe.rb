class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index,character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
      @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter between 1 and 9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index,current_player)
      display_board
    else valid_move?(index) == false
      until valid_move?(index) == true
        puts "Sorry try again"
        input = gets.strip
        index = input_to_index(input)
      end
    end
  end

  def won?
    @board.all?{|i| i != " " || i != "" }
    winning_array = WIN_COMBINATIONS.detect do |win|
      if win.all? {|index| @board[index] == "X" } == true
        winning_array.inspect
        true
      elsif win.all? {|index| @board[index] == "O" } == true
        winning_array.inspect
        true
      end
     end
   end

   def full?
     @board.all?{|i| i != " "}
   end

   def draw?
     !won?
   end

   def over?
     full?
   end

   def winner
     if !won?
       return nil
     elsif  @board[won?(board)[0]] == "X"
       winner = "X"
     else @board[won?(board)[0]] == "O"
       winner = "O"
     end
   end

   def play

   end
 end
