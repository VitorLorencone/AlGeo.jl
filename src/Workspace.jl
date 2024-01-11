include("GaFunctions.jl")

function CreateSymbols(stringSymbols::Array)::Nothing

    symbolArray = []

    for i in eachindex(stringSymbols)
        if i == 1
            continue
        end
        push!(symbolArray, Symbol(stringSymbols[i][1]))
    end

    for k in eachindex(symbolArray)
        symbol = symbolArray[k]
        eval(:($symbol = Multivectors([$k+1], [1])))
    end

end

function Algeo(p = 0, q = 0, VectorBasis = CanonVectorBasis(p, q), Basis = CanonBasis(VectorBasis))::Algebra

    Al = CreateAlgebra(p, q, VectorBasis, Basis)
    CreateSymbols(Basis)

    return Al

end