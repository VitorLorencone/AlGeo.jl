include("CanonicalBasis.jl")

struct Algebra

    p::Int
    q::Int
    VectorBasis::Array{Tuple{String, Int}}
    #Basis::Array{String}

end

function CreateAlgebra(p, q = 0, VectorBasis = CanonVectorBasis(p, q))::Algebra
    @assert p > 0 && q >= 0
    return Algebra(p, q, VectorBasis)
end