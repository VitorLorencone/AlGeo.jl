using Test

include("../src/start1/AlGeo.jl")

@test AlGeo.sum(1,5) == 6