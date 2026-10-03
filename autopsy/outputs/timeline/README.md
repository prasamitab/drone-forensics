# Simulated Artifact Timeline

## Purpose

The timeline output records the relationship between synthetic artifact
creation times, file contents, and Autopsy analysis results.

## Interpretation

The timeline represents deliberately created test artifacts. It is not a
confirmed real-world attack timeline.

## Synthetic sequence

1. The disk image was created and formatted as FAT32.
2. Synthetic artifact files were added to the image.
3. The image was ingested into Autopsy.
4. File Analysis displayed the filesystem entries.
5. File Type Sorter examined file signatures.
6. Keyword Search located relevant strings.
7. The recovered artifacts were correlated into a simulated timeline.

Additional timestamp records should be added only when they are supported
by the Autopsy output or screenshots.
