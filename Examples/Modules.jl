# Read the following file containing julia code
include("fancymodule.jl")

# Import the module fancy
import .fancy
# You can now call all objects in fancy with fancy.object
fancy.say_hello()
fancy.unexported_function()
fancy.prices
# This doesnt work
say_hello()


# "using" makes the exported objects accessible in the Main module
using .fancy
# Now it works
say_hello()
prices
# But this still doesn't
unexported_function()


# More information:
# https://docs.julialang.org/en/v1/manual/workflow-tips/
