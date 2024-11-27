# Examples

```@setup ss
using AlGeo
Complex = Algeo(0, 1, ["i"])
```

```@setup xx
using AlGeo
R2 = Algeo(2,0,["i","j"])
```

*How to use?*

!!! note
    Since the system is in its implementation phase, new examples will be added in the future.

## Complex Plane

This example demonstrates a way to work with complex numbers using the AlGeo library, in a user-friendly manner with regard to notation:

```julia
Complex = Algeo(0, 1, ["i"])
```

```@repl ss
i*i == -1*id
5*i*i*i == -5*i
(1+i)*(1+i) == 2*i
(1+i)*(1-i) == 2*id
```

## R2 plane

This example demonstrates a way to work with the R2 vectors using the AlGeo library, in a user-friendly manner with regard to notation:

```julia
R2 = Algeo(2,0,["i","j"])
```

```@repl xx
i^i == 0*id
i|j == 0*id
i^j == ij
(i + 2*j)|(5*i+2*j) == 9*id
```