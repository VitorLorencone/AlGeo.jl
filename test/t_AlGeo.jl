include("../src/AlGeo.jl")
using .AlGeo
using Test

Complex = Algeo(0,1,["i"])
@test i*i == -1*id
@test 5*i*i*i == -5*i

R2 = Algeo(2,0,["i","j"])
@test i^i == 0*id
@test i|j == 0*id

### Problems in changing algebra
### WARNING: redefinition of constant i. This may fail, cause incorrect answers, or produce other errors.