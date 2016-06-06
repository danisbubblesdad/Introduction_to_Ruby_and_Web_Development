# 8. What can we add to the Bingo class to allow it to inherit the play method
#    from the Game class?

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game # The addition of < Game allows the inheritance to occur.
  def rules_of_play
    #rules of play
  end
end
