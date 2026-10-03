# Autopsy Experiment Findings

## Dataset

The experiment used a synthetic raw disk image named `infected_disk.dd`.
The image was approximately 50 MB and formatted as FAT32.

The recognized partition extended from sector 63 to sector 102374.

## Autopsy configuration

- Case: `INFECTED_DISK_LAB`
- Host: `INFECTED_PC`
- Image identifier: `img1`
- Disk-image identifier: `vol1`
- Volume identifier: `vol2`
- Filesystem: FAT32

## Recovered artifacts

Autopsy recovered the following synthetic artifacts:

- `backdoor_info.txt`;
- `malware_log.txt`; and
- `stolen_data.txt`.

The files contained minimal synthetic statements created for testing.

## File Analysis

The File Analysis module displayed FAT32 filesystem structures,
timestamps, metadata, and the synthetic artifact files.

## File Type Sorter

File Type Sorter processed 13 entries and identified one extension
mismatch involving a file with a JPEG extension whose internal content
was HTML.

## Keyword Search

Keyword searches were performed for:

- `malware`;
- `backdoor`; and
- `password`.

The terms were associated with the corresponding synthetic artifact
files.

## Integrity

The MD5 value displayed during image ingestion was:

```text
C63D5960E53FDA922F96791A10DED77F
```

## Limitation

The dataset was intentionally constructed for experimentation. The
findings demonstrate Autopsy analysis capabilities but do not establish
a real malware infection, data exfiltration, or cyberattack.
