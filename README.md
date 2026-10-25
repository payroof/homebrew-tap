# Payroof Homebrew Tap

Install the Payroof tools with [Homebrew](https://brew.sh) on macOS or Linux.

```sh
brew install payroof/tap/payroof   # payment server
brew install payroof/tap/stor      # storefront server (the `stortop` command)
brew install payroof/tap/roofer    # local stack and end-to-end tests
brew install --cask payroof/tap/wallet   # Payroof Wallet for macOS
```

Update with `brew upgrade`.

| Package | What it is | Project |
| --- | --- | --- |
| `payroof` | Watch-only crypto payments with signed webhooks | [payroof/payroof](https://github.com/payroof/payroof) |
| `stor` | Storefronts with exact crypto checkout | [payroof/stor](https://github.com/payroof/stor) |
| `roofer` | Runs the local Payroof stack and its tests | [payroof/roofer](https://github.com/payroof/roofer) |
| `wallet` | Self-custody wallet app for macOS | [payroof/wallet](https://github.com/payroof/wallet) |

Formulae and the cask are generated automatically from each project's latest GitHub release.
