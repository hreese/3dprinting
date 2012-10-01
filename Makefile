# explicit wildcard expansion suppresses errors when no files are found
TARGETS=$(patsubst %.scad,%.stl,$(wildcard part_*.scad))

all: ${TARGETS}

include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -s $@ -d $@.deps $<
