# OBJECT ORIENTED PROGRAMMING - STRUCTURES
# Code below taken from "Thinking Julia", B. Lauwens, A. Downey, chapters 17 and 18

struct Card
    suit::Int64
    rank::Int64
    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "suit not between 1 and 4")
        @assert(1 ≤ rank ≤ 13, "rank not between 1 and 13")
        new(suit, rank)
    end
end

queen_of_diamonds = Card(2, 12)

const suit_names = ["♠", "♢", "♡", "♣"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

function Base.show(io::IO, card::Card)
    print(io, rank_names[card.rank], suit_names[card.suit])
end

Card(3, 11)

struct Deck
    cards::Array{Card,1}
end

function Deck()
    deck = Deck(Card[])
    for suit in 1:4
        for rank in 1:13
            push!(deck.cards, Card(suit, rank))
        end
    end
    return deck
end

function Base.show(io::IO, deck::Deck)
    for card in deck.cards
        print(io, card, " ")
    end
    println()
end

deckx = Deck()

# Remove a card from a deck
function Base.pop!(deck::Deck)
    pop!(deck.cards)
end

df = pop!(deckx)

# Add a card to a deck
function Base.push!(deck::Deck, card::Card)
    push!(deck.cards, card)
    return deck
end

# Shuffling the cards
using Random

function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    return deck
end

# Exercise 1: Write a function named sort! that uses the function sort! to sort the cards in a Deck. 
# You'll need to define a comparison operator "<" between two cards.

# Comparing two cards
import Base.isless

function isless(c1::Card, c2::Card)
    # TODO
end

Card(1, 4) < Card(2, 3)

# TODO

# ABSTRACT TYPES AND SUBTYPING

abstract type CardSet end

struct Deck2 <: CardSet
    cards::Array{Card,1}
end

function Deck2()
    deck = Deck2(Card[])
    for suit in 1:4
        for rank in 1:13
            push!(deck.cards, Card(suit, rank))
        end
    end
    return deck
end

deck2 = Deck2()
deck2 isa CardSet

struct Hand <: CardSet
    cards::Array{Card,1}
    label::String
end

function Hand(label::String = "")
    return Hand(Card[], label)
end

# Task 2: implement show, pop!, push!, shuffle!, sort! functions for the abstract type CardSet so that both Hand and Deck2 structures can use it.
# Write a function which moves n first cards from the first Hand/Deck to the second Hand/Deck - define it for the type CardSet.
function Base.show() # fill with appropriately typed arguments
    # TODO
end

function Base.pop!() # fill with appropriately typed arguments
    # TODO
end

function Base.push!() # fill with appropriately typed arguments
    # TODO
end

function Random.shuffle!() # fill with appropriately typed arguments
    # TODO
end

function Base.sort!() # fill with appropriately typed arguments
    # TODO
end

function move!() # fill with appropriately typed arguments
    # TODO
end