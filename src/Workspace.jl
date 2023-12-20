module Workspace
export a

include("GaFunctions.jl")
using .Alg

a = CreateAlgebra(3)
b = Multivectors([4], [4])
c = Multivectors([3, 5], [6, 7])
d = Multivectors([8], [7])
println(lenElements(b))
println(lenElements(c))
println(lenElements(d))
println(grade(b))
print(grade(d))

end