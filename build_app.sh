#!/bin/zsh

set -eu

BUILD_TYPE="d"
KEEP_BUILD=true
VERBOSE=false

showHelp() {
	echo "Usage: $0 -b <build_type> [-d] [-v] [-h]"
	echo "  -b: Build type (d for Debug, r for Release, rd for RelWithDebInfo) (default: Debug)"
	echo "  -d: Delete the build directory (optional)"
	echo "  -v: Enable verbose build output (optional)"
	echo "  -h: Show this help message"
	exit 0
}

while getopts ":b:dhv" opt; do
	case "$opt" in
	b)
		BUILD_TYPE="$OPTARG"
		;;
	d)
		KEEP_BUILD=false
		;;
	v)
		VERBOSE=true
		;;
	h)
		showHelp
		;;
	*)
		echo "Invalid option: -$OPTARG"
		showHelp
		;;
	esac
done

case "$BUILD_TYPE" in
d)
	BUILD_TYPE="Debug"
	;;
r)
	BUILD_TYPE="Release"
	;;
rd)
	BUILD_TYPE="RelWithDebInfo"
	;;
*)
	echo "Invalid build type. Use d (Debug), r (Release), or rd (RelWithDebInfo)"
	exit 1
	;;
esac

echo "Build type: $BUILD_TYPE"
echo

SRC_DIR="/app/"
BUILD_DIR="/app/build/"

[[ "$KEEP_BUILD" == false && -d "$BUILD_DIR" ]] && rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR" || {
	echo "$BUILD_DIR does not exist"
	exit 1
}

VERBOSE_FLAG=""
if [[ "$VERBOSE" == true ]]; then
	VERBOSE_FLAG="--verbose"
fi

cmake -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE="$BUILD_TYPE" "$SRC_DIR"
cmake --build . $VERBOSE_FLAG --parallel
