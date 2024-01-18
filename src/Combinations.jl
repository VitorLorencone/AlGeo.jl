"""
    CombinationsTuple(lst, k)

Function that calculates all combinations in an array of strings.

# Arguments
- `lst::Array` : A list of Strings.
- `k::Int` : The order of the combinations.
- `count::Int : The index of each element`

# Return
Returns an array with all combinations of elements taken k at a time.

"""
function CombinationsTuple(lst::Array, k::Int, count::Int)::Array{Tuple{Any,Int}}
    
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
    
        push!(result, (element, count))
        count += 1

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

"""
    CombinationsArray(lst, k)

Function that calculates all combinations in an array of Integers.

# Arguments
- `lst::Array` : A list of Integers.
- `k::Int` : The order of the combinations.

# Return
Returns an array with all combinations of elements taken k at a time.

"""
function CombinationsArray(lst::Array, k::Int)::Array{Array{Any}}
    
    result = []
    n = length(lst)
    index = collect(1:k)
    j = k

    @assert k > 0 && k <= n

    while index[1] != n-k+2

        element = []
        for i in index
            push!(element, lst[i])
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