# Drone-Forensics
# Autopsy Drone-Forensics Experiment

This directory documents a controlled forensic-analysis experiment
performed using Autopsy Forensic Browser. The experiment examined a
simulated FAT32 disk image representing drone-storage evidence.

The documentation records the software installation, troubleshooting,
synthetic dataset, disk-image preparation, Autopsy case configuration,
analysis procedure, screenshots, outputs, and findings.

## Important limitation

The disk image and artifacts used in this experiment are synthetic.
They were deliberately created for testing and do not represent a real
malware infection, real data exfiltration, or a confirmed cyberattack.

The findings demonstrate the capabilities of the Autopsy workflow under
controlled conditions.

## Experiment environment

The experiment was conducted on:

- Apple MacBook Air with Apple Silicon/M2.
- macOS.
- Autopsy Forensic Browser version 2.24.
- The Sleuth Kit as the forensic-analysis backend.
- Homebrew and Unix command-line utilities.

The exact software-version output, where available, is stored in:

```text
outputs/environment/software-versions.txt
```

## Installation

### Initial installation problem

The first attempt to build The Sleuth Kit from source failed with:

```text
./bootstrap: line 3: aclocal: command not found
Unable to build Sleuthkit.
```

The error occurred because Automake was not installed. The `aclocal`
command is provided by Automake. Libtool and Java were also required for
the installation process.

### Required prerequisites

The required Homebrew packages were installed with:

```bash
brew install automake libtool
brew install openjdk@17
```

Java 17 was selected using:

```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
echo "JAVA_HOME=$JAVA_HOME"
```

The tools can be checked with:

```bash
which aclocal
automake --version
libtoolize --version
java --version
```

### Sleuth Kit installation attempt

The source-build command used for The Sleuth Kit was:

```bash
cd ~/autopsy-4.21.0

bash linux_macos_install_scripts/install_tsk_from_src.sh \
  -p ~/src/sleuthkit \
  -b sleuthkit-4.11.1
```

An additional attempt to run the Autopsy installation script produced:

```text
bash: install_application.sh: No such file or directory
```

This indicated that the script was not located in the assumed directory.
The actual location can be checked with:

```bash
find ~/autopsy-4.21.0 -name 'install_application.sh'
```

The installation troubleshooting record is available in:

```text
docs/troubleshooting.md
```

### Shell troubleshooting

During installation, the Terminal displayed:

```text
quote>
```

This indicated that an incomplete quoted command had been entered.
The command was cancelled with:

```text
Ctrl+C
```

Commands were then entered one at a time without mixing explanatory
labels with shell commands.

## Dataset description

The experiment used a synthetic raw disk image named:

```text
infected_disk.dd
```

The disk image was created specifically for this experiment and
represented simulated drone-storage evidence.

| Property | Value |
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

The initial raw image was created using a command equivalent to:

```bash
dd if=/dev/zero of=infected_disk.dd bs=1m count=50
```

The image was subsequently formatted as FAT32 and populated with
synthetic evidence artifacts.

## Synthetic artifacts

The following files were placed in the simulated disk image:

| File | Purpose |
|---|---|
| `backdoor_info.txt` | Simulated backdoor-related record |
| `malware_log.txt` | Simulated malware-activity log |
| `stolen_data.txt` | Simulated credential or stolen-data record |
| `sample_image.jpg` | Simulated file-masquerading test artifact |

The file with the JPEG extension was intentionally created with HTML
content. This allowed the File Type Sorter to demonstrate a mismatch
between a filename extension and the detected file content.

## Autopsy case configuration

The image was ingested into Autopsy with the following configuration:

```text
Case: INFECTED_DISK_LAB
Host: INFECTED_PC
Image: infected_disk.dd
Image type: Disk
Import method: Symlink
Image identifier: img1
Disk-image identifier: vol1
Volume identifier: vol2
Filesystem: FAT32
Mount point: C:/
```

The screenshots documenting this process are stored in:

```text
screenshots/
```

## Analysis procedure

The experiment followed these steps:

