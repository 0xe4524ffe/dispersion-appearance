DEBUG = -g3 -O0
CFLAGS = -Wall -Werror -Wextra -Wpedantic -Wshadow -std=gnu11 $(shell pkg-config --cflags gtk+-3.0)
LFLAGS = $(shell pkg-config --libs gtk+-3.0)

release: main.c
	cc $(CFLAGS) -march=native -Os $(LFLAGS) -o dispersion-appearance main.c
	strip -s dispersion-appearance
	objcopy --strip-all -R .comment -R .note.gnu.build-id -R .note.ABI-tag dispersion-appearance dispersion-appearance

debug: main.c
	cc $(CFLAGS) $(DEBUG) $(LFLAGS) -o dispersion-appearance main.c