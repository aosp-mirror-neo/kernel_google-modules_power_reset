KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

EXTRA_SYMBOLS += $(OUT_DIR)/../private/google-modules/bms/Module.symvers

include $(KERNEL_SRC)/../private/google-modules/soc/gs/Makefile.include

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) \
	CFLAGS_MODULE="$(CFLAGS_MODULE)" KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)" $(@)
