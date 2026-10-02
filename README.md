# Drone Forensics

This repository contains the experimental materials for a comparative
drone-forensics investigation using Autopsy and FTK Imager.

The project examines how general-purpose digital-forensics tools can
support different stages of a drone-forensics workflow, including
evidence preservation, forensic acquisition, filesystem examination,
file-signature analysis, integrity verification, and flight-log
interpretation.

## Project overview

Drone-related evidence may be distributed across multiple sources,
including:

- onboard drone storage;
- removable storage cards;
- flight controllers;
- remote controllers;
- companion mobile applications;
- flight-log files; and
- cloud services.

Because different tools support different evidence types and analysis
stages, this project evaluates Autopsy and FTK Imager as complementary
components of a broader forensic workflow.

The project does not claim that one tool is universally superior to the
other. The two tools were evaluated using different evidence sources and
for different investigative purposes.

## Experiments

### Autopsy experiment

The `autopsy/` directory contains a controlled filesystem-forensics
experiment using a simulated FAT32 disk image representing drone
storage.

The experiment includes:

- installation and troubleshooting documentation;
- creation of a simulated raw disk image;
- FAT32 partition analysis;
- Autopsy case and host configuration;
- filesystem artifact recovery;
- file-content and metadata examination;
- keyword searching;
- file-signature analysis;
- extension/content mismatch detection;
- simulated timeline reconstruction;
- screenshots; and
- exported findings and outputs.

The synthetic image used in the experiment was named:

```text
infected_disk.dd
```

The Autopsy case and host were configured as:

```text
Case: INFECTED_DISK_LAB
Host: INFECTED_PC
```

See [`autopsy/README.md`](autopsy/README.md) for the complete
installation procedure, dataset description, analysis steps, screenshots,
and results.

### FTK Imager experiment

The `ftk-imager/` directory is reserved for the forensic-acquisition and
flight-log-analysis experiment.

It will contain documentation related to:

- preservation of the original flight-log record;
- forensic image acquisition;
- evidence-container creation;
- hash verification;
- confirmation that the expected flight-log file was acquired;
- telemetry-field examination;
- flight-state analysis;
- GPS and altitude analysis; and
- flight-event reconstruction.

The FTK Imager experiment uses a different evidence source from the
Autopsy experiment. Therefore, the results should be interpreted as
complementary rather than as a controlled tool-to-tool benchmark.

## Repository structure

```text
drone-forensics/
├── README.md
├── autopsy/
│   ├── README.md
│   ├── data/
│   │   ├── README.md
│   │   ├── hashes/
│   │   └── sample_artifacts/
│   ├── docs/
│   │   ├── dataset-description.md
│   │   ├── experiment-procedure.md
│   │   ├── findings.md
│   │   ├── installation.md
│   │   └── troubleshooting.md
│   ├── outputs/
│   │   ├── environment/
│   │   ├── file-analysis/
│   │   ├── file-type-sorter/
│   │   ├── keyword-search/
│   │   ├── reports/
│   │   └── timeline/
│   ├── screenshots/
│   └── scripts/
│       ├── create_disk_image.sh
│       ├── populate_artifacts.sh
│       └── verify_hash.sh
└── ftk-imager/
    ├── README.md
    ├── data/
    ├── docs/
    ├── outputs/
    ├── screenshots/
    └── scripts/
```

The `ftk-imager/` directory may be added or completed separately.

## General workflow

The overall forensic workflow followed by this project is:

1. Identify and preserve the available digital evidence.
2. Create a forensic working copy or image.
3. Calculate and record integrity hashes.
4. Ingest the preserved evidence into a forensic tool.
5. Examine filesystems, metadata, timestamps, and file contents.
6. Search for relevant keywords and artifacts.
7. Analyze file signatures and detect inconsistencies.
8. Interpret structured flight-log fields where available.
9. Reconstruct timelines or flight events.
10. Report findings together with limitations and evidentiary context.

## Experimental objectives

The project aims to:

- evaluate filesystem artifact recovery using Autopsy;
- detect mismatches between file extensions and internal content;
- document forensic image acquisition and verification using FTK Imager;
- examine structured drone flight-log fields;
- demonstrate the importance of hash verification and chain of custody;
- preserve screenshots and outputs for reproducibility; and
- illustrate how general-purpose forensic tools can be combined with
  drone-specific analysis methods.

## Autopsy dataset

The Autopsy experiment uses a synthetic raw disk image with the
following characteristics:

| Property | Description |
|---|---|
| Image filename | `infected_disk.dd` |
| Image type | Raw disk image |
| Approximate size | 50 MB |
| Filesystem | FAT32 |
| Partition type | Win95 FAT32 (`0x0B`) |
| Partition start | Sector 63 |
| Partition end | Sector 102374 |
| Case name | `INFECTED_DISK_LAB` |
| Host name | `INFECTED_PC` |

The simulated artifacts include:

- `backdoor_info.txt`;
- `malware_log.txt`;
- `stolen_data.txt`; and
- a file with a JPEG extension whose content was identified as HTML.

The artifacts were created for controlled testing and do not represent
real evidence.

## Main Autopsy findings

The Autopsy experiment demonstrated that:

- the FAT32 partition could be recognized and examined;
- the simulated evidence-related artifacts could be recovered;
- filesystem structures, timestamps, and metadata could be inspected;
- keyword searches could locate selected synthetic terms;
- File Type Sorter could identify an extension/content mismatch; and
- the synthetic artifacts could be arranged into a simulated timeline.

These findings demonstrate analysis capability under controlled
conditions. They do not prove malware execution, persistence, data
exfiltration, or compromise of a real drone.

## Installation and reproducibility

The repository records the installation process and troubleshooting
steps for the Autopsy experiment, including:

- installation of Automake and Libtool;
- Java configuration;
- the `aclocal: command not found` error;
- source-build attempts for The Sleuth Kit;
- the `install_application.sh` path issue; and
- shell errors caused by incomplete quoted commands.

Detailed installation information is available in:

```text
autopsy/docs/installation.md
autopsy/docs/troubleshooting.md
```

Exact software versions, hashes, screenshots, and output files should be
preserved whenever available.

## Screenshots and outputs

Screenshots documenting the Autopsy experiment are stored in:

```text
autopsy/screenshots/
```

They include:

- Autopsy home screen;
- case and host creation;
- image-file ingestion;
- image details and partition information;
- MD5 calculation;
- recognized disk and FAT32 volume;
- File Analysis results; and
- File Type Sorter results.

Analysis outputs are stored in:

```text
autopsy/outputs/
```

## Limitations

The project has the following limitations:

- The Autopsy disk image is synthetic rather than acquired from a
  physical drone.
- The Autopsy and FTK Imager experiments use different evidence sources.
- The experiments do not constitute a controlled performance benchmark.
- Proprietary encrypted telemetry formats were not fully evaluated.
- The experiment does not include a complete physical seizure of a drone,
  controller, mobile device, or cloud account.
- Synthetic timestamps and artifacts cannot establish a real-world
  incident.
- Tool support may vary across manufacturers, drone models, and firmware
  versions.

## Ethical and legal note

Do not upload or distribute:

- real seized evidence;
- personal information;
- credentials or passwords;
- private flight logs;
- confidential case data;
- copyrighted datasets without permission; or
- access tokens and private keys.

Use synthetic or legally distributable data only. Findings must be
interpreted in the context of the evidence source, acquisition method,
validation procedures, and stated limitations.

## Citation

This repository supports the accompanying research paper:

```text
Drone Forensics: A Comparative Investigation Using Autopsy and FTK Imager
```


