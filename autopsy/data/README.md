# Autopsy Dataset

## Overview

The Autopsy experiment used a controlled synthetic dataset representing
simulated drone-storage evidence. The dataset was created for testing
filesystem analysis, artifact recovery, keyword searching, metadata
inspection, and file-signature analysis.

The dataset does not represent a real drone seizure, real malware
infection, or confirmed cyberattack.

## Disk image

The dataset was stored in a raw disk image named:

```text
infected_disk.dd
```

The image had the following characteristics:

| Property | Value |
|---|---|
| Image filename | `infected_disk.dd` |
| Image type | Raw disk image |
| Approximate size | 50 MB |
| Filesystem | FAT32 |
| Partition type | Win95 FAT32 (`0x0B`) |
| Partition start sector | 63 |
| Partition end sector | 102374 |
| Case name | `INFECTED_DISK_LAB` |
| Host name | `INFECTED_PC` |

The raw image was initially created using a command equivalent to:

```bash
dd if=/dev/zero of=infected_disk.dd bs=1m count=50
```

The image was then formatted as FAT32 and populated with synthetic
evidence-related files.

## Synthetic artifacts

The following artifacts were used during the experiment:

| Filename | Description |
|---|---|
| `backdoor_info.txt` | Simulated backdoor-related record |
| `malware_log.txt` | Simulated malware-activity log |
| `stolen_data.txt` | Simulated stolen-data or credential-related record |
| `sample_image.jpg` | File-masquerading test artifact |

The files were deliberately created as test data. Their names and
contents should not be interpreted as proof of a real compromise.

## File-masquerading artifact

The file named `sample_image.jpg` was intentionally created with a JPEG
extension although its internal content was HTML. Autopsy File Type Sorter
identified the inconsistency between the declared extension and the
detected content type.

This result demonstrates content-signature analysis under controlled
conditions. It does not establish that malware was present on a real
device.

## Keyword-search terms

The following terms were searched in Autopsy:

```text
malware
backdoor
password
```

The expected associations were:

| Keyword | Associated artifact |
|---|---|
| `malware` | `malware_log.txt` |
| `backdoor` | `backdoor_info.txt` |
| `password` | `stolen_data.txt` |

## Integrity information

The MD5 value displayed during image ingestion was:

```text
C63D5960E53FDA922F96791A10DED77F
```

This value should be checked against the original Autopsy screenshot
before being treated as the final dataset record.

Additional hash files, if available, should be stored in:

```text
autopsy/data/hashes/
```

## Repository contents

```text
autopsy/data/
├── README.md
├── hashes/
└── sample_artifacts/
    ├── backdoor_info.txt
    ├── malware_log.txt
    ├── stolen_data.txt
    └── sample_image.jpg
```

If `sample_image.jpg` is not included in this repository, the experiment
documentation should state that the file was used during the original
experiment but is not redistributed here.

## Reproducibility note

A researcher wishing to reproduce the experiment should:

1. Create a 50-MB raw disk image.
2. Format the image as FAT32.
3. Add the synthetic artifacts.
4. Ingest the image into Autopsy.
5. Run File Analysis, File Type Sorter, and Keyword Search.
6. Record the resulting hashes, screenshots, and exported outputs.
