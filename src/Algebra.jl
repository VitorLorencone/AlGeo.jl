module Alg
export CurrentAlgebra

include("CanonicalBasis.jl")
include("OperationTable.jl")

CurrentAlgebra::Algebra = nothing

"""
    Algebra(p, q, VectorBasis, Basis)

A structure to define an algebra to be worked with its respective dimensions and canonical vectors.

# Arguments
- `p::Int` : The first parameter of the definition
- `q::Int` : The second parameter of the definition
- `VectorBasis::Array{String}` : An Array with vectors to work with
- `Basis::Array{Tuple{String,Int}}` : And Array with the multivector base and it's indexes

"""
struct Algebra

    p::Int
    q::Int
    VectorBasis::Array{String}
    Basis::Array{Tuple{String,Int}}

end

# Show Functions for Algebra Struct

function Base.show(io::IO, a::Algebra)
    println(io, "> Algebra <")
    println(io, "p: $(a.p)")
    println(io, "q: $(a.q)")
    println(io, "VectorBasis: $(a.VectorBasis)")
    println(io, "Basis: $([tupla[1] for tupla in a.Basis])")
end

"""
    CreateAlgebra(p, q, VectorBasis, Basis)

Constructor Function of an algebraic object with parameters p, q, R^{p, q}, and its multivector space.
If not defined, the last two parameters are automatically calculated as canonical.

# Arguments
- `p::Int` : The first parameter of the definition
- `q::Int` : The second parameter of the definition
- `VectorBasis::Array{String}` : An Array with vectors to work with
- `Basis::Array{Tuple{String,Int}}` : And Array with the multivector base and it's indexes

# Return
Returns the created object.

"""
function CreateAlgebra(p, q = 0, VectorBasis = CanonVectorBasis(p, q), Basis = CanonBasis(VectorBasis))::Algebra
    @assert p >= 0 && q >= 0
    CurrentAlgebra = Algebra(p, q, VectorBasis, Basis)
    return CurrentAlgebra
end

end