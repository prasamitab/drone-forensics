# File Analysis Output

## Purpose

The Autopsy File Analysis module was used to inspect the simulated FAT32
filesystem, recovered files, timestamps, and metadata.

## Image examined

- Image: `infected_disk.dd`
- Filesystem: FAT32
- Partition range: sectors 63 to 102374
- Case: `INFECTED_DISK_LAB`
- Host: `INFECTED_PC`

## Observed entries

The File Analysis view displayed filesystem structures and synthetic
evidence-related entries, including:

- `$FAT1`;
- `$FAT2`;
- `$MBR`;
- `.fseventsd/`;
- `backdoor_info.txt`; and
- the `INFECTDISK` volume-label entry.

The analysis processed 13 allocated files and directories.

## Interpretation

The recovered entries demonstrate that Autopsy could parse the synthetic
FAT32 image and expose its filesystem structures and test artifacts.
These entries were created for controlled experimentation and do not
represent a real compromised system.
