#if 0
* born.F
* form factors for {-F[4, {1, Col1}], V[5, {Glu2}]} -> {F[11, {1}], F[11, {1}], -F[4, {1, Col5}]}
* generated by FormCalc 8.4 on 7-Apr-2016 13:06
#endif

#include "vars.h"
#include "inline.h"
#include "contains.h"


	subroutine born
	implicit none

#include "vars.h"

#include "inline.h"

        Ctree(HelInd(1)) = 
     &   Ctree(HelInd(1)) - 
     &    (2*Alfa*Pi)/(3.D0*CW2)*
     &     (GS*Sub12*(Sub17/(MD2 - S) - 
     &          Sub14/(MD2 - S - T24 - U + 2*MNeu2(1))))/
     &      (MZ2 - S34)

#ifdef DEBUG
	DEB("born: Ctree(1) =", Ctree(HelInd(1)))
#endif

#include "contains.h"

	end
