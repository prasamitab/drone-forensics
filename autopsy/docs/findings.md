# Findings

## Image ingestion

Autopsy successfully recognized the FAT32 image and made it available for
filesystem-level examination.

The recorded configuration was:

```text
Case: INFECTED_DISK_LAB
Host: INFECTED_PC
Image identifier: img1
Volume identifier: vol2
```

## Image integrity

The MD5 value displayed during the recorded session was:

```text
C63D5960E53FDA922F96791A10DED77F
```

Verify this value against the original screenshot before treating it as
the final repository record.

## Recovered artifacts

The following synthetic artifacts were recovered:

- `backdoor_info.txt`
- `malware_log.txt`
- `stolen_data.txt`
- `sample_image.jpg`

## File-signature mismatch

File Type Sorter identified one extension mismatch. The file named
`sample_image.jpg` contained HTML content despite having a JPEG
extension.

This is a simulated file-masquerading condition created for the
experiment. It is not evidence of a real attack.

## Keyword search

Keyword searches were performed for:

- `malware`;
- `backdoor`; and
- `password`.

The results were correlated with the corresponding synthetic files.

## Timeline

The recovered timestamps were used to construct a simulated artifact
timeline. This timeline represents synthetic file creation and analysis
events, not a confirmed real-world attack timeline.
