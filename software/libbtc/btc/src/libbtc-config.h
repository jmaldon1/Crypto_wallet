/* src/libbtc-config.h.  Generated from libbtc-config.h.in by configure.  */
/* src/libbtc-config.h.in.  Generated from configure.ac by autoheader.  */

#ifndef LIBBTC_CONFIG_H

#define LIBBTC_CONFIG_H

/* Define to 1 to enable debung output */
/* #undef ENABLE_DEBUG */

/* Define to 1 to enable /dev/random as random device */
#define FILE_RANDOM 1

/* Define this symbol if __builtin_expect is available */
#define HAVE_BUILTIN_EXPECT 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if stdbool.h conforms to C99. */
#define HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if the system has the type `_Bool'. */
#define HAVE__BOOL 1

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#define LT_OBJDIR ".libs/"

/* Define to 1 if your C compiler doesn't accept -c and -o together. */
/* #undef NO_MINUS_C_MINUS_O */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "https://github.com/jonasschnelli/libbtc/issues"

/* Define to the full name of this package. */
#define PACKAGE_NAME "libbtc"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "libbtc 0.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "libbtc"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.1"

/* Define to set random file handle */
#define RANDOM_DEVICE "/dev/urandom"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 to enable net compilation */
/* #undef WITH_NET */

/* Define to 1 to enable wallet compilation */
#define WITH_TOOLS 1

/* Define to 1 to enable wallet compilation */
#define WITH_WALLET 1

#endif /*LIBBTC_CONFIG_H*/
