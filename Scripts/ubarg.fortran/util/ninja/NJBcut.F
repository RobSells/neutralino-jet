* NJBcut.F
* the FormCalc wrapper for the Ninja two-point function
* this file is part of FormCalc
* last modified 29 Aug 14 th

#include "types.h"


	subroutine NJBmas(mi, p, m1, m2)
	implicit none
	ComplexType mi(*)
	RealType p, m1, m2
	end


************************************************************************

	ComplexType function NJBcut(mi, hel, rank,
     &    num, muexp, t3exp, t2exp,
     &	  k, m1, m2)
	implicit none
	ComplexType mi(*)
	external num, muexp, t3exp, t2exp
	integer hel, rank
	integer*8 k
	RealType m1, m2

#include "NJ.h"

	RealType kj(0:3,2), mj(2)
	ComplexType res(-2:0)

	NJBcut = 0
	if( hel .eq. 0 ) return

	kj(0,1) = 0
	kj(1,1) = 0
	kj(2,1) = 0
	kj(3,1) = 0
	call NJMomDecode(k, kj(0,2))

	mj(1) = m1
	mj(2) = m2

#if NJDEBUG >= 2
	print *, "  rank =", rank
	print '("   k1: ",Z8.8)', k1
	print *, "  k1 =", kj(0,2)
	print *, "      ", kj(1,2)
	print *, "      ", kj(2,2)
	print *, "      ", kj(3,2)
	print *, "  m1 =", mj(1)
	print *, "  m2 =", mj(2)
	call flush(6)
#endif

	call ninjaformcalc(num, muexp, t3exp, t2exp, 2, rank,
     &    kj, mj, mudim, res)
	NJBcut = res(-epsi)

#if NJDEBUG
	print *, "NJBcut =", NJBcut
	call flush(6)
#endif
	end

