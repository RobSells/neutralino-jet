#if 0
* abbr0addbar.F
* abbreviations for {F[4, {1, Col1}], -F[4, {1, Col2}]} -> {F[11, {1}], F[11, {1}], V[5, {Glu5}]}
* generated by FormCalc 8.4 on 7-Apr-2016 13:04
#endif

#include "ddbar_n1n1j_vars.h"
#include "contains.h"


	subroutine abbr0addbar
	implicit none

#include "ddbar_n1n1j_vars.h"


	Sub22 = 3*MD2 - S - T - T14 + 2*MNeu2(1)

	Sub23 = 3*MD2 - S - T24 - U + 2*MNeu2(1)

#include "contains.h"

	end
