## :tada: XNeovim :tada: - Vim for Xcode

### :warning: WIP - This doesn't work yet. :warning:

A :large_orange_diamond:Swift replacement for [XVim](https://github.com/XVimProject/XVim) using [neovim](https://neovim.io) [headless](https://neovim.io/doc/user/api.html#api) as a backend.

### Requirements
- Xcode 9+ (For older Xcode versions use [XVim](https://github.com/XVimProject/XVim))
- Neovim ([Installation instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim#macos--os-x))

### Installation
Due to [plugins being disabled in Xcode 8+](https://github.com/alcatraz/Alcatraz/issues/475) in response to [XcodeGhost](https://en.wikipedia.org/wiki/XcodeGhost), installation is a little more involved.

**You must unsign Xcode to enable loading plugins. This has some security risks.**

1. Download [MakeXcodeGr8Again](https://github.com/fpg1503/MakeXcodeGr8Again)
2. Follow the MakeXcodeGr8Again instructions.
3. Download/clone this repository, open `XNeovim.xcproject` and build. This will install the plugin.
4. Open XcodeGr8.app
5. A dialog will appear asking if you want to load unexpected bundles. Click `Load Bundles`.
6. You can confirm the plugin installed/loaded if the Edit -> :electric_plug: XNeovim menu exists.
7. Done! :tada:

*:see_no_evil: If you accidentally chose Ignore Bundles in step 5, you can make Xcode ask again by running:*

`defaults delete com.apple.dt.Xcode DVTPlugInManagerNonApplePlugIns-Xcode-9.0`

### Uploading Apps to TestFlight/AppStore
Use the original Xcode.app signed by Apple (without plugins) to upload builds. It's not required, but is more secure.

### Usage
TODO

### Roadmap
- [ ] Connect the new Xcode source editor to Neovim headless
- [ ] Powerline-like status bar showing current vim mode
- [ ] Add commands for switching between primary/assistant editor (bn/bN)?
- [ ] Add commands for switching between tabs (gt/gT)?
- [ ] Add commands for navigating between issues/warnings/errors?
- [ ] Add commands for navigating between breakpoints?
- [ ] Add commands for navigating between `// MARK:`s?
- [ ] Add commands for snippets?
- [ ] Add command for running a fixit?
- [ ] ex commands for various Xcode tasks (:build, :run, :git, etc.)?
- [ ] ex commands for fastlane (:fastlane beta, :fastlane release, etc.)?
- [ ] Add `:terminal` support?
- [ ] Playgrounds support?
- [ ] Relative line numbers
- [ ] Option to load nvim with plugins?
- [ ] Something like [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)/'Open Quickly' to fuzzy find/open files in a project

### Contributing
#### Getting started
- Clone the repo
- This plugin expects XcodeGr8.app to be in `/Applications`. The scheme is hard coded to run/debug using that app.
- Xcode 9 is required to build the plugin. It will compile on Xcode 8, but it won't work! Don't be fooled (and waste a lot of time trying to figure out why the plugin isn't loading properly).
- There are many print statements throughout the plugin, which you can see in the Xcode debugging console.

#### Adding support for new Xcode versions
When new Xcode versions are released, it is required that the new Xcode.app/Xcode-beta.app UUID be added to `Sources/info.plist` in the `DVTPlugInCompatibilityUUIDs` key.

The new UUID can be looked up with:
```
defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
```
#### Adding new commands
TODO

### Questions?
Please open an issue or ask on Twitter [@rudedoggtweets](https://twitter.com/rudedoggtweets)

### License (MIT)
Copyright (c) 2017 Austin Rude

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
