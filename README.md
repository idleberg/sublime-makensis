# sublime-makensis

[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Package Control](https://packagecontrol.herokuapp.com/downloads/makensis.svg?style=flat-square)](https://packagecontrol.io/packages/makensis)
[![GitHub](https://img.shields.io/github/release/idleberg/sublime-makensis.svg?style=flat-square)](https://github.com/idleberg/sublime-makensis/releases)
[![Travis CI](https://img.shields.io/travis/idleberg/sublime-makensis.svg?style=flat-square)](https://travis-ci.org/idleberg/sublime-makensis)
[![Gitter](https://img.shields.io/badge/chat-Gitter-ed1965.svg?style=flat-square)](https://gitter.im/NSIS-Dev/SublimeText)

Advanced [Sublime Text](http://www.sublimetext.com/) build system to compile NSIS scripts, supporting Windows, macOS and Linux.

## Installation

### Package Control

1. Make sure you already have [Package Control](https://packagecontrol.io/) installed
2. Choose *“Install Package”* from the Command Palette (<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>)
3. Type *“makensis”* and press <kbd>Enter</kbd>

With [auto_upgrade](http://wbond.net/sublime_packages/package_control/settings/) enabled, Package Control will keep all installed packages up-to-date!

### Using Git

1. Change to your Sublime Text `Packages` directory
2. Clone repository `git clone https://github.com/idleberg/sublime-makensis.git makensis`

## Setup

### Windows

Download the NSIS installer from [SourceForge](https://sourceforge.net/p/nsis) and run setup. Make sure `makensis` is in your [PATH environmental variable][path].

Alternatively, you can install NSIS through [Chocolatey](https://chocolatey.org/packages/nsis):

``` bash
choco install nsis
```

### Linux

Install NSIS from your distribution's default package manager, for example:

``` bash
# Debian
sudo apt-get install nsis

# Red Hat
sudo dnf install nsis
```

### macOS

Install NSIS using [Homebrew](http://brew.sh/) (recommended) or [MacPorts](https://www.macports.org/):

``` bash
# Homebrew
brew install nsis

# MacPorts
port install nsis
```

## Usage

When using the [NSIS package](https://github.com/SublimeText/NSIS), you will have to switch the default build system

    Tools > Build Systems > makensis

Use the default shortcut <kbd>Super</kbd>+<kbd>b</kbd> to build scripts or <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>b</kbd> to choose a build variant.

Available variants:

* makensis¹
* makensis - strict¹ ²
* makensis - Wine³
* makensis - Wine, strict² ³
* makensis - Legacy Windows
* makensis - Legacy Windows, strict²

¹⁾ requires PowerShell 3.0 (Windows 8 or later)  
²⁾ treats warnings as errors, requires NSIS 3.0  
³⁾ requires [Wine](https://www.winehq.org/)  

**Note:** Microsoft has [recently announced](https://blogs.windows.com/windowsexperience/2016/11/17/announcing-windows-10-insider-preview-build-14971-for-pc/) its plans to slowly deprecate `cmd.exe` in favour of PowerShell. In the long-term, the PowerShell build variants are meant to replace the old batch files. Until then, please report any [issues](https://github.com/idleberg/sublime-makensis/issues).

## License

This work is licensed under the [The MIT License](LICENSE).

## Donate

You are welcome support this project using [Flattr](https://flattr.com/submit/auto?user_id=idleberg&url=https://github.com/idleberg/sublime-makensis) or Bitcoin `17CXJuPsmhuTzFV2k4RKYwpEHVjskJktRd`
