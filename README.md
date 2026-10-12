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

Open **Tagcast** from Applications. Its local server starts and opens the browser
by default. Untick **Open browser automatically** in the launcher when using
Unite or another app wrapper. For terminal use:

```sh
tagcast-cli --open
```

Tagcast is not Developer ID signed or notarized. Homebrew installation does not
remove macOS Gatekeeper checks. If the first launch is blocked, review the
download and use **System Settings → Privacy & Security → Open Anyway**.

If you already installed Tagcast manually, stop it and move your existing
`/Applications/Tagcast.app` aside before installing with Homebrew. Do not use
`--force` to overwrite an existing app. Settings and sign-in tokens are stored
separately in `~/.tagcast/`, or the directory selected by `TAGCAST_HOME`.

## Update

Stop Tagcast before upgrading. Otherwise the new launcher can reuse the old
server that is still running.

```sh
brew update
brew upgrade --cask cyberdeliaAI/apps/tagcast
```

An app release becomes available through Homebrew after its cask version and
checksums have been updated in this tap.

## Uninstall

Stop Tagcast, then run:

```sh
brew uninstall --cask cyberdeliaAI/apps/tagcast
```

This removes the app and CLI link. It keeps your settings, tokens, cache and
history. Tagcast does not modify your local music files.

## Available apps

| Cask | Description | Platforms |
| --- | --- | --- |
| `tagcast` | Metadata editor and album player for iBroadcast | macOS, Apple Silicon and Intel |

For Windows and Linux, use [Tagcast's standalone downloads](https://github.com/cyberdeliaAI/tagcast/releases/latest).

## Maintain this tap

After publishing a stable Tagcast release with both macOS archives:

1. Download both archives and their `.sha256` companion files from that release.
2. Verify the actual downloads with `shasum -a 256` against the companion files.
3. Update `version` and both `sha256` values in `Casks/tagcast.rb`. Keep versioned
   download URLs; never replace the hashes with `:no_check`.
4. Run `brew style Casks/tagcast.rb` and
   `brew audit --cask --skip-style --arch all cyberdeliaAI/apps/tagcast`.
5. Test installation and the app/CLI with temporary settings, then commit the
   cask update. CI checks the cask style and definition.

The cask uses GitHub's latest stable release for `brew livecheck`. It does not
silently update its version or checksums, and it never disables Gatekeeper or
removes quarantine attributes.

Add other apps as separate files in `Casks/`, each with its own verified release
downloads. Report Tagcast application issues in the
[Tagcast repository](https://github.com/cyberdeliaAI/tagcast/issues).

## License

The tap definitions and documentation are MIT licensed. Applications retain
their own licenses; Tagcast and its bundled dependency notices are included in
its downloads.
