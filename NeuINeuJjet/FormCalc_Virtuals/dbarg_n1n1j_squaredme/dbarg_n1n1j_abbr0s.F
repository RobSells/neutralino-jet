#if 0
* dbarg_n1n1j_abbr0s.F
* abbreviations for {-F[4, {1, Col1}], V[5, {Glu2}]} -> {F[11, {1}], F[11, {1}], -F[4, {1, Col5}]}
* generated by FormCalc 8.4 on 7-Apr-2016 13:06
#endif

#include "dbarg_n1n1j_vars.h"
#include "contains.h"


	subroutine dbarg_n1n1j_abbr0s
	implicit none

#include "dbarg_n1n1j_vars.h"


	Sub2 = -(3*CW*ZNeuC(1,2)) + SW*ZNeuC(1,1)

	Sub4 = -(3*CW*ZNeu(1,2)) + SW*ZNeu(1,1)

	Sub12 = ZNeu(1,3)*ZNeuC(1,3) - ZNeu(1,4)*ZNeuC(1,4)

	MatSUN(1,1) = 4

	LOOP(Sfe6, 1,2,1)

        Sub1(Sfe6) = 2*MW*(CB*SW*USf(Sfe6,2,4,1)*ZNeu(1,1)) + 
     &    3*CW*MD*(USf(Sfe6,1,4,1)*ZNeu(1,3))

        Sub3(Sfe6) = MW*(CB*Sub2*USf(Sfe6,1,4,1)) + 
     &    3*CW*MD*(USf(Sfe6,2,4,1)*ZNeuC(1,3))

        Sub5(Sfe6) = MW*(CB*Sub4*USfC(Sfe6,1,4,1)) + 
     &    3*CW*MD*(USfC(Sfe6,2,4,1)*ZNeu(1,3))

        Sub6(Sfe6) = 2*MW*
     &     (CB*SW*USfC(Sfe6,2,4,1)*ZNeuC(1,1)) + 
     &    3*CW*MD*(USfC(Sfe6,1,4,1)*ZNeuC(1,3))

	ENDLOOP(Sfe6)

#include "contains.h"

	end
