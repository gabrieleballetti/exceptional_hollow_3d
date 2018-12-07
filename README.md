# Exceptional 3-dimensional hollow polytopes
Magma code and output for the extraction of the exceptional hollow 3-dimensional lattice polytopes from the list of 12 maximals one by Averkov et al.

Here by *hollow* we mean a lattice polytope without interior lattice points, by *exceptional* we mean that it has width larger than one and it admits no projection to the infinite prism over double dilation of a unimodular triangle.

In `main.m` we first extract the 3992 (up to equivalence) subpolytopes of the 12 maximal hollow polytopes having width larger than one (Averkov, Wagner, Weismantel *Maximal lattice-free polyhedra: finiteness and an explicit description in dimension three* **Math. Oper. Res.** 36 (2011), no. 4, 721–742),
```
[[0,0,0],[1,0,0],[1,2,0],[2,2,0],[1,0,2],[2,0,2],[2,2,2],[3,2,2]],
[[0,0,0],[2,0,0],[2,4,0],[2,0,4]],
[[0,0,0],[1,0,0],[2,4,0],[3,0,4]],
[[0,0,0],[1,0,0],[2,3,0],[1,0,3],[-1,-6,3]],
[[0,0,0],[3,0,0],[0,3,0],[0,0,3]],
[[0,0,0],[1,0,0],[1,4,0],[3,0,4],[-1,4,-4]],
[[0,0,0],[1,0,0],[4,6,0],[4,0,6]],
[[0,0,0],[1,0,0],[2,3,0],[5,3,9]],
[[0,0,0],[1,0,0],[3,4,0],[7,4,8]],
[[0,0,0],[1,0,0],[2,3,0],[1,0,3],[2,0,3],[3,3,3]],
[[0,0,0],[1,0,0],[2,5,0],[3,0,5]],
[[0,0,0],[1,0,0],[1,2,0],[3,2,4],[2,2,0],[4,2,4]]
```
and then we check for projections along the direction given by couples of lattice points int the polytopes. The fact that this is enough is a consequence of the following lemma (that you can prove while on the bus, on the way home).

#### Lemma
Let *S* be the exceptional triangle, i.e. the double dilation of a unimodular triangle. Let *P* be a 3-polytope having width larger than 1 projecting to *S* through a projection *f*. Then there is a lattice point *p* in *S* such that two lattice points in *P* project to *p* via *f*.

#### Theorem
Up to equivalence, there are 1377 exceptional hollow 3-dimensional lattice polytopes.

Complete list on `exceptional_hollow.txt`.

####
