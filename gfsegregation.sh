#!/bin/bash

# Function to show usage
usage() {
    echo "Usage: $0 -f <urls_file>"
    echo "Example: $0 -f /home/urls.txt"
    exit 1
}

# Parse command-line arguments
while getopts ":f:" opt; do
  case $opt in
    f)
      URLS_FILE="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      usage
      ;;
  esac
done

# Check if -f was provided and file exists
if [[ -z "$URLS_FILE" ]] || [[ ! -f "$URLS_FILE" ]]; then
    echo "Error: URLs file not found or -f not provided."
    usage
fi

echo "[*] Using URLs file: $URLS_FILE"

# Directory containing gf JSON templates
GF_DIR="$HOME/.gf"

# Output directory in the same folder as input file
INPUT_DIR=$(dirname "$URLS_FILE")
OUTPUT_DIR="$INPUT_DIR/gf-output"
mkdir -p "$OUTPUT_DIR"

# Loop through each JSON template
for TEMPLATE in "$GF_DIR"/*.json; do
    NAME=$(basename "$TEMPLATE" .json)
    OUTPUT_FILE="$OUTPUT_DIR/${NAME}_urls.txt"

    # Run gf using template name directly
    cat "$URLS_FILE" | gf "$NAME" > "$OUTPUT_FILE"

    if [[ -s "$OUTPUT_FILE" ]]; then
        echo "[*] Created $OUTPUT_FILE"
    fi
done

echo "[*] Done! URLs segregated by template in $OUTPUT_DIR."
