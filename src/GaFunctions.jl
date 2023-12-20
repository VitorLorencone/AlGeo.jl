include("MainObjects.jl")
include("Algebra.jl")
using .Alg

function lenElements(vec::AbstractGeometricAlgebraType)::Int
    return vec.val.n
end

function grade(vec::Blade)
    return 1
end