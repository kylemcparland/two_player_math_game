class Game 

  attr_accessor :current_player

  def initialize()
    @current_player = 1
  end

  def change_player
    @current_player = current_player == 1 ? 2 : 1
  end
  
  def pause_terminal
    sleep(0.5)
  end

end