# Drone-Forensics
# Autopsy Drone-Forensics Experiment

This repository documents a controlled Autopsy experiment for examining a
simulated FAT32 disk image representing drone storage.

The repository contains the installation procedure, troubleshooting
notes, synthetic dataset description, disk-image preparation steps,
Autopsy case configuration, screenshots, exported outputs, and
experimental findings.

## Important limitation

The dataset is synthetic. Files such as `malware_log.txt`,
`backdoor_info.txt`, and `stolen_data.txt` were deliberately created for
testing. The results demonstrate forensic-analysis capability and do not
prove a real malware infection, data exfiltration, or cyberattack.

## Experiment summary

The experiment used:

- A simulated 50-MB raw disk image named `infected_disk.dd`.
- A FAT32 filesystem.
- Autopsy Forensic Browser.
- The Sleuth Kit forensic-analysis engine.
- A case named `INFECTED_DISK_LAB`.
- A host named `INFECTED_PC`.

The experiment tested:

- Filesystem artifact recovery.
- File-content and metadata inspection.
- Keyword searching.
- File-signature analysis.
- Detection of a JPEG-extension/HTML-content mismatch.
- Reconstruction of a simulated artifact timeline.

## Main findings

Autopsy recognized the FAT32 partition and recovered the simulated
artifacts. File Type Sorter identified an inconsistency in which a file
with a JPEG extension contained HTML data. Keyword searches were used to
locate the terms `malware`, `backdoor`, and `password`.

These results apply only to the controlled synthetic dataset.

## Repository structure

```text
autopsy-drone-forensics/
├── README.md
├── docs/
├── scripts/
├── data/
├── screenshots/
├── outputs/
└── paper/
```

See the files in `docs/` for installation, dataset, procedure,
troubleshooting, and findings documentation.

## Reproduction overview

1. Install the required software.
2. Create or obtain the synthetic artifacts.
3. Create the raw disk image.
4. Format and populate the image as FAT32.
5. Create the Autopsy case and host.
6. Add the image as a data source.
7. Run File Analysis, File Type Sorter, and Keyword Search.
8. Save screenshots and exported outputs.
9. Record hashes and software versions.

## Reproducibility

The repository records both successful steps and installation failures.
Exact software versions, command output, screenshots, and hashes should
be preserved whenever available.