1. Autopsy was opened through the local Autopsy interface.
2. A case named `INFECTED_DISK_LAB` was created.
3. A host named `INFECTED_PC` was created.
4. The raw image `infected_disk.dd` was added as a disk image.
5. The image was imported using the symbolic-link method.
6. Autopsy calculated the image MD5 hash.
7. The FAT32 partition was identified.
8. File Analysis was used to inspect the filesystem and recovered files.
9. File Type Sorter was used to compare file extensions with file signatures.
10. Keyword Search was used to search for `malware`, `backdoor`, and `password`.
11. The recovered artifacts and timestamps were used to construct a simulated timeline.

## Integrity and partition results

Autopsy displayed the following MD5 value during image ingestion:

```text
C63D5960E53FDA922F96791A10DED77F
```

This value should be treated as the recorded result of the experiment and
verified against the original screenshot before reuse.

The partition analysis reported:

```text
Partition type: Win95 FAT32 (0x0B)
Start sector: 63
End sector: 102374
Filesystem: FAT32
```

## Analysis results

### File Analysis

The File Analysis view displayed filesystem structures and synthetic
evidence-related files, including:

- `$FAT1`;
- `$FAT2`;
- `$MBR`;
- `.fseventsd/`;
- `backdoor_info.txt`; and
- the volume-label entry.

### File Type Sorter

File Type Sorter processed 13 allocated files and directories. The
recorded summary included:

- 13 processed files and directories.
- One extension mismatch.
- Five text-category files.
- Two compressed/system structures.
- Zero recognized image-category files.

The principal finding was:

```text
A file with a JPEG extension contained HTML data.
```

This is a simulated file-masquerading result and not evidence of a
real-world attack.

### Keyword Search

The selected search terms were:

```text
malware
backdoor
password
```

The expected associations were:

| Keyword | Associated synthetic file |
|---|---|
| `malware` | `malware_log.txt` |
| `backdoor` | `backdoor_info.txt` |
| `password` | `stolen_data.txt` |

### Timeline reconstruction

The timestamps and contents of the synthetic artifacts were correlated
to construct a simulated artifact timeline.

This timeline represents the order of deliberately created test
artifacts. It should not be interpreted as a confirmed real-world
attack timeline.

## Repository structure

```text
autopsy/
├── README.md
├── data/
│   ├── README.md
│   ├── hashes/
│   └── sample_artifacts/
├── docs/
│   ├── dataset-description.md
│   ├── experiment-procedure.md
│   ├── findings.md
│   ├── installation.md
│   └── troubleshooting.md
├── outputs/
│   ├── environment/
│   ├── file-analysis/
│   ├── file-type-sorter/
│   ├── keyword-search/
│   ├── reports/
│   └── timeline/
├── screenshots/
└── scripts/
    ├── create_disk_image.sh
    ├── populate_artifacts.sh
    └── verify_hash.sh
```

## Screenshots

The `screenshots/` directory contains evidence of the experiment:

- `01-autopsy-home-screen.jpg`: Autopsy Forensic Browser home screen.
- `02-case-host-creation.jpg`: Case and host creation.
- `03-add-image-file.jpg`: Add Image File screen.
- `04-image-details-partition.jpg`: Image details and FAT32 partition information.
- `05-image-ingestion-md5-output.jpg`: MD5 calculation and image identifiers.
- `06-ingested-image-volume-list.jpg`: Ingested image and recognized FAT32 volume.
- `07-file-analysis-results.jpg`: File Analysis view.
- `08-file-type-sorter-summary.jpg`: File Type Sorter results.

## Reproducibility

To reproduce the experiment:

1. Install the documented dependencies.
2. Create the synthetic artifacts.
3. Create a 50-MB raw disk image.
4. Format the image as FAT32.
5. Populate the image with the synthetic artifacts.
6. Create the Autopsy case and host.
7. Add the image as a disk data source.
8. Run the documented analysis modules.
9. Save screenshots and exported reports.
10. Record the software versions and image hash.

The repository records installation failures as well as successful
analysis steps so that the process remains transparent.

## Ethical note

Do not upload real seized evidence, private flight logs, passwords,
personal information, or confidential case data. Use only synthetic or
legally distributable evidence.

