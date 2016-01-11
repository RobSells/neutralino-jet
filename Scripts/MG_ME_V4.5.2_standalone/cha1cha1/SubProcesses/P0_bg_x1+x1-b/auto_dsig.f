      DOUBLE PRECISION FUNCTION DSIG(PP,WGT)
C ****************************************************
C Generated by MadGraph II                                              
C     RETURNS DIFFERENTIAL CROSS SECTION
C     Input:
C             pp    4 momentum of external particles
C             wgt   weight from Monte Carlo
C     Output:
C             Amplitude squared and summed
C ****************************************************
      IMPLICIT NONE
C  
C CONSTANTS
C  
      include "genps.inc"
      include "nexternal.inc"
      DOUBLE PRECISION       CONV
      PARAMETER (CONV=389379.66*1000)  !CONV TO PICOBARNS
      REAL*8     PI
      PARAMETER (PI=3.1415926d0)
C  
C ARGUMENTS 
C  
      DOUBLE PRECISION PP(0:3,NEXTERNAL), WGT
C  
C LOCAL VARIABLES 
C  
      INTEGER I, ICROSS,ITYPE,LP
      DOUBLE PRECISION P1(0:3,NEXTERNAL)
      DOUBLE PRECISION u1,ub1,d1,db1,c1,cb1,s1,sb1,b1,bb1
      DOUBLE PRECISION u2,ub2,d2,db2,c2,cb2,s2,sb2,b2,bb2
      DOUBLE PRECISION g1,g2
      DOUBLE PRECISION a1,a2
      DOUBLE PRECISION XPQ(-7:7)
      DOUBLE PRECISION DSIGUU
C  
C EXTERNAL FUNCTIONS
C  
      LOGICAL PASSCUTS
      DOUBLE PRECISION ALPHAS2,REWGT,PDG2PDF
C  
C GLOBAL VARIABLES
C  
      INTEGER              IPROC
      DOUBLE PRECISION PD(0:MAXPROC)
      COMMON /SubProc/ PD, IPROC
      include "coupl.inc"
      include "run.inc"
C  
C DATA
C  
      DATA u1,ub1,d1,db1,c1,cb1,s1,sb1,b1,bb1/10*1d0/
      DATA u2,ub2,d2,db2,c2,cb2,s2,sb2,b2,bb2/10*1d0/
      DATA a1,g1/2*1d0/
      DATA a2,g2/2*1d0/
      DATA IPROC,ICROSS/1,1/
C ----------
C BEGIN CODE
C ----------
      DSIG = 0D0
      IF (PASSCUTS(PP)) THEN
         IF (ABS(LPP(1)) .GE. 1) THEN
            LP=SIGN(1,LPP(1))
             b1= PDG2PDF(ABS(LPP(1)), 5*LP,XBK(1),DSQRT(Q2FACT(1)))               
         ENDIF
         IF (ABS(LPP(2)) .GE. 1) THEN
            LP=SIGN(1,LPP(2))
             g2= PDG2PDF(ABS(LPP(2)), 0*LP,XBK(2),DSQRT(Q2FACT(2)))               
         ENDIF
         PD(0) = 0d0
         IPROC = 0
         IPROC=IPROC+1      ! b g -> x1+ x1- b                           
         PD(IPROC)=PD(IPROC-1) + b1 * g2                                 
          CALL SMATRIX(PP,DSIGUU)                                              
         dsiguu=dsiguu*rewgt(PP)
         If (dsiguu .lt. 1d199) then
             dsig = pd(IPROC) * conv * dsiguu
         else
             write(*,*) "Error in matrix element"
             dsiguu=0d0
             dsig = 0d0
         endif
         call unwgt(pp,pd(iproc)*conv*dsiguu*wgt)
      ENDIF
      END
