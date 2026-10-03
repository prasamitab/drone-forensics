# Autopsy Installation Troubleshooting

This document records the installation problems encountered while
setting up the Autopsy experiment on an Apple MacBook Air with Apple
Silicon/M2.

## 1. `aclocal: command not found`

### Error

The initial attempt to build The Sleuth Kit failed with:

```text
./bootstrap: line 3: aclocal: command not found
Unable to build Sleuthkit.
```

### Cause

The `aclocal` command is provided by GNU Automake. Automake was not
installed when the source build was attempted.

### Prerequisite installation

The required build tools were installed using Homebrew:

```bash
brew install automake libtool
```

Java 17 was also installed:

```bash
brew install openjdk@17
```

The Java environment was configured with:

```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
echo "JAVA_HOME=$JAVA_HOME"
```

The tools can be checked using:

```bash
which aclocal
automake --version
libtoolize --version
java --version
```

### Lesson

The required build dependencies should be installed before running the
Sleuth Kit source-build script.

## 2. Sleuth Kit source-build command

The attempted source-build command was:

```bash
cd ~/autopsy-4.21.0

bash linux_macos_install_scripts/install_tsk_from_src.sh \
  -p ~/src/sleuthkit \
  -b sleuthkit-4.11.1
```

This script was intended to download and build the required Sleuth Kit
components.

The exact build result should be recorded from the terminal output. Do
not describe the build as successful unless the installation completed
without errors and Autopsy was able to use the installed components.

## 3. `install_application.sh: No such file or directory`

### Error

An attempt to run the Autopsy application installation script produced:

```text
bash: install_application.sh: No such file or directory
```

### Cause

The command was executed from a directory that did not contain the
script, or the downloaded Autopsy source package had a different
directory structure from the one assumed.

### Locate the script

Use:

```bash
find ~/autopsy-4.21.0 -name 'install_application.sh'
```

Also locate the Sleuth Kit installation script:

```bash
find ~/autopsy-4.21.0 -name 'install_tsk_from_src.sh'
```

Run a script only after confirming its actual path.

## 4. Shell prompt showing `quote>`

### Problem

The Terminal displayed:

```text
quote>
```

### Cause

The shell was waiting for the closing quotation mark of an incomplete
quoted command.

This can happen when a command is pasted with an unmatched single quote
or double quote.

### Solution

Cancel the incomplete command:

```text
Ctrl+C
```

Then return to the normal shell prompt and enter the command again.

## 5. Do not paste explanations as commands

Only shell commands should be entered into Terminal. Do not paste labels
such as:

```text
Step 1:
bash
Install Java 17
```

Do not paste explanatory text as though it were a command.

Comments beginning with `#` are valid in shell scripts, but entering a
large mixture of comments, labels, and commands interactively can make
errors difficult to identify. The safest approach is to enter one
command at a time.

## 6. Verify the working directory

Before running an installation script, confirm the current directory:

```bash
pwd
ls
```

For the Autopsy source directory:

```bash
cd ~/autopsy-4.21.0
pwd
ls
```

Confirm that the expected script exists before executing it:

```bash
test -f linux_macos_install_scripts/install_tsk_from_src.sh \
  && echo "Sleuth Kit script found" \
  || echo "Sleuth Kit script not found"
```

## 7. Homebrew installation alternative

A Homebrew-based installation was also considered:

```bash
brew install automake libtool openjdk@17
brew install sleuthkit
brew install autopsy
```

This method should be documented as successful only if it was actually
used successfully and Autopsy opened with the required functionality.

Different package versions may not exactly match the source version used
in the experiment.

## 8. Evidence of successful setup

The installation should be considered operational only after confirming
that:

- Autopsy opens successfully.
- A new case can be created.
- A host can be created.
- `infected_disk.dd` can be added.
- The FAT32 partition is recognized.
- File Analysis can be opened.
- File Type Sorter can process the image.
- Keyword Search can be executed.

The screenshots documenting the successful Autopsy workflow are stored
in:

```text
autopsy/screenshots/
```

## 9. Installation limitation

The repository records both successful steps and failed attempts.
The `aclocal` and `install_application.sh` errors are retained for
transparency and reproducibility.

These troubleshooting notes describe the installation process used for
this experiment. They are not intended to claim that every installation
path succeeds on every macOS version or Apple Silicon configuration.
