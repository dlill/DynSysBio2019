
using Distributions
using Plots
using Optim

# Calculate dose-response
# flux reaction:
function reaction(conc,Km,Vmax)
    10 .^Vmax.*conc./(10 .^Km .+ conc)
end

Km = 0
Vmax = 1
conc = collect(0:.01:2)

flux = reaction(conc, Km, Vmax)
plot(conc,flux)

# simulate data with 7% std
conc_sim = [.1,.5,1,2]
flux_sim = reaction(conc_sim,  Km, Vmax)
flux_sim = randn(length(flux_sim))*0.07.*flux_sim+flux_sim
std_sim = flux_sim * .07

scatter!(conc_sim,flux_sim,yerror=std_sim,grid=false,linealpha = 0)

# negative log-likelihood for simulated data
function L(conc,flux,std,p)
    X = reaction(conc,p[1],p[2])
    LL = -sum(-length(X)*log(2π)/2 .- length(X).*log.(abs.(std)) .- (sum((flux .- X).^2) ./ (2std.^2)))
end

# maximum likelihood fit
init = [1.0,1.0]        # start parameters Km,Vmax
optimum = optimize(p -> L(conc_sim,flux_sim,std_sim,p),init,Newton())

# Profile Likelihood for one fixed parameter
function L_1(conc,flux,std,pfix,pn,p)
    if pn <2
        X = reaction(conc,pfix,p)
    else
        X = reaction(conc,p,pfix)
    end
    LL = -sum(-length(X)*log(2π)/2 .- length(X).*log.(abs.(std)) .- (sum((flux .- X).^2) ./ (2std.^2)))
end
#init = [2.0]
#pfix = 0.0
#pn = 1
#opt = optimize(p -> L_1(conc_sim,flux_sim,std_sim,pfix,pn,p),init,NewtonTrustRegion())

# Profile likelihood for pfix and pfit
function prof(optimum,whichPar)
    chi2 = Array{Float64}(undef,1)
    pfit = Array{Float64}(undef,1)
    pfix_collect = Array{Float64}(undef,1)
    step = .01
    if whichPar<2
        fix = 2
    else
        fix = 1
    end
    for sig = -1:2:1
        dev = 0
        n=0
        pfix = optimum.minimizer[fix]+sig*step*n
        while (dev<4 && pfix.>-4 && pfix.<4)
            println(dev)
            println(pfix)
            pfix = optimum.minimizer[fix]+sig*step*n
            init = [optimum.minimizer[whichPar]]
            profopt = optimize(p -> L_1(conc_sim,flux_sim,std_sim,pfix,fix,p),init,Newton())
            dev = (profopt.minimum - optimum.minimum)
            push!(chi2,dev)
            push!(pfit,profopt.minimizer[1])
            push!(pfix_collect,pfix)
            n+=1
        end
    end
    deleteat!(chi2,1)
    deleteat!(pfit,1)
    deleteat!(pfix_collect,1)
    return chi2,pfit,pfix_collect
end

chi2km,Kmfit,Vmaxfix = prof(optimum,1)
chi2vmax,Vmaxfit,Kmfix = prof(optimum,2)

# thresholds
cl = [.68,.95]
thresholds = quantile.(Chisq(1),cl)

