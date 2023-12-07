using Test

include("../src/start1/AlGeo.jl")

@test AlGeo.CanonVectorBasis(3) == [("e1", 1), ("e2", 2), ("e3", 3)]

@test AlGeo.CreateAlgebra(2).VectorBasis == [("e1", 1), ("e2", 2)]
@test AlGeo.CreateAlgebra(2).p == 2