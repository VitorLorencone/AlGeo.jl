using Test

include("../src/AlGeo.jl")

# CanonicalBasis.jl
@test AlGeo.CanonVectorBasis(3) == [("e1", 1), ("e2", 2), ("e3", 3)]
@test AlGeo.CanonBasis(AlGeo.CanonVectorBasis(3)) == ["1", "e1", "e2", "e3", "e1e2", "e1e3", "e2e3", "e1e2e3"]

#Combinations.jl
@test AlGeo.Combinations(["a", "b", "c", "d"], 2) == ["ab", "ac", "ad", "bc", "bd", "cd"]

# Algebra.jl
@test AlGeo.CreateAlgebra(2).VectorBasis == [("e1", 1), ("e2", 2)]
@test AlGeo.CreateAlgebra(2).p == 2
@test AlGeo.CreateAlgebra(3).Basis == ["1", "e1", "e2", "e3", "e1e2", "e1e3", "e2e3", "e1e2e3"]