module Workspace
export CurrentAlgebra

include("Algebra.jl")

CurrentAlgebra::Algebra = CreateAlgebra(3)

end