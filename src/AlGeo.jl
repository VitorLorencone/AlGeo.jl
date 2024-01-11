#=

TODO: Fazer Tabela de Operações
TODO: Corrigir o show para mostrar o valor com subíndices
TODO: Adicionar a operação de soma
TODO: Exportar os vetores canônicos corretamente para o REPL
TODO: Terminar de documentar as funções

=#

module AlGeo
export Algeo, createConsts, Multivectors, bladeIndex, bladeScalar, bladeGeometricProduct, bladeInnerProduct, bladeOuterProduct, grade, gradeProjection, basisScalarProduct

include("Workspace.jl")

#= ``` 
>>> Algeo(3)
Algebra
p: 3
q: 0
VectorBasis: ["e1", "e2", "e3"]
Basis: ["1", "e1", "e2", "e3", "e1e2", "e1e3", "e2e3", "e1e2e3"]

>>> CurrentAlgebra.Indexes
Array{Int64}[[0], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

>>>e3
1.0*e3

>>>e1e2
1.0*e1e2

>>>e3*e1e2
1.0*e1e2e3

>>>e3|e1e2
0.0

>>>e3^e1e2
1.0*e1e2e3

>>>3*e1e3*5.5
16.5*e1e3

>>>5*e3*7*e1e3
-35.0*e1

``` =#

#=``` 
>>>Complex = Algeo(0, 1, ["i"])
Algebra
p: 0
q: 1
VectorBasis: ["i"]
Basis: ["1", "i"]

>>> i*i
-1

>>> 5*i*i*i

```=#

Complex = Algeo(0, 1, ["i"])
println(i*i)
println(-5.0*i)
println(5*i)
println(5*i*i)

end