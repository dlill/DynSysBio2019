module fancy

# Functions
export say_hello
say_hello() = println("Hello!")



export calculate_sum
function calculate_sum(x,y)
    x+y
end



# Values
export prices
prices = Dict([("Horse", 1000), ("Dog", 200)])


# Don't export this function
function unexported_function()
    println("I'm not exported")
end



end
