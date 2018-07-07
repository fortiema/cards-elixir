defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of tuples representing a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      {value, suit}
    end
  end

  @doc """
    Devides a deck into a hand into a remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      [{"Ace", "Spades"}]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Creates a deck, shuffles it, and returns a hand of size `hand_size`.

  ## Exemples

      iex> {hand, deck} = Cards.create_hand(5)
      iex> length(hand)
      5
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  @doc """
    Determines whether a deck contains a given card.

  ## Exemples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, {"Ace", "Spades"})
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "Something went wrong!"
    end
  end
end
