# explicit wildcard expansion suppresses errors when no files are found
TARGETS=$(patsubst %.scad,%.stl,$(wildcard *_part.scad))

all: ${TARGETS}

include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -D production=true -o $@ -d $@.deps $<

clean:
	rm -f *.stl *.deps $(patsubst %.scad,%_export.gcode,$(wildcard *_part.scad))
