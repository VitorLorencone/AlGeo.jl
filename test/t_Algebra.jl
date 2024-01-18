include("../src/Algebra.jl")
using Test

Al3D = CreateAlgebra(3)
@test Al3D.p == 3
@test Al3D.q == 0
@test Al3D.VectorBasis == ["e1", "e2", "e3"]
@test CurrentAlgebra.Basis == [("1", 1), ("e1", 2), ("e2", 3), ("e3", 4), ("e1e2", 5), ("e1e3", 6), ("e2e3", 7), ("e1e2e3", 8)]
@test CurrentAlgebra.Indexes == [[0], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
@test_throws "The parameter p must be greater than 0" CreateAlgebra(-1)
@test_throws "The parameter q must be greater than 0" CreateAlgebra(3,-5)