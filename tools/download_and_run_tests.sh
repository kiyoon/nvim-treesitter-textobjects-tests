#!/usr/bin/env bash

SOURCE_DIR=$(dirname "$0")

# Download tests
TEMPDIR=$(mktemp -d)
wget --content-disposition 'https://github.com/kiyoon/nvim-treesitter-textobjects-tests/releases/download/v0.1.1/consistency_tests.tar.gz' -P "$TEMPDIR" &> /dev/null

FILE=$(ls "$TEMPDIR")
tar xvfz "$TEMPDIR/$FILE" -C "$TEMPDIR" &> /dev/null

tests_path=$(ls "$TEMPDIR"/*.yaml)

exit_code=0
while read -r test_yaml_path; do
	python "$SOURCE_DIR/run_test_yaml.py" "$test_yaml_path"
	if [ $? -ne 0 ]; then
		exit_code=1
	fi
done <<< "$tests_path"

rm -rf "$TEMPDIR"

exit $exit_code