# Plot profile likelihoods
p1 = scatter(Vmaxfix,chi2km,ylabel="deviance",xlabel="Vmax", legend= :none)
scatter!([Vmaxfix[1] Vmaxfix[1]],[chi2km[1] chi2km[1]], color = :red)
plot!(Vmaxfix,ones(length(Vmaxfix)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Vmaxfix,ones(length(Vmaxfix)).*thresholds[2],linestyle=:dash,label="0.95")

p2 = scatter(Kmfix,chi2vmax,xlabel="Km")
scatter!([Kmfix[1] Kmfix[1]],[chi2vmax[1] chi2vmax[1]], color = :red, legend= :none)
plot!(Kmfix,ones(length(Kmfix)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Kmfix,ones(length(Kmfix)).*thresholds[2],linestyle=:dash,label="0.95")
plot(p1,p2)

# plot parameter paths
p3 = plot(Kmfit,Vmaxfix, title = "Km fitted", ylabel="Vmax", xlabel = "Km")
scatter!([Kmfit[1] Kmfit[1]],[Vmaxfix[1] Vmaxfix[1]], color = :red)
p4 = plot(Kmfix,Vmaxfit, title = "Vmax fitted", xlabel="Km")
scatter!([Kmfix[1] Kmfix[1]],[Vmaxfit[1] Vmaxfit[1]], color = :red)
plot(p3,p4, legend = :none)




# simulate data for lower concentrations
conc_sim = [.01,.05,.08,.1]
flux_sim = reaction(conc_sim,  Km, Vmax)
flux_sim = rand(length(flux_sim))*0.07.*flux_sim+flux_sim
std_sim = flux_sim * .07

plot(conc,reaction(conc, Km, Vmax))
scatter!(conc_sim,flux_sim,yerror=std_sim,grid=false,linealpha = 0)

# Max-likelihood fit
init = [1.0,1.0]        # start parameters Km,Vmax
optimum = optimize(p -> L(conc_sim,flux_sim,std_sim,p),init,Newton())

# Compute profiles
chi2kmlow,Kmfitlow,Vmaxfixlow = prof(optimum,1)
chi2vmaxlow,Vmaxfitlow,Kmfixlow = prof(optimum,2)

# Plot profile likelihoods
p1 = scatter(Vmaxfixlow,chi2kmlow, ylabel="deviance",xlabel="Km")
scatter!([Vmaxfixlow[1] Vmaxfixlow[1]],[chi2kmlow[1] chi2kmlow[1]], color = :red, legend= :none)
plot!(Vmaxfixlow,ones(length(Vmaxfixlow)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Vmaxfixlow,ones(length(Vmaxfixlow)).*thresholds[2],linestyle=:dash,label="0.95")

p2 = scatter(Vmaxfitlow,chi2vmaxlow,xlabel="Vmax")
scatter!([Vmaxfitlow[1] Vmaxfitlow[1]],[chi2vmaxlow[1] chi2vmaxlow[1]], color = :red, legend= :none)
plot!(Vmaxfitlow,ones(length(Vmaxfitlow)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Vmaxfitlow,ones(length(Vmaxfitlow)).*thresholds[2],linestyle=:dash,label="0.95")
plot(p1,p2)


# same procedure for large concentrations
conc_sim = [5, 6, 8, 10]
flux_sim = reaction(conc_sim,  Km, Vmax)
flux_sim = rand(length(flux_sim))*0.07.*flux_sim+flux_sim
std_sim = flux_sim * .07

plot(conc,reaction(conc, Km, Vmax))
scatter!(conc_sim,flux_sim,yerror=std_sim,grid=false,linealpha = 0)

# Max-likelihood fit
init = [1.0,1.0]        # start parameters Km,Vmax
optimum = optimize(p -> L(conc_sim,flux_sim,std_sim,p),init,Newton())

# Compute profiles
chi2kmhigh,Kmfithigh,Vmaxfixhigh = prof(optimum,1)
chi2vmaxhigh,Vmaxfithigh,Kmfixhigh = prof(optimum,2)

# Plot profile likelihoods
p1 = scatter(Kmfixhigh,chi2vmaxhigh,ylabel="deviance",xlabel="Vmax")
scatter!([Kmfixhigh[1] Kmfithigh[1]],[chi2vmaxhigh[1] chi2vmaxhigh[1]], color = :red, legend= :none)
plot!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[2],linestyle=:dash,label="0.95")

p2 = scatter(Kmfixhigh,chi2vmaxhigh,xlabel="Km")
scatter!([Kmfixhigh[1] Kmfixhigh[1]],[chi2vmaxhigh[1] chi2vmaxhigh[1]], color = :red, legend= :none)
plot!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[1],linestyle=:dash,label="0.68")
plot!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[2],linestyle=:dash,label="0.95")
plot(p1,p2)

# All profiles for Km for different concentrations
p3 = scatter(Kmfix,chi2vmax,ylabel="deviance",xlabel="Km", label = "wide range")
scatter!(Kmfixlow,chi2vmaxlow, label = "low conc")
scatter!(Kmfixhigh,chi2vmaxhigh, label = "high conc")
scatter!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[1],linestyle=:dash,label="0.68")
scatter!(Kmfixhigh,ones(length(Kmfixhigh)).*thresholds[2],linestyle=:dash,label="0.95")

# All profiles for Vmax for different concentrations
p4 = scatter(Vmaxfix,chi2km,ylabel="deviance",xlabel="vmax", label = "wide range")
scatter!(Vmaxfixlow,chi2kmlow, label = "low conc")
scatter!(Vmaxfixhigh,chi2kmhigh, label = "high conc")
scatter!(Vmaxfix,ones(length(Vmaxfix)).*thresholds[1],linestyle=:dash,label="0.68")
scatter!(Vmaxfix,ones(length(Vmaxfix)).*thresholds[2],linestyle=:dash,label="0.95")
plot(p3,p4)
