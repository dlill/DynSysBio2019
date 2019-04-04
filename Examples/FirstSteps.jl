


import Pkg
Pkg.add("Statistics")

using Statistics
using Distributions
using Plots
using StatsPlots
using LaTeXStrings   # for latex in figures

n= collect(1:10); println(n)
# or
for n in 1:10 print(n," ") end; println()

n2 = n.^2
print(n2)

A = [1 0.5 0.3; 0.5 1 0.4; 0.3 0.4 1]
B = inv(A)

pyplot()

t = collect(0:0.01:1);
T = [0.1 0.2 0.5];
y = sin.(2*pi./T.*t) # . is operator for piece-wise multiplication
plot(t,y,size=(500,100))

p1 = plot(t,y,xlabel="x",ylabel="y",marker=1,label=string.("T = ",T))
p2 = plot(t,y,xlabel="x",ylabel="y",seriestype=:scatter,markerstrokealpha=0,label=string.("T = ",T))
p3 = histogram(y, fillalpha=0.5, label="", title = "histogram")
p4 = boxplot(y, title = "Boxplot",xticks=(1:length(T),string.("T = ",T)), label="")
plot(p1,p2,p3,p4)


