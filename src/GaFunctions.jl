include("MainObjects.jl")
include("Algebra.jl")
using .Alg

function lenElements(vec::AbstractGeometricAlgebraType)::Int
    return length(vec.val.nzind)
end

function grade(vec::Blade)
    return length(CurrentAlgebra.Indexes[vec.val.nzind[1]])
end