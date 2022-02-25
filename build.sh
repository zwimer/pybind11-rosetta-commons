#!/bin/bash -eux


ROOT="$(pwd)"
PATCH_DIR="${ROOT}/patches"
IN_DIR="${ROOT}/rc-pybind11"
OUT_DIR="${ROOT}/pybind11"

# Args
if [[ "$#" -ne 1 ]]; then
	echo "Usage: ./build.sh <bdist_wheel|sdist|setup.py arg>"
	exit 1
fi
TYPE="$1"


# Update
echo "Updating submodules"
git submodule update --init --recursive

# Create new dir
echo "Creating ${OUT_DIR}"
git submodule update --init --recursive
if [[ -d "${OUT_DIR}" ]]; then
	>&2 echo "Error: ${OUT_DIR} already exists"
	exit 1
fi
cp -a "${IN_DIR}" "${OUT_DIR}"

# Apply patches
echo "Applying patches"
cd "${OUT_DIR}"
git apply "${PATCH_DIR}/"*

# Build
echo "Building wheel"
python3 setup.py "${TYPE}"
