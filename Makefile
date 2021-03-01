
SDL_CFLAGS = -noixemul -I/usr/local/include/SDL2
SDL_LIBS = -noixemul -L/usr/local/lib -lSDL2 -lc -lm

CPPFLAGS += -O2 -std=c++11 -Wall $(SDL_CFLAGS) -MMD

CXX=ppc-morphos-g++-10

SRCS = andy.cpp benchmark.cpp fileio.cpp fs_posix.cpp game.cpp \
	level1_rock.cpp level2_fort.cpp level3_pwr1.cpp level4_isld.cpp \
	level5_lava.cpp level6_pwr2.cpp level7_lar1.cpp level8_lar2.cpp level9_dark.cpp \
	lzw.cpp main.cpp mdec.cpp menu.cpp mixer.cpp monsters.cpp paf.cpp random.cpp \
	resource.cpp screenshot.cpp sound.cpp staticres.cpp system_sdl2.cpp \
	util.cpp video.cpp

SCALERS := scaler_nearest.cpp scaler_xbr.cpp

OBJS = $(SRCS:.cpp=.o) $(SCALERS:.cpp=.o)

DEPS = $(SRCS:.cpp=.d) $(SCALERS:.cpp=.d)

all: hode

hode: $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(SDL_LIBS)

clean:
	rm -f $(OBJS) $(DEPS)

-include $(DEPS)
