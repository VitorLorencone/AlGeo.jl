include("GaFunctions.jl")

"""
    CreateSymbols(stringSymbols)

Create and add to REPL all the (custom or basis) symbols for this Algebra.

# Arguments
- `stringSymbols::Array` : An array with all the custom or basis symbols.

"""

const id = Multivectors([1], [1])

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
        eval(:(const $symbol = Multivectors([$k+1], [1])))
        eval(:(export $symbol))
    end

end

"""
    Algeo(p, q, VectorBasis, Basis)::Algebra

Main function for creating your Algebra and adding its basis blades to REPL.
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
function Algeo(p = 0, q = 0, VectorBasis = CanonVectorBasis(p, q), Basis = CanonBasis(VectorBasis))::Algebra

    Al = CreateAlgebra(p, q, VectorBasis, Basis)
    CreateSymbols(Basis)

    return Al

end