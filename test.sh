#!/bin/bash
set -e
set -o pipefail

ERRORS=()

# find all executables and run `shellcheck`
for f in $(find . -type f -not -path '*.git*' -not -path '*.vim/*' | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" && echo "[OK]: Successfully linted: $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "All files successfully linted!"
else
	echo "The following files failed shellcheck: ${ERRORS[*]}"
	exit 1
fi
