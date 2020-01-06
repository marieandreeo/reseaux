using EcologicalNetworks
using StatsPlots
using Plots
using Statistics

# U = UnipartiteNetwork(rand(Bool, (10,10)))
U = nz_stream_foodweb()[5]

null_sample = rand(null1(U), 10_000)
 simplify!.(null_sample)

is_a_valid_sample(x, N) = (richness(x) == richness(N)) && (links(x) == links(N))
is_a_valid_sample_of_U(x) = is_a_valid_sample(x, B_A)
# filter!(is_a_valid_sample_of_U, null_sample)

expected_spectral_radius = ρ.(null_sample)
# expected_mod = Q(brim(lp(null_sample...))...)

density!(
    (ρ(B_A) .- expected_spectral_radius)./std(expected_spectral_radius),
    frame=:zerolines)

# density!(
#     ( Q_A .- expected_mod)./std(expected_mod),
#     frame=:zerolines)

null1(x)
