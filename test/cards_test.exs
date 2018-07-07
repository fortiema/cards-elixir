defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "create_hand respects hand_size" do
    {hand, deck} = Cards.create_hand(5)
    assert length(hand) == 5
  end

end
