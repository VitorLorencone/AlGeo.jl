include("CanonicalBasis.jl")

struct Algebra

    p::Int
    q::Int
    VectorBasis::Array{Tuple{String, Int}}
    Basis::Array{String}

end

"""
    CreateAlgebra(p, q, VectorBasis, Basis)

Função que cria uma estrutura de um objeto algébrico de parâmetros p, q, R^{p, q} e seu espaço multivetorial}.
Caso não definidos, os dois últimos parâmetros são automaticamente calculados como canônicos.

# Argumentos
- `p::Int` : O primeiro parâmetro da definição
- `q::Int` : O segundo parâmetro da definição
- `VectorBasis::Array{Tuple{String, Int}}` : O espaço vetorial de base.
- `Basis::Array{String}` : O espaço multivetorial de base.

# Retorno
Retorna o objeto criado.

"""
function CreateAlgebra(p, q = 0, VectorBasis = CanonVectorBasis(p, q), Basis = CanonBasis(VectorBasis))::Algebra
    @assert p >= 0 && q >= 0
    return Algebra(p, q, VectorBasis, Basis)
end