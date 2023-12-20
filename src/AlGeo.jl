module AlGeo

include("Algebra.jl")
include("Workspace.jl")

using .Workspace

CurrentAlgebra = CreateAlgebra(5)
print(CurrentAlgebra)

end