#if 0
* vars.h
* variable declarations
* generated by FormCalc 8.4 on 7-Apr-2016 13:04
#endif

#ifndef VARS_H
#define VARS_H

#define LEGS 5

#include "decl.h"

#else

#include "decl.h"

	ComplexType Sub3, Sub14, Sub6(2), Sub4(2), Sub2(2), Sub1(2)
	ComplexType Sub5(2)
	common /varXs/ Sub3, Sub14, Sub6, Sub4, Sub2, Sub1, Sub5

	ComplexType Sub22, Sub20
	RealType S, T, T14, U, T24, S34
	common /varXa/ Sub22, Sub20, S, T, T14, U, T24, S34

	HelType F13, F23, F8, F9, F3, F2, F1, F7, F24, F5, F12, F14
	HelType F18, F20, F21, F22, F26, F27, F19, F17, F11, F10, F4
	HelType F6, F28, F29, F25, F16, F30, F15, Pair1, Pair2
	HelType Pair4, Pair3, Abb1, Abb2, Sub16, Sub19
	HelType Sub24(HelDim(2)), Sub9(HelDim(2)), Sub11(HelDim(2))
	HelType Sub7(HelDim(2)), Sub8(HelDim(2)), Sub12(HelDim(2))
	HelType Sub21(HelDim(2)), Sub23(HelDim(2)), Sub25(HelDim(2))
	HelType Sub15, Sub13, Sub18, Sub17
	common /varXh/ F13, F23, F8, F9, F3, F2, F1, F7, F24, F5, F12
	common /varXh/ F14, F18, F20, F21, F22, F26, F27, F19, F17
	common /varXh/ F11, F10, F4, F6, F28, F29, F25, F16, F30
	common /varXh/ F15, Pair1, Pair2, Pair4, Pair3, Abb1, Abb2
	common /varXh/ Sub16, Sub19, Sub24, Sub9, Sub11, Sub7, Sub8
	common /varXh/ Sub12, Sub21, Sub23, Sub25, Sub15, Sub13
	common /varXh/ Sub18, Sub17

	integer seq(2), Hel(5)
	common /helind/ seq, Hel

	integer Sfe6
	common /indices/ Sfe6

	HelType Ctree(HelDim(1))
	ComplexType MatSUN(1,1)
	common /ug_n1n1j_formfactors/ Ctree, MatSUN

#if PARALLEL
	marker ends, enda, endhel
	common /varXs/ ends
	common /varXa/ enda
	common /helind/ endhel
#endif

#endif
