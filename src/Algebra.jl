include("CanonicalBasis.jl")

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
    Indexes::Array{Array{Int}}

end

# Show Functions for Algebra Struct

function Base.show(io::IO, a::Algebra)
    println(io, "Algebra")
    println(io, "p: $(a.p)")
    println(io, "q: $(a.q)")
    println(io, "VectorBasis: $(a.VectorBasis)")
    print(io, "Basis: $([tupla[1] for tupla in a.Basis])")
end

# Global Variable for exporting the Current Algebra
global CurrentAlgebra::Algebra = Algebra(0, 0, [], [("1", 1)], [[0]])

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
Returns the created Algebra object.

"""
function CreateAlgebra(p = 0, q = 0, VectorBasis = CanonVectorBasis(p, q), Basis = CanonBasis(VectorBasis))::Algebra

    if(p < 0) 
        throw(DomainError(p,"The parameter p must be greater than 0"))
    elseif(q < 0)
        throw(DomainError(q,"The parameter q must be greater than 0"))
    end

    global CurrentAlgebra = Algebra(p, q, VectorBasis, Basis, IndexesBasis(p, q))
    return CurrentAlgebra
end