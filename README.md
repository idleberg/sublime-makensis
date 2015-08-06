# sublime-makensis

Improved [Sublime Text](http://www.sublimetext.com/) build system to compile NSIS scripts, supporting Windows, Mac OS X and Linux.

## Installation

### Package Control

1. Make sure you already have [Package Control](http://wbond.net/sublime_packages/package_control/) installed
2. Choose *Install Package* from the Command Palette (<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>)
3. Select *makensis* and press <kbd>Enter</kbd>

With [auto_upgrade](http://wbond.net/sublime_packages/package_control/settings/) enabled, Package Control will keep all installed packages up-to-date!

### GitHub

1. Change to your Sublime Text `Packages` directory
2. Clone repository `git clone https://github.com/idleberg/sublime-makensis.git makensis`

## Usage

On Unix systems, you might have to make the build script executable:

```bash
# cd to Sublime Text/Packages/makensis
chmod +x makensis.sh
```

When using the NSIS package, you will have to switch the default build system

    Tools > Build Systems > makensis

Use the default shortcut <kbd>Cmd</kbd>+<kbd>b</kbd> to build scripts.

## Donate

You are welcome support this project using [Flattr](https://flattr.com/submit/auto?user_id=idleberg&url=https://github.com/idleberg/sublime-makensis) or Bitcoin `17CXJuPsmhuTzFV2k4RKYwpEHVjskJktRd`
