include packages/cmake.mk

ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_WITH_DEBUG),y)
cmake-args += \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo
else
cmake-args += \
	-DCMAKE_BUILD_TYPE=Release
endif

cmake-args += \
	-DCMAKE_INSTALL_PREFIX=$(prefix) \
	-DCMAKE_SYSTEM_PROCESSOR=$(CONFIG_ARCH) \
	-DENABLE_API_TESTS=OFF \
	-DENABLE_FULLSCREEN_API=ON \
	-DENABLE_GEOLOCATION=OFF \
	-DENABLE_INTROSPECTION=OFF \
	-DENABLE_MINIBROWSER=ON \
	-DUSE_LIBHYPHEN=OFF \
	-DPORT=GTK

# JIT only works with x86, x86_64 or any ARM with NEON
ifeq ($(CONFIG_ARCH_X86)$(CONFIG_ARCH_X86_64)$(CONFIG_ARCH_ARM_EXT_NEON),y)
cmake-args += \
	-DENABLE_JIT=ON
else
cmake-args += \
	-DENABLE_JIT=OFF
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_VIDEO),y)
cmake-args += \
	-DENABLE_VIDEO=ON \
	-DENABLE_WEB_AUDIO=ON
else
cmake-args += \
	-DENABLE_VIDEO=OFF \
	-DENABLE_WEB_AUDIO=OFF
endif

ifeq ($(CONFIG_VIRTUAL_LIBS_GTK_GTK3),y)
cmake-args += \
	-DENABLE_PLUGIN_PROCESS_GTK2=OFF
  ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_WEBGL),y)
cmake-args += \
	-DENABLE_ACCELERATED_2D_CANVAS=ON \
	-DENABLE_OPENGL=ON \
	-DENABLE_X11_TARGET=ON
  else
conf-args += \
	-DENABLE_ACCELERATED_2D_CANVAS=OFF \
	-DENABLE_OPENGL=OFF
  endif
else
cmake-args += \
	-DENABLE_PLUGIN_PROCESS_GTK2=ON
endif
