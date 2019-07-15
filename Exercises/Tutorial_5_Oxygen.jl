using Pkg, LsqFit, Plots, Optim

x = [ 3.08, 4.61, 6.77, 10.15, 12.31, 15.38, 18.77, 22.77, 25.85, 30.15, 36.00, 45.23, 51.69, 61.85, 75.38, 87.08, 110.5]
y = [2.21, 3.59, 6.08, 10.50, 14.09, 19.34, 28.45, 40.33, 50.00, 60.50, 69.89, 80.11, 83.98, 88.95, 93.37, 95.86, 98.07]
a = [0.5, 1, 2, 4]

function oxygen(x,a)
    # a = exp.(a)
    j= 0:(length(a) -1)
    vec(100*sum(j'.*a'.*x.^j',dims=2)./(4*sum(a'.*x.^j',dims=2)))
end
function optim(x,y,a)
    fit = curve_fit(oxygen,x,y,a)
    p = fit.param
    return p
end

function optimize_fn(a) 
    sum((y .- oxygen(x,a)).^2)
end
a = ones(5)*(10.)

oxygen(x,a)
optimize_fn(a)

a = rand(5) .* 10
p4_optim = optimize(optimize_fn,a)
round.(p4_optim.minimizer, digits = 2)'
plot!(x,oxygen(x,p4_optim.minimizer),label="prior")
# exp.(p4_optim.minimizer)
p4 = optim(x,y,a)
p4_optimize = optimize(oxygen, )
a = a[1:3]
p3 = optim(x,y,a)

a = a[1:2]
p2 = optim(x,y,a)


plot(x,y,label="data",seriestype=:scatter)
plot!(x,oxygen(x,p4_optim.minimizer),label="prior")
plot!(x,oxygen(x,a),label="prior")
plot!(x,oxygen(x,p4),fillrange=[oxygen(x,conf)],label="optimization 4j")
plot!(x,oxygen(x,p3),label="optimization 3j")
plot!(x,oxygen(x,p2),label="optimization 2j")
