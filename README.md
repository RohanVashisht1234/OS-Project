# Case Study 124: Remove Duplicate Lines

## 📌 Overview

Text and log files typically have **inconsistent spacing** between lines, and may also contain **duplicate lines**, making it difficult for analysts to effectively perform their job.

This project provides the user with a **Bash script** which will allow the analyst to normalize (standardize) spacing, eliminate the duplicate lines, insert header/footer information, and preview the formatted final output for any text file.

The script has been built in a **modular** way, so the user can specify which sequence of operations they want to apply by using simple option flags.

---

## 🎯 Objectives

* Clean and preprocess text/log files
* Eliminate duplicate entries
* Improve readability through spacing normalization
* Add contextual headers and footers
* Preview results before saving

---

## 🛠 Features & Options

| Option | Description                                                |
| ------ | ---------------------------------------------------------- |
| `s`    | Normalize spacing (collapse multiple spaces/tabs into one) |
| `d`    | Delete duplicate lines (preserves original order)          |
| `i`    | Insert a header at the top of the file                     |
| `a`    | Append a footer at the end of the file                     |
| `p`    | Preview the current output using `less`                    |

Multiple options can be combined (e.g., `sdip`).

---

## 📂 Project Structure

```
.
├── remove_duplicates.sh
├── input.txt
├── output.txt
└── README.md
```

---

## 🚀 Usage

### Make the script executable

```bash
chmod +x remove_duplicates.sh
```

### Run the script

```bash
./remove_duplicates.sh <input_file> <output_file> <options>
```

### Example

```bash
./remove_duplicates.sh input.txt cleaned.txt sdip
```

This will:

1. Normalize spacing
2. Remove duplicate lines
3. Insert a header
4. Preview the output before saving

---

## 🧪 Workflow (Step-by-Step)

1. Identify the input file
2. Normalize spacing using `s`
3. Remove duplicate lines using `d`
4. Insert a header using `i`
5. Append a footer using `a`
6. Preview the final output using `p`
7. Save the cleaned output to a new file

---

## Contents:

* ✅ **Script**: `remove_duplicates.sh`
* ✅ **Input and cleaned output files**

---

## 📚 Tools & Commands Used

* `bash`
* `awk`
* `tr`
* `less`
* `mktemp`

---

## 📝 Notes

* The script processes options **in the order provided**
* Temporary files are safely handled and cleaned up
* Invalid options are detected with clear error messages
