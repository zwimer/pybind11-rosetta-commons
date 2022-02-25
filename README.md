### How to update:

1. Clone this repo
2. `grep` through all `pyproject.toml`s to find build requirements; install them
3. `./build.sh sdist` (or `bdist_wheel`) to build
4. `pip install twine`
5. `cd pybind11/dist` then `twine upload <build artifact>`
