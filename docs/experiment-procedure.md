# Experiment Procedure

## Disk-image preparation

The image was created as a 50-MB raw file using a command equivalent to:

```bash
dd if=/dev/zero of=infected_disk.dd bs=1m count=50
```

The image was formatted as FAT32 and populated with simulated artifacts.
The exact formatting and population commands should be preserved in the
`scripts/` directory if they are available.

## Autopsy case configuration

```text
Case: INFECTED_DISK_LAB
Host: INFECTED_PC
Image: infected_disk.dd
Import method: Symbolic link
Image identifier: img1
Recognized volume: vol2
Filesystem: FAT32
```

## Analysis steps

1. Open Autopsy.
2. Create the case `INFECTED_DISK_LAB`.
3. Create or select the host `INFECTED_PC`.
4. Add `infected_disk.dd`.
5. Select the recognized FAT32 volume.
6. Open Image Details.
7. Run File Analysis.
8. Run File Type Sorter.
9. Run Keyword Search.
10. Record the findings and timestamps.
11. Reconstruct the simulated artifact timeline.
12. Save screenshots and exported outputs.

## Keyword searches

The selected terms were:

```text
malware
backdoor
password
```

Expected associations:

| Keyword | Expected file |
|---|---|
| `malware` | `malware_log.txt` |
| `backdoor` | `backdoor_info.txt` |
| `password` | `stolen_data.txt` |
