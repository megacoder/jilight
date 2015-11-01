TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	jilight

${TARGETS}::

clobber distclean:: clean

check::	jilight
	./jilight ${ARGS}

install:: jilight
	${INSTALL} -D jilight ${BINDIR}/jilight

uninstall::
	${RM} ${BINDIR}/jilight

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
