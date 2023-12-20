using Test

include("../src/AlGeo.jl")

# CanonicalBasis.jl
@test AlGeo.CanonVectorBasis(3) == ["e1", "e2", "e3"]
@test AlGeo.CanonBasis(AlGeo.CanonVectorBasis(3)) == [("1", 1), ("e1", 2), ("e2", 3), ("e3", 4), ("e1e2", 5), ("e1e3", 6), ("e2e3", 7), ("e1e2e3", 8)]

#Combinations.jl
@test AlGeo.Combinations(["a", "b", "c", "d"], 2, 1) == [("ab", 1), ("ac", 2), ("ad", 3), ("bc", 4), ("bd", 5), ("cd", 6)]

# Algebra.jl
@test AlGeo.CreateAlgebra(2).VectorBasis == ["e1", "e2"]
@test AlGeo.CreateAlgebra(2).p == 2
@test AlGeo.CreateAlgebra(3).Basis == [("1", 1), ("e1", 2), ("e2", 3), ("e3", 4), ("e1e2", 5), ("e1e3", 6), ("e2e3", 7), ("e1e2e3", 8)]