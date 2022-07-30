#ifndef	_PIC_H
#define	_PIC_H

#if defined(_12C508)	|| defined(_12C509)
	#include	<pic1250x.h>
#endif
#if defined(_16C52)	|| defined(_16C54)	|| defined(_16C54A)	||\
    defined(_16CR54A)	|| defined(_16C55)	|| defined(_16C56)	||\
    defined(_16C57)	|| defined(_16CR57B)	|| defined(_16C58A)	||\
    defined(_16CR58A)	|| defined(_16C58)
	#include	<pic165x.h>
#endif
#if defined(_12C671)	|| defined(_12C672)
	#include	<pic1267x.h>
#endif
#ifdef	_14000
	#include	<pic14000.h>
#endif
#if defined(_16C554)	|| defined(_16C556)	|| defined(_16C558)
	#include	<pic1655x.h>
#endif
#ifdef	_16C61
	#include	<pic1661.h>
#endif
#if defined(_16C62)	|| defined(_16C62A)	|| defined(_16CR62)
	#include	<pic1662.h>
#endif
#if defined(_16C620)	|| defined(_16C621)	|| defined(_16C622)
	#include	<pic1662x.h>
#endif
#if defined(_16C63)	|| defined(_16CR63)
	#include	<pic1663.h>
#endif
#if defined(_16C64)	|| defined(_16C64A)	|| defined(_16CR64)
	#include	<pic1664.h>
#endif
#if defined(_16C641)	|| defined(_16C642)	||\
    defined(_16C661)	|| defined(_16C662)
	#include	<pic166xx.h>
#endif
#if defined(_16C65)	|| defined(_16C65A)	|| defined(_16CR65)
	#include	<pic1665.h>
#endif
#if defined(_16C66)	|| defined(_16C67)
	#include	<pic166x.h>
#endif
#if defined(_16C71)	|| defined(_16C710)	|| defined(_16C711)
	#include	<pic1671x.h>
#endif
#ifdef	_16C715
	#include	<pic16715.h>
#endif
	#ifdef	_16C72
#include	<pic1672.h>
#endif
#if defined(_16C73)	|| defined(_16C73A)
	#include	<pic1673.h>
#endif
#if defined(_16C74)	|| defined(_16C74A)
	#include	<pic1674.h>
#endif
#ifdef	_16C76
	#include	<pic1676.h>
#endif
#ifdef	_16C77
	#include	<pic1677.h>
#endif
#if defined(_16F83)	|| defined(_16CR83)
	#include	<pic1683.h>
#endif
#if defined(_16C84)	|| defined(_16F84)	|| defined(_16CR84)
	#include	<pic1684.h>
#endif
#if defined(_16C923)	|| defined(_16C924)
	#include	<pic169xx.h>
#endif
#ifdef  _16C99
	#include        <pic1699.h>
#endif

#ifdef  _17C42
	#include        <pic1742.h>
#endif
#define	CLRWDT()	asm(" clrwdt")

#define	___mkstr(x)	#x
#define	__CONFIG(x)	asm("\tpsect config,class=CODE,delta=2");\
			asm("\tglobal\tconfig_word"); \
			asm("config_word"); \
			asm("\tdw "___mkstr(x))
#endif	/* _PIC_H */
