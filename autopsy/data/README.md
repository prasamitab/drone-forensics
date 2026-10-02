# Autopsy Dataset

## Overview

This directory contains the synthetic artifacts used in the Autopsy
drone-forensics experiment.

The dataset was created to test filesystem artifact recovery, file-content
inspection, metadata analysis, keyword searching, and file-signature
classification. It represents simulated drone-storage evidence and does
not represent a real drone seizure, malware infection, or confirmed
cyberattack.

## Disk image

The artifacts were placed in a raw disk image named:

```text
infected_disk.dd
```

The image was created specifically for the experiment and was
approximately 50 MB in size.

| Property | Value |
|---|---|
| Image filename | `infected_disk.dd` |
| Image type | Raw disk image |
| Approximate size | 50 MB |
| Filesystem | FAT32 |
| Partition type | Win95 FAT32 (`0x0B`) |
| Partition start sector | 63 |
| Partition end sector | 102374 |
| Autopsy case | `INFECTED_DISK_LAB` |
| Autopsy host | `INFECTED_PC` |

The raw image was initially created using a command equivalent to:

```bash
dd if=/dev/zero of=infected_disk.dd bs=1m count=50
```

The image was subsequently formatted as FAT32 and populated with the
synthetic artifacts described below.

## Synthetic artifacts

The `sample_artifacts/` directory contains the files used to populate
the simulated disk image:

```text
sample_artifacts/
├── backdoor_info.txt
├── malware_log.txt
└── stolen_data.txt
```

### `backdoor_info.txt`

This file is a synthetic backdoor-related record created for testing.
Its content is:

```text
Backdoor installed at C:/Windows/system32
```

This content demonstrates artifact recovery and file-content examination.
It does not prove that a real backdoor was installed on an actual
computer or drone.

### `malware_log.txt`

This file is a minimal synthetic malware-activity log created for the
Autopsy experiment. Its content is:

```text
Simulated malware activity log created for the Autopsy experiment.
```

It was included to test file recovery, keyword searching, and artifact
classification. It does not contain real malware or evidence of a real
infection.

### `stolen_data.txt`

This file is a minimal synthetic credential-related record created for
the experiment. Its content is:

```text
Simulated credential record created for the Autopsy experiment.
```

It does not contain real credentials, personal information, or actual
stolen data.

## File-masquerading test

During the original experiment, an additional test file named
`sample_image.jpg` was used. Although the filename had a JPEG extension,
its internal content was HTML.

Autopsy File Type Sorter identified the mismatch between the declared
filename extension and the detected content type.

The file is not included in this repository unless it is available as
the original synthetic test artifact. The mismatch is documented as a
controlled file-masquerading test condition and must not be interpreted
as proof of a real attack.

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

The searches were used to demonstrate how investigators can locate
potentially relevant strings within recovered files. A keyword hit alone
does not prove that an attack, execution, persistence, or data
exfiltration occurred.

## Image-ingestion information

During Autopsy ingestion, the following identifiers were displayed:

```text
Image identifier: img1
Disk-image identifier: vol1
Volume identifier: vol2
Filesystem: FAT32
Mount point: C:/
```

The image was associated with the following case and host:

```text
Case: INFECTED_DISK_LAB
Host: INFECTED_PC
```

## Integrity information

Autopsy displayed the following MD5 value during image ingestion:

```text
C63D5960E53FDA922F96791A10DED77F
```

This is the value recorded from the experiment screenshot. It should be
verified against the original image and screenshot before being used as
an independent integrity record.

Additional hash records, if available, should be stored in:

```text
autopsy/data/hashes/
```

Do not invent or replace hash values.

## Repository contents

```text
autopsy/data/
├── README.md
├── hashes/
└── sample_artifacts/
    ├── backdoor_info.txt
    ├── malware_log.txt
    └── stolen_data.txt
```

If the original `sample_image.jpg` test artifact is later added, it
should be placed in:

```text
autopsy/data/sample_artifacts/sample_image.jpg
```

## Reproducibility procedure

A researcher can reproduce the synthetic dataset by following these
steps:

1. Create a raw disk image of approximately 50 MB.
2. Format the image as FAT32.
3. Add the synthetic artifact files from `sample_artifacts/`.
4. Ingest the image into Autopsy.
5. Create the case `INFECTED_DISK_LAB`.
6. Create the host `INFECTED_PC`.
7. Run File Analysis.
8. Run File Type Sorter if the file-masquerading artifact is available.
9. Run Keyword Search for `malware`, `backdoor`, and `password`.
10. Record the recovered files, timestamps, hashes, screenshots, and
    exported reports.

## Interpretation and limitations

The artifacts in this directory are deliberately minimal and synthetic.
They were created to evaluate whether Autopsy could:

- recover files from a FAT32 disk image;
- display file contents and metadata;
- locate keywords;
- identify an extension/content mismatch; and
- support a simulated artifact timeline.

The results demonstrate the behavior of the forensic workflow under
controlled test conditions. They do not establish:

- a real malware infection;
- execution of malicious software;
- persistence on a real system;
- actual data theft or exfiltration;
- compromise of a drone; or
- a confirmed real-world cyberattack.

No real credentials, passwords, private flight logs, or personal
information are included in this dataset.
