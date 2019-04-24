
### INSTALLING PACKAGES

import Pkg
Pkg.update()
Pkg.add("Statistics")
Pkg.add("Distributions")
Pkg.add("Plots")
Pkg.add("StatsPlots")
Pkg.add("LaTeXStrings")


### GET A FEELING

# Create vectors
n = [1 2 3 4 5 6 7 8 9 10]
n = collect(1:10)
n = Vector(undef,10)
n = ones(10)

# Create matrices
A = [1 2 3 ; 4 5 6 ; 7 8 9]
A = Matrix(undef,5,3)
A = zeros(5,3)

# Ouput result
print(n)

# Loops
for i in 1:10
    print(i," ")
end


### APPLY EASY MATH

n2 = n.^2   # . operator is for piece-wise multiplication
n2 = n.*n

A = [1 0.5 0.3; 0.5 1 0.4; 0.3 0.4 1]
B = inv(A)
B = A'


# USING PACKAGES

m = mean(n)
using Statistics
m = mean(n)


### PLOTTING

using Plots

plot(A)

# plotarguments
labels = ["1" "2" "3"]

p1 = plot(A,xlabel="x",ylabel="y",label=labels)
p2 = plot(A,xlabel="x",ylabel="y",seriestype=:scatter,label="")
p3 = plot(A,xlabel="x",ylabel="y",yerror=A*0.1,label="")

# histogram, boxplot
p4 = histogram(A, xlabel="y",ylabel="Frequency",nbins=5, fillalpha=0.5, label="", title = "histogram")
using StatsPlots
p5 = boxplot(A, title = "boxplot",xticks=(1:length(labels),labels), label="")

# subplot
plot(p1,p2,p3,p4,p5)

# Plot sinus
t = collect(0:0.01:1);
T = [0.1 0.2 0.5]
y = sin.(2*pi./T.*t)
plot(t,y,size=(500,100))

using LaTeXStrings   # for latex in figures
plot(t,y,label=[L"y_0=0","y0=0","y_0 = 0"]) # by putting L in front, it's latex
