C  Adventure parameters
C
C Revision history
C 15-Jul-77 Kent Blackett   Revised original DECSYSTEM-10 version for
C               IAS/FORTRAN-IV-PLUS on the PDP-11/70
C 21-Oct-77 Bob Supnik  Revised IAS version for RT-11/FORTRAN IV
C               Also runs under RSX, VMS
C 25-Aug-78 Bob Supnik  Fixes and edits
C 12-Nov-78 Bob Supnik  Fixes and edits
C 26-Aug-93 Bob Supnik  Revised for portability
C 01-Feb-94 Bob Supnik  Aligned text COMMONS
C
C There are limits which cannot be exceeded due to the structure of
C the database (e.g., the vocabulary uses N/1000 to determine word type,
C so there can't be more than 1000 words).  These upper limits are:
C
      PARAMETER (VOCMAX = 1000)     ! non-synonymous vocab words
      PARAMETER (LOCMAX = 300)      ! locations
      PARAMETER (OBJMAX = 100)      ! objects
      PARAMETER (DWFMAX = 6)        ! drawves
C
C Current limits:
C
      PARAMETER (TRVSIZ = 750)      ! TRAVEL
      PARAMETER (FILSIZ = 900)      ! messages - should be even
      PARAMETER (TABSIZ = 300)      ! KTAB, ATAB
      PARAMETER (RTXSIZ = 205)      ! RTEXT
      PARAMETER (LOCSIZ = 150)      ! LTEXT, STEXT, KEY,
                                    ! COND, ABB, ATLOC
      PARAMETER (VRBSIZ = 35)       ! ACTSPK
      PARAMETER (HNTSIZ = 20)       ! HINTLC, HINTED, HINTS
      PARAMETER (CLSSIZ = 12)       ! CTEXT, CVAL
C     Object arrays must be exactly OBJMAX  ! PLAC, PLACE, FIXD, FIXED,
      PARAMETER (OBJMX2 = OBJMAX*2) ! LINK (TWICE), PTEXT, PROP
C
      LOGICAL LMWARN,CLOSNG,PANIC,HINTED,
     1  CLOSED,GAVEUP,SCORNG,DSEEN
C
      COMMON /VERSN/ VMAJ,VMIN,VEDIT
      COMMON /TXTCOM/ TRECNO,TLINES,RTEXT
      COMMON /VOCCOM/ ATAB,KTAB
      COMMON /PLACOM/ ATLOC,LINK,PLACE,FIXED,HOLDNG
      COMMON /PTXCOM/ PTEXT
      COMMON /ABBCOM/ ABB
      COMMON /MISCOM/ LINUSE,TRVS,CLSSES,OLDLOC,LOC,CVAL,TK,NEWLOC,
     1  KEY,PLAC,FIXD,ACTSPK,COND,HINTS,HNTMAX,PROP,TALLY,TALLY2,
     2  HINTLC,CHLOC,CHLOC2,DSEEN,DFLAG,DLOC,DALTLC,KEYS,LAMP,GRATE,
     3  CAGE,ROD,ROD2,STEPS,BIRD,DOOR,PILLOW,SNAKE,FISSUR,TABLET,
     4  CLAM,OYSTER,MAGZIN,DWARF,KNIFE,FOOD,BOTTLE,WATER,OIL,PLANT,
     5  PLANT2,AXE,MIRROR,DRAGON,CHASM,TROLL,TROLL2,BEAR,MESSAG,VEND,
     6  BATTER,NUGGET,COINS,CHEST,EGGS,TRIDNT,VASE,EMRALD,PYRAM,
     7  PEARL,RUG,CHAIN,BACK,LOOK,CAVE,NULL,ENTRNC,DPRSSN,SAY,LOCK,
     8  THROW,FIND,INVENT,TURNS,LMWARN,KNFLOC,DETAIL,ABBNUM,
     9  NUMDIE,MAXDIE,DKILL,FOOBAR,BONUS,CLOCK1,CLOCK2,
     1  CLOSNG,PANIC,CLOSED,GAVEUP,SCORNG,ODLOC,STREAM,SPICES
      COMMON /MISC2/ CTEXT,STEXT,LTEXT,TRAVEL,TRVCON,TRVLOC,
     1  MAXTRS,HINTED
C
      DIMENSION TRECNO(FILSIZ)
      CHARACTER*72 TLINES(FILSIZ)
      DIMENSION KTAB(TABSIZ)
      CHARACTER*8 ATAB(TABSIZ)
      DIMENSION TRAVEL(TRVSIZ),TRVCON(TRVSIZ),TRVLOC(TRVSIZ)
      DIMENSION LTEXT(LOCSIZ),STEXT(LOCSIZ),KEY(LOCSIZ),COND(LOCSIZ),
     1  ABB(LOCSIZ),ATLOC(LOCSIZ)
      DIMENSION PLAC(OBJMAX),PLACE(OBJMAX),FIXD(OBJMAX),FIXED(OBJMAX),
     1  LINK(OBJMX2),PTEXT(OBJMAX),PROP(OBJMAX)
      DIMENSION ACTSPK(VRBSIZ)
      DIMENSION RTEXT(RTXSIZ)
      DIMENSION CTEXT(CLSSIZ),CVAL(CLSSIZ)
      DIMENSION HINTLC(HNTSIZ),HINTED(HNTSIZ),
     1  HINTS(HNTSIZ,4),TK(HNTSIZ)

      DIMENSION DSEEN(DWFMAX),DLOC(DWFMAX),ODLOC(DWFMAX)