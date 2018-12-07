// given a vector p in R^3, return a map R^3 -> R^2 projecting along p
function project_along_direction(p)
	M:=Ambient(Polytope([p]));
	l:=LinearSpanEquations([p]);
	assert #l eq #Eltseq(p)-1;
	m:=Matrix(l);
	L,pi:=ToricLattice([Eltseq(c) : c in Rows(Transpose(m))]);
	Z2:=ToricLattice(2);
	phi:=LatticeMap(M,Z2,Matrix(([Z2 ! Eltseq(p) : p in Rows(Transpose(m))])));
	B:=Basis(M);	
	phi_basis:=Image(phi,B);
	phi_basis:=[Codomain(pi) ! a : a in phi_basis];
	ipi_phi_basis:=[Eltseq(p) : p in Preimage(pi,phi_basis)];
	projection:=LatticeMap(M,L,Matrix(ipi_phi_basis));
	return projection;
end function;

anf:=AffineNormalForm(Polytope([[0,0],[2,0],[0,2]]));

// return true if a polytope P has a projection (up to equivalence)
// to 2*D_2, with D_2 being the unimodular triangle, note that
// the projection is chosen only among the possible v-u, with
// u,v lattice points in P
function has_projection(P)
    pts:=Points(P);
    projs:={};
    for ss in Subsets(pts,2) do
        l:=SetToSequence(ss);
        phi:=project_along_direction(l[1]-l[2]);
        if not phi in projs then
            Include(~projs,phi);
            p:=Image(phi,P);
            if AffineNormalForm(p) eq anf then
                return true;
            end if;
        end if;
    end for;
    return false;
end function;

// extract the list of the subpolytopes of the 12
// maximal hollow polytopes having width at least 2
A:=[
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
];
N:=Max([NumberOfPoints(Polytope(s)) : s in A]);
list:=[[] : i in [1..N]];
for s in A do
	P:=Polytope(s);
	n:=NumberOfPoints(P);
	Append(~list[n],Polytope([Eltseq(p) : p in AffineNormalForm(P)]));
end for;
for i in [N..1 by -1] do
	if #list[i] eq 0 then break; end if;
	for P in list[i] do
		for v in Vertices(P) do
			Q:=Polytope(Exclude(Points(P),v));
			if Dimension(Q) eq D and Width(Q) gt 1 then
				QQ:=Polytope([Eltseq(p) : p in AffineNormalForm(Q)]);
				Append(~list[NumberOfPoints(QQ)],QQ);
			end if;
		end for;
	end for;
	set_p:=SequenceToSet(list[i-1]);
	list[i-1]:=SetToSequence(set_p);
	printf "%o - %o\n",i,#list[i];
end for;
hollow:=&cat(list);

// keep the polytopes not having a projection to 2*D_2
// (it is enough to check for the directions v-u where
// u,v lattice points in P, see readme)
exceptional_hollow:=[];
for s in hollow do
    P:=Polytope(s);
    if not has_projection(P) then
        Append(~exceptional_hollow,P);
    end if;
end for;

#exceptional_hollow;
// 1377

