include("Combinations.jl")

"""
    CanonVectorBasis(p, q)

Função que escreve o espaço vetorial canônico, dados os parâmetros p e q de definição.

# Argumentos
- `p::Int` : O primeiro parâmetro da definição
- `q::Int` : O segundo parâmetro da definição

# Retorno
Retorna uma lista de tuplas com todos os elementos necessários para esse espaço.

"""
function CanonVectorBasis(p::Int, q::Int = 0)::Array{Tuple{String, Int}}

    @assert p >= 0 && q >= 0

    basis::Array{Tuple{String, Int}} = []

    for i in 1:(p+q)

        strName::String = "e" * string(i)
        push!(basis, (strName, i))

    end

    return basis

end


"""
    CanonBasis(VectorCanonBasis)

Função que escreve todas as combinações.

# Argumentos
- `VectorCanonBasis::Array{Tuple{String, Int}}` : Uma lista de tuplas, que será feita a combinação.

# Retorno
Retorna uma lista com todas as combinações dos elementos, formando a base do espaço multivetorial.

"""
function CanonBasis(VectorBasis::Array{Tuple{String, Int}})::Array{String}
    
    basis::Array{String} = ["1"]

    Vector = []
    for i in VectorBasis
        push!(Vector, i[1])
    end

    for i in 1:length(Vector)
        basis = vcat(basis, Combinations(Vector, i))
    end

    return basis

end