
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


### We will continue with the profile likelihood on July, 10th
