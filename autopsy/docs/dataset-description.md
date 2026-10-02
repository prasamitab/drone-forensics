# Dataset Description

## Overview

The Autopsy experiment used a controlled synthetic raw disk image named
`infected_disk.dd`. The image represents simulated drone-storage
evidence and was created for testing filesystem-level forensic analysis.

It is not a physical drone image and does not represent a real
investigation.

## Image properties

| Property | Value |
|---|---|
| Image name | `infected_disk.dd` |
| Image type | Raw disk image |
| Approximate size | 50 MB |
| Filesystem | FAT32 |
| Partition start | Sector 63 |
| Partition end | Sector 102374 |
| Case | `INFECTED_DISK_LAB` |
| Host | `INFECTED_PC` |

## Synthetic artifacts

| File | Purpose |
|---|---|
| `backdoor_info.txt` | Simulated backdoor-related record |
| `malware_log.txt` | Simulated malware activity log |
| `stolen_data.txt` | Simulated credential or stolen-data record |
| `sample_image.jpg` | File-masquerading test artifact |

The file with the JPEG extension was identified through signature-based
analysis as containing HTML data. This was an intentional test
condition.

## Limitation

The artifacts are synthetic. Their presence does not prove malware
execution, persistence, data exfiltration, or compromise of a real
device.

