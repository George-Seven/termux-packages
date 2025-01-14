TERMUX_PKG_HOMEPAGE=https://github.com/Moe-hacker/ruri
TERMUX_PKG_DESCRIPTION="Lightweight user-friendly Linux container implementation with zero runtime dependency."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@George-Seven"
_COMMIT=620e61b0fb54f0966fd7621edfb94c5a6183070b
TERMUX_PKG_VERSION=3.8-${_COMMIT}
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="libcap, libseccomp"
TERMUX_PKG_BUILD_DEPENDS="libcap, libseccomp"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_SHA256=90c40443b21c175b2e033c5396ded24542222b5a372df44cff62367e2e017840
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_SKIP_SRC_EXTRACT=true
#TERMUX_PKG_BLACKLISTED_ARCHES="arm, i686, x86_64"

termux_step_get_source() {
	mkdir -p "$TERMUX_PKG_SRCDIR"
	cd "$TERMUX_PKG_SRCDIR"
	git clone https://github.com/Moe-hacker/ruri
	cd ruri
	git checkout ${_COMMIT}
	mv * .* ../
}

termux_step_post_get_source() {
	local s=$(find . -type f ! -path '*/.git/*' -print0 | xargs -0 sha256sum | LC_ALL=C sort | sha256sum)
	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}

termux_step_configure() {
	rm -rf ruri
	make config
}

termux_step_make_install() {
	install -Dm755 -t "${TERMUX_PREFIX}/bin" ruri
}

termux_step_install_license() {
	install -Dm644 -t "$TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME" LICENSE
}
