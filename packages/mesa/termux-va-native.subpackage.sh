TERMUX_SUBPKG_DESCRIPTION="Termux VA-API driver entry point and DRM shim"
TERMUX_SUBPKG_DEPEND_ON_PARENT=false
TERMUX_SUBPKG_DEPENDS="libandroid-shmem, libc++, libdrm, libglvnd, libllvm (<< $TERMUX_LLVM_NEXT_MAJOR_VERSION), libva, libwayland, libx11, libxcb, libxext, libxfixes, libxshmfence, libxxf86vm, ncurses, vulkan-loader, zlib, zstd"
TERMUX_SUBPKG_INCLUDE="
lib/dri/termuxva_native_drv_video.so
lib/termux-va/libgallium-${TERMUX_PKG_VERSION}-devel.so
lib/termux-va/libtva_drm_shim.so
"
