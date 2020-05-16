PROJECT ?= $(shell basename $(realpath .))
EXT = cc
TARGET ?= $(shell echo "$(PROJECT).exe" | tr '[:upper:]' '[:lower:]')
PROFILE ?= debug
OUT_DIR ?= build
SRC_DIR ?= src
CC=x86_64-w64-mingw32-g++
LD=$(CC)

#INCLUDES += -I /path/to/include
#LIBS += -L /path/to/libs

INCLUDES += -I $(SRC_DIR)

CFLAGS_release += -O3
CFLAGS_debug += -ggdb -O0
CFLAGS_all += -Wall

CFLAGS = $(CFLAGS_all) $(CFLAGS_$(PROFILE))

LDFLAGS = $(LDFLAGS_all) $(LDFLAGS_$(PROFILE))

DEPS = -Wp,-MMD,$(@:%.o=%.d),-MT,$@

rwildcard = $(wildcard $(addprefix $1/*.,$2)) $(foreach d,$(wildcard $1/*),$(call rwildcard,$d,$2))

SRC = $(call rwildcard, $(SRC_DIR), $(EXT))
OBJ = $(addprefix $(OUT_DIR)/,$(addsuffix .o,$(basename $(SRC:$(SRC_DIR)/%=%))))

.PHONY: all clean rebuild

$(OUT_DIR)/%.o: $(SRC_DIR)/%.$(EXT)
	@mkdir -p $(dir $@)
	$(CC) -c $< $(DEPS) $(CFLAGS) $(INCLUDES) -o $@

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) -o $(TARGET) $(OBJ) $(LDFLAGS) $(LIBS)

clean:
	rm -rf $(OUT_DIR) $(TARGET)

rebuild: clean all

-include $(OBJ:%.o=%.d)

