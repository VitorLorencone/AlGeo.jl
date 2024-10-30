include("Combinations.jl")

"""
    CanonVectorBasis(p, q)::Array{String}

Function that writes the canonical vector space, given the parameters p and q for definition

# Arguments
- `p::Int` : The first parameter of the definition
- `q::Int` : The second parameter of the definition

# Return
Return an array of strings with all the necessary elements for this space.

"""
function CanonVectorBasis(p::Int, q::Int = 0)::Array{String}

    if(p < 0) 
        throw(DomainError(p,"The parameter p must be greater than 0"))
    elseif(q < 0)
        throw(DomainError(q,"The parameter q must be greater than 0"))
    end

    basis::Array{String} = []

    for i in 1:(p+q)

        strName::String = "e" * string(i)
        push!(basis, strName)

    end

    return basis

end

"""
    CanonBasis(VectorBasis)::Array{Tuple{String, Int}}

Function that lists all the combinations of canonical vectors in a given Algebra.

# Arguments
- `VectorBasis::Array{String}` : An array of strings to be combined.

# Return
Returns a list of tuples with all combinations of the elements and its index, forming the basis of the multivector space.

"""
function CanonBasis(VectorBasis::Array{String})::Array{Tuple{String, Int}}
    
    basis::Array{Tuple{String, Int}} = [("1", 1)]

    Vector::Array{String} = []
    for i in VectorBasis
        push!(Vector, i)
    end

    for i in 1:length(Vector)
        basis = vcat(basis, CombinationsTuple(Vector, i, length(basis)+1))
    end

    return basis

end

"""
    IndexesBasis(p, q)::Array

A function to return all the indexes of every canon multivector. It is used for internal calculations.

# Arguments
- `p::Int` : The first parameter of the definition
- `q::Int` : The second parameter of the definition

# Return
Returns an Array of Arrays of integers, with all indexes in order.

"""
function IndexesBasis(p::Int = 0, q::Int = 0)::Array{Array{Int}}

    basis::Array = 1:(p+q)
    index = [[0]]

    for i in 1:length(basis)
        index = vcat(index, CombinationsArray(basis, i))
    end

    return index

end