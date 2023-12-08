"""
    Combinations(lst, k)

Função que calcula as combinações em uma lista de strings.

# Argumentos
- `lst::Array{String}` : Uma lista de strings.
- `k::Number` : A ordem das combinações.

# Retorno
Retorna uma lista com todas as combinações dos elementos tomados k a k.

"""
function Combinations(lst::Array, k::Int)::Array
    
    result = []
    n = length(lst)
    index = collect(1:k)
    j = k

    @assert k > 0 && k <= n

    while index[1] != n-k+2

        element = ""
        for i in index
            element = element * lst[i]
        end
    
        push!(result, element)

        index[j] += 1
        while index[1] != n-k+2
            if(index[j] > n + j - k)
                j -= 1
                index[j] += 1
            else
                while j != k
                    j += 1
                    index[j] = index[j-1] + 1
                end
                break
            end
        end
    end

    return result

end