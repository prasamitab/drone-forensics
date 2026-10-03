# File Type Sorter Output

## Purpose

The File Type Sorter module was used to compare filename extensions with
the detected internal file signatures.

## Recorded summary

- Files and directories processed: 13
- Extension mismatches: 1
- Text-category files: 5
- Compressed-category entries: 2
- Image-category files: 0

## Main finding

A file with a JPEG extension was identified as containing HTML data.
This demonstrated a mismatch between the declared filename extension and
the detected content type.

## Interpretation

The mismatch represents a controlled synthetic file-masquerading test
case. It demonstrates the value of signature-based analysis compared
with extension-only inspection.

It does not prove that a real malware attack or file-masquerading attack
occurred.
