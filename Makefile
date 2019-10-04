
SRC = usbrh_main.c
EXE = usbrh
RULES = usbrh.rules
RULES_DIR = /etc/udev/rules.d/

$(EXE): $(SRC)
	gcc -g -o $@ $^ -lusb

install: $(EXE)
	cp $(RULES) $(RULES_DIR)
	udevadm trigger
	cp $(EXE) /usr/local/bin/$(EXE)

uninstall:
	rm -f $(RULES_DIR)$(RULES)
	rm -f /usr/local/bin/$(EXE)

clean: 
	rm -f $(EXE)
