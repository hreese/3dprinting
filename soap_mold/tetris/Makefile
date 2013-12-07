# explicit wildcard expansion suppresses errors when no files are found
TARGETS=$(patsubst %.scad,%.stl,$(wildcard *_part.scad))

all: ${TARGETS}

include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -D production=true -o $@ -d $@.deps $<

clean:
	rm -f *.stl *.deps $(patsubst %.scad,%.gcode,$(wildcard *.scad)) 

upload: *.stl
	rm -f mold_tetris.zip
	zip -9 mold_tetris.zip *.stl
	rsync -vaP mold_tetris.zip sprawl@bl0rg.net:public_html/pub/
