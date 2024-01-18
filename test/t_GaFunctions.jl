include("../src/AlGeo.jl")
using .AlGeo
using Test

Al3D = Algeo(3)

@test bladeIndex(e1e3) == [[1,3]]
@test bladeScalar(e1) == 1.0
@test bladeScalar(e1*5.3) == 5.3
@test AlGeo.lenElements(Multivectors([1, 2, 3, 7], [1, 1, 1, 1])) == 4 ### change to sum of blades later
@test AlGeo.lenElements(Multivectors([1, 2, 3, 7], [0, 1, 1, 1])) == 3 ### change to sum of blades later
@test grade(e3) == 1
@test grade(e1e3) == 2
@test grade(id) == 0
@test gradeProjection(e1, 1) == e1
@test gradeProjection(e1, 2) == 0*id
@test basisScalarProduct(e1,e2) == 0
@test basisScalarProduct(e2,e2) == 1
@test_throws "This operation must be executed with basis blades." basisScalarProduct(e1e2,e2)
@test_throws "This operation must be executed with basis blades." basisScalarProduct(e1,id)
@test e1*e2 == bladeGeometricProduct(e1,e2)
@test e3*e1 == -e1e3
@test -2*e1*5.3 == -10.6*e1
@test e1e2|e1 == -e2
@test e1^e1e2 == 0*id
@test 5*e3*7*e1e3 == -35*e1
### Add test with sum