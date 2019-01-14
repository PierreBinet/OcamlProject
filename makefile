.DEFAULT_GOAL := all

TARGET = ftest

$(TARGET): $(TARGET).ml
	echo -e "-- Compilation of '$(TARGET)' file"
	ocamlbuild $(TARGET).byte

DOT_FILES=$(wildcard files/*.dot)
dot-to-png:
	echo -e "\n-- Drawing dot files"
	$(foreach graph, $(DOT_FILES), dot -Tpng $(graph) > $(graph).png;)

clean:
	rm -rf *.cmi *.cmo ftest.byte _build \$

all: clean $(TARGET)
	./ftest.byte files/graph1 0 5
	#$(MAKE) dot-to-png

$(V).SILENT:
