# Cyberdelia apps for Homebrew

The official publisher-maintained Homebrew tap for Cyberdelia apps. This is a
third-party tap, maintained independently of the Homebrew project.

## Install Tagcast on macOS

With [Homebrew](https://brew.sh/) installed, run:

```sh
brew install --cask cyberdeliaAI/apps/tagcast
```

Homebrew adds this tap, downloads the matching Apple Silicon or Intel build from
[Tagcast's GitHub releases](https://github.com/cyberdeliaAI/tagcast/releases), checks
its SHA-256 and installs `Tagcast.app` into Applications. Python is included;
there are no additional runtime dependencies. The included `tagcast-cli` command
is also linked into Homebrew's bin directory.

Open **Tagcast** from Applications. Since 0.60.0 it opens in its own Electron
desktop window, using the same Python server and editor/player as the browser
version. macOS 13 Ventura or newer is required. No separate browser, Python
or Node.js installation is required. For terminal/browser use:

```sh
tagcast-cli --open
```

Starting with 1.2.0, Tagcast's Apple Silicon and Intel downloads are Developer ID
signed and notarized by Apple. The signature, stapled notarization ticket and
Gatekeeper assessment are verified after extraction before publication. Homebrew
checks the published archive's SHA-256 and retains macOS security checks.

If you already installed Tagcast manually, stop it and move your existing
`/Applications/Tagcast.app` aside before installing with Homebrew. Do not use
`--force` to overwrite an existing app. Settings and sign-in tokens are stored
separately in `~/.tagcast/`, or the directory selected by `TAGCAST_HOME`.

## Install Rockbox Library Manager on macOS

```sh
brew install --cask cyberdeliaAI/apps/rockbox-library-manager
```

Homebrew selects the Apple Silicon or Intel archive from
[Rockbox Library Manager releases](https://github.com/cyberdeliaAI/rockbox-library-manager/releases),
verifies its SHA-256 and installs **Rockbox Library Manager.app** in Applications.
Python and Tk are bundled. The included `rockbox-library-manager` CLI is linked
into Homebrew's bin directory:

```sh
rockbox-library-manager --version
rockbox-library-manager artwork --help
```

FFmpeg is optional and separate for audio conversion; scanning and artwork work
without it. Select the FFmpeg executable in the application's Settings when needed.

The app is not Developer ID signed or notarized. Homebrew does not bypass
Gatekeeper; if macOS blocks the first launch, review the download and use
**System Settings → Privacy & Security → Open Anyway**.

If you installed the app manually, quit it and move the existing
`/Applications/Rockbox Library Manager.app` aside before installing with Homebrew.
Do not use `--force` to overwrite it. Settings, credentials, the library index and
thumbnails keep their existing separate locations.

Stable Rockbox Library Manager releases update this cask automatically after
the native release downloads are published. The application's **Update Homebrew
tap** workflow downloads and verifies both macOS archives and their checksums,
tests the candidate installation and GUI/CLI on both architectures, then commits
the verified version and hashes here. It uses a dedicated tap deploy key only
in the final publishing job; the private key is stored as an Actions secret in
the application repository. Prereleases, downgrades and stale cask edits are
refused. The existing Tagcast release process is unchanged.

Quit the app before updating:

```sh
brew update
brew upgrade --cask cyberdeliaAI/apps/rockbox-library-manager
```

To remove the app and CLI link:

```sh
brew uninstall --cask cyberdeliaAI/apps/rockbox-library-manager
```

Uninstalling preserves settings, credentials, the library index, music files
and backups. No `zap` cleanup is defined.

## Update Tagcast

Quit Tagcast before upgrading, or stop a terminal server with Ctrl+C. Electron
reuses only the matching application version; an older server must be closed first.

```sh
brew update
brew upgrade --cask cyberdeliaAI/apps/tagcast
```

An app release becomes available through Homebrew after its cask version and
checksums have been updated in this tap.

## Uninstall Tagcast

Stop Tagcast, then run:

```sh
brew uninstall --cask cyberdeliaAI/apps/tagcast
```

This removes the app and CLI link. It keeps your settings, tokens, cache and
history. Tagcast does not modify your local music files.

## Install ibfetch

For the standalone Mac app (Apple Silicon or Intel) and bundled `ibfetch-cli`:

```sh
brew install --cask cyberdeliaAI/apps/ibfetch
```

For the Python/browser and CLI version on macOS or Linux:

```sh
brew install --formula cyberdeliaAI/apps/ibfetch
ibfetch
```

The formula installs Python and provides `ibfetch`. The cask includes Python and
provides `ibfetch-cli`; both can coexist. Open **ibfetch** from Applications for
the standalone window. Quit it before upgrading with the corresponding
`brew upgrade --cask` or `brew upgrade --formula` command. Uninstall with the
matching flags; music, settings and sign-in records are preserved.

Mac builds are ad-hoc signed, without Developer ID signing or notarization.
Homebrew does not bypass Gatekeeper. Review the download and, if needed, use
**System Settings > Privacy & Security > Open Anyway** for this app.

For Windows, Linux desktop or Python without Homebrew, use
[ibfetch releases](https://github.com/cyberdeliaAI/ibfetch/releases/latest).
The [ibfetch README](https://github.com/cyberdeliaAI/ibfetch#readme) explains file
metadata limitations, NAS output, work folders and safe resume.

## Available apps

| Cask | Description | Platforms |
| --- | --- | --- |
| `ibfetch` | Selective iBroadcast downloader; desktop cask and Python/browser formula | macOS Apple Silicon/Intel; formula also Linux |
| `tagcast` | Metadata editor and album player for iBroadcast | macOS, Apple Silicon and Intel |
| `rockbox-library-manager` | Music library, artwork and tag manager for Rockbox and PodBox | macOS, Apple Silicon and Intel |

For Windows and Linux, use the standalone downloads for
[Tagcast](https://github.com/cyberdeliaAI/tagcast/releases/latest) or
[Rockbox Library Manager](https://github.com/cyberdeliaAI/rockbox-library-manager/releases/latest).

## Maintain this tap

Rockbox Library Manager is handled by its automatic release workflow. For a
retry, run **Update Homebrew tap** on `main` in the application repository;
optionally enter the current latest stable tag. An unchanged manual run still
tests installation and publishing access without creating a release or commit.
See its [publishing guide](https://github.com/cyberdeliaAI/rockbox-library-manager/blob/main/docs/native-builds.md#automatic-homebrew-publishing)
for verification, concurrent-edit protection and deploy-key rotation.

For Tagcast or a manual recovery after publishing both macOS archives:

1. Download both archives and their `.sha256` companion files from that release.
2. Verify the actual downloads with `shasum -a 256` against the companion files.
3. Update `version` and both `sha256` values in the corresponding `Casks/<token>.rb`. Keep versioned
   download URLs; never replace the hashes with `:no_check`.
4. Run `brew style Casks/*.rb` and
   `brew audit --cask --skip-style --arch all cyberdeliaAI/apps/<token>`.
5. Test installation and the app/CLI with temporary settings, then commit the
   cask update. CI checks the cask style and definition.

Each cask uses GitHub's latest stable release for `brew livecheck`. It does not
silently update its version or checksums, and it never disables Gatekeeper or
removes quarantine attributes.

Add other apps as separate files in `Casks/`, each with its own verified release
downloads. Report application issues in the
[Tagcast repository](https://github.com/cyberdeliaAI/tagcast/issues), the
[ibfetch repository](https://github.com/cyberdeliaAI/ibfetch/issues) or the
[Rockbox Library Manager repository](https://github.com/cyberdeliaAI/rockbox-library-manager/issues).

## License

The tap definitions and documentation are MIT licensed. Applications retain
their own licenses: Tagcast and ibfetch are MIT licensed; Rockbox Library Manager is
GPL-2.0-only. Application licenses and bundled dependency notices are included
in their downloads.

### Maintain ibfetch

Publish and verify both Mac archives and the Python ZIP before updating
`Casks/ibfetch.rb` and `Formula/ibfetch.rb`. Keep exact SHA-256 values and versioned
URLs. Run `brew style Casks/ibfetch.rb Formula/ibfetch.rb`, audit both definitions,
and test installation with temporary ibfetch settings. Update this tap after each
stable release; no automatic deploy key is configured for ibfetch.
