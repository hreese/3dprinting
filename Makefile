# explicit wildcard expansion suppresses errors when no files are found
TARGETS=$(patsubst %.scad,%.stl,$(wildcard *_part.scad)) $(patsubst %.scad,%.3mf,$(wildcard *_part.scad))

all: ${TARGETS}

include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -D production=true -o $@ -d $@.deps $<

%.3mf: %.scad
	openscad -m make -D production=true -o $@ -d $@.deps $<

clean:
	rm -f *.3mf *.stl *.deps $(patsubst %.scad,%.gcode,$(wildcard *.scad)) 
