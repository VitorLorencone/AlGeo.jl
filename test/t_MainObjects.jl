include("../src/AlGeo.jl")
using .AlGeo
using Test

AlD3 = Algeo(3)

@test Multivector <: AbstractGeometricAlgebraType
@test Blade <: AbstractGeometricAlgebraType
@test typeof(Multivectors([1],[1])) <: Blade
@test typeof(Multivectors([1,2],[1,1])) <: Multivector
@test Multivectors([8],[2.5]) == 2.5*e1e2e3
### Add test with sum