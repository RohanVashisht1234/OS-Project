#!/bin/bash

# Check if at least 3 arguments are provided
# $# = number of command-line arguments
if [ $# -lt 3 ]; then
    # Show correct usage if arguments are missing
    echo "Usage: $0 <input_file> <output_file> <options>"
    echo "Options:"
    echo "s:  normalize spacing"
    echo "d:  delete duplicate lines"
    echo "i:  insert header"
    echo "a:  append footer"
    echo "p:  preview final output"
    exit 1
fi

# Assign command-line arguments to variables
INPUT_FILE="$1"     # Input text file
OUTPUT_FILE="$2"    # Output text file
OPTIONS="$3"        # Processing options (e.g., sdiap)

# Create a temporary file for intermediate processing
TMP_FILE="$(mktemp)"

# Copy input file contents into the temporary file
cp "$INPUT_FILE" "$TMP_FILE"

# Loop through each character in the OPTIONS string
for (( i=0; i<${#OPTIONS}; i++ )); do
    # Extract one option character at a time
    opt="${OPTIONS:i:1}"

    # Perform action based on the current option
    case "$opt" in
        s)
            # Normalize spacing (collapse multiple spaces/tabs into one)
            tr -s '[:space:]' < "$TMP_FILE" > "${TMP_FILE}.new"
            ;;
        d)
            # Remove duplicate lines while preserving order
            awk '!seen[$0]++' "$TMP_FILE" > "${TMP_FILE}.new"
            ;;
        i)
            # Prompt user to enter a header and prepend it to the file
            read -p "Enter header: " header
            {
                echo "$header"
                cat "$TMP_FILE"
            } > "${TMP_FILE}.new"
            ;;
        a)
            # Prompt user to enter a footer and append it to the file
            read -p "Enter footer: " footer
            {
                cat "$TMP_FILE"
                echo "$footer"
            } > "${TMP_FILE}.new"
            ;;
        p)
            # Preview the current state of the file using less
            cat "$TMP_FILE" | less
            continue
            ;;
        *)
            # Handle invalid options
            echo "Invalid option: $opt"
            rm -f "$TMP_FILE"
            exit 1
            ;;
    esac

    # Replace old temp file with the newly processed version
    mv "${TMP_FILE}.new" "$TMP_FILE"
done

# Copy final processed content to the output file
cp "$TMP_FILE" "$OUTPUT_FILE"

# Clean up the temporary file
rm -f "$TMP_FILE"

# Indicate successful completion
echo "Completed. Output saved to $OUTPUT_FILE"
