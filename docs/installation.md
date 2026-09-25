# Installation

## Environment

The experiment was performed on:

- Apple MacBook Air with Apple Silicon/M2.
- macOS.
- Homebrew.
- Autopsy Forensic Browser.
- The Sleuth Kit.

Record the exact versions in
`outputs/environment/software-versions.txt`.

## Initial build error

The first Sleuth Kit build failed with:

```text
./bootstrap: line 3: aclocal: command not found
Unable to build Sleuthkit.
```

The cause was that Automake was not installed. The `aclocal` command is
provided by Automake.

## Required prerequisites

```bash
brew install automake libtool
brew install openjdk@17
```

Set Java 17:

```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
echo "JAVA_HOME=$JAVA_HOME"
```

Verify the tools:

```bash
which aclocal
automake --version
libtoolize --version
java --version
```

Save the output to:

```text
outputs/environment/software-versions.txt
```

## Source-build attempt

The attempted Sleuth Kit installation used:

```bash
cd ~/autopsy-4.21.0

bash linux_macos_install_scripts/install_tsk_from_src.sh \
  -p ~/src/sleuthkit \
  -b sleuthkit-4.11.1
```

An attempt to run `install_application.sh` produced:

```text
bash: install_application.sh: No such file or directory
```

This occurred because the script was not available at the assumed path.
The actual script location should be checked with:

```bash
find ~/autopsy-4.21.0 -name 'install_application.sh'
```

## Shell issue

The Terminal displayed:

```text
quote>
```

This means that an unfinished quoted command was entered. Press:

```text
Ctrl+C
```

to cancel it and return to the normal shell prompt.

Commands should be entered one at a time. Do not paste labels such as
`bash`, `Step 1`, or explanatory sentences into Terminal.

## Record actual success

Only document an installation as successful after confirming that:

- Autopsy opens.
- A new case can be created.
- A data source can be added.
- The disk image can be analyzed.
- The expected Autopsy modules are available.
