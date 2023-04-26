defmodule Rps do
  @moves [:rock, :paper, :scissors]

  def get_computer_move do
    Enum.random(@moves)
  end

  def get_player_move(move) do
    player_move =
      move
      |> String.trim()
      |> String.downcase()
      |> String.to_atom()

    case Enum.member?(@moves, player_move) do
      true -> player_move
      false -> "This move is not available. You must select either rock, paper or scissors."
    end
  end

  def winner(player_move, computer_move) do
    case {player_move, computer_move} do
      {:rock, :scissors} ->
        "You chose #{player_move}, the computer chose #{computer_move}. You win!"

      {:paper, :rock} ->
        "You chose #{player_move}, the computer chose #{computer_move}. You win!"

      {:scissors, :paper} ->
        "You chose #{player_move}, the computer chose #{computer_move}. You win!"

      {:rock, :rock} ->
        "Both you and the computer chose #{player_move}. It's a tie!"

      {:paper, :paper} ->
        "Both you and the computer chose #{player_move}. It's a tie!"

      {:scissors, :scissors} ->
        "Both you and the computer chose #{player_move}. It's a tie!"

      _ ->
        "You chose #{player_move}, the computer chose #{computer_move}. The Computer wins!"
    end
  end

  def play_game(move) do
    move
    |> get_player_move()
    |> winner(get_computer_move())
  end
end
