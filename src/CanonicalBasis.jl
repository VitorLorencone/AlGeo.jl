function CanonVectorBasis(p::Int, q::Int = 0)::Array{Tuple{String, Int}}

    @assert p > 0 && q >= 0

    basis::Array{Tuple{String, Int}} = []

    for i in 1:(p+q)

        strName::String = "e" * string(i)
        push!(basis, (strName, i))

    end

    return basis

end

function CanonBasis(VectorBasis::Array{Tuple{String, Int}})::Array{String}
    
    # Permutar e combinar cada elemento do array

end