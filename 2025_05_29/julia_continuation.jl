# LAMBDA EXPRESSIONS
f = x -> x+1
f(3)
f = (x,y) -> x+y
f(7,8)
map(x -> x/2, 1:10) # the same as [x/2 for x in 1:10]
filter(x -> x%3 == 0, 1:10)

# Your task # 1: in one line (!), write a code computes all squares divisible by 16 of integerers from 1 to 100
# TODO


# READING TEXT FROM FILE AND PARSING IT
for line in eachline("some_text.txt")
    println(line)
end
split("Ala ma kota a sierotka Marysia")

# DICTIONARIES
test_dict = Dict("dad" => 23, 45.0 => true, 1//2 => function abc() println("abc") end)
test_dict[1//2]()
keys(test_dict)
test_dict_2 = Dict(x => x+1 for x in 1:10)

# Your task # 2: write a program which reads a text from a file and computes the number of occurences for each word
# TODO


# OBJECT ORIENTED PROGRAMMING - STRUCTURES
# Code below taken from "Thinking Julia", B. Lauwens, A. Downey, chapters 17 and 18
♠
♢
♡

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

const suit_names = ["♠", "♢", "♡", "tofill"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

function Base.show(io::IO, card::Card)
    print(io, rank_names[card.rank], suit_names[card.suit])
end

Card(3, 11)

# Your task # 3: zaimplementuj strukturę "talia kart" (deck po angielsku) posiadającą pole lista kart oraz jej kontruktor
# tworzący standardową talię 52 kart. Wyświetl tą standardową talię, implementując podobny operatory show jak ten 50 linijki
# TODO

# Comparing two cards
import Base.isless

function isless(c1::Card, c2::Card)
    (c1.suit, c1.rank) < (c2.suit, c2.rank)
end

Card(1, 4) < Card(2, 3)