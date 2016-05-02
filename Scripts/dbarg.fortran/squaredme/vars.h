#if 0
* vars.h
* variable declarations
* generated by FormCalc 8.4 on 7-Apr-2016 13:06
#endif

#ifndef VARS_H
#define VARS_H

#define LEGS 5

#include "decl.h"

#else

#include "decl.h"

	ComplexType Sub4, Sub2, Sub12, Sub1(2), Sub5(2), Sub3(2)
	ComplexType Sub6(2)
	common /varXs/ Sub4, Sub2, Sub12, Sub1, Sub5, Sub3, Sub6

	ComplexType Sub20, Sub18
	RealType S, T, T14, U, T24, S34
	common /varXa/ Sub20, Sub18, S, T, T14, U, T24, S34

	HelType F7, F1, F24, F10, F4, F13, F2, F3, F8, F9, F14, F16
	HelType F27, F25, F18, F20, F21, F19, F23, F22, F11, F5, F17
	HelType F12, F6, F15, F30, F29, F26, F28, Pair1, Pair2
	HelType Pair4, Pair3, Abb1, Abb2, Sub14, Sub17
	HelType Sub10(HelDim(2)), Sub9(HelDim(2)), Sub19(HelDim(2))
	HelType Sub8(HelDim(2)), Sub7(HelDim(2)), Sub21(HelDim(2))
	HelType Sub22(HelDim(2)), Sub15, Sub16, Sub11, Sub13
	common /varXh/ F7, F1, F24, F10, F4, F13, F2, F3, F8, F9, F14
	common /varXh/ F16, F27, F25, F18, F20, F21, F19, F23, F22
	common /varXh/ F11, F5, F17, F12, F6, F15, F30, F29, F26
	common /varXh/ F28, Pair1, Pair2, Pair4, Pair3, Abb1, Abb2
	common /varXh/ Sub14, Sub17, Sub10, Sub9, Sub19, Sub8, Sub7
	common /varXh/ Sub21, Sub22, Sub15, Sub16, Sub11, Sub13

	integer seq(2), Hel(5)
	common /helind/ seq, Hel

	integer Sfe6
	common /indices/ Sfe6

	HelType Ctree(HelDim(1))
	ComplexType MatSUN(1,1)
	common /formfactors/ Ctree, MatSUN

#if PARALLEL
	marker ends, enda, endhel
	common /varXs/ ends
	common /varXa/ enda
	common /helind/ endhel
#endif

#endif