homebrew-tools
================

Homebrew Tap for Clojure

## Why this tap?

Using a Clojure-specific tap (vs the homebrew core tap) allows the Clojure team to retain full control over the Clojure formula, the timing of releases, and an archive of old versions. 

This tap is the source of the official Clojure brew formula. The Clojure formula on homebrew-core is not the official formula and is likely to be out of date.

## Clojure tools version

The Clojure tools (`clj`/`clojure`) use a versioning scheme CLOJURE_VERSION.COMMITS (like "1.10.1.507"). The Clojure version is a prefix of the Clojure tools version for three reasons:

1. It is a relative indicator of the general age of the tools release.
2. It is the version of Clojure used by the tools themselves to compute classpaths.
3. If you do not specify a Clojure version in your dependencies (or don't have a deps.edn file), this is the version of Clojure that will be used.

Importantly though, your own deps.edn file controls the version of Clojure that your program, library, or REPL will use! **ANY version of Clojure can be used with ANY version of the Clojure tools**.

## Install

There are three different installation use cases supported by this tap - stable tool releases, dev tool releases, and version archive tool releases.

### Stable Tool Releases

Most users should use a stable release, defined by the `clojure` formula. In general, the stable version will be updated every 2-3 months.

To install/upgrade/uninstall the stable Clojure tools from the Clojure tap:

```
brew install clojure/tools/clojure
brew upgrade clojure/tools/clojure
brew uninstall clojure
```

### Development Tool Releases

Dev releases are for users that want the very newest release of the Clojure tools. These may be updated as frequently as multiple times per week during active periods.

To install/uninstall the development Clojure tools from the Clojure tap:

```
brew install --head clojure/tools/clojure
brew uninstall clojure
```

### Version Archive Tool Releases

Occasionally it may be useful to install a specific version of the Clojure tools. In this case, you can use the archive of @ versions. Note that you cannot install both the stable or dev version AND a specific named version - these will conflict. You must `brew uninstall clojure/tools/clojure` first before installing a specific versions. There are various cases where you may still have uninstalled but linked versions - in those cases `brew` will give you helpful errors and tell you what to do.

To install/uninstall a versioned Clojure tools from the Clojure tap:

```
brew install clojure/tools/clojure@1.10.1.502
brew uninstall clojure@1.10.1.502
```

## Use

Please see the following docs on how to use the `clj` and `clojure` scripts:

* [Getting Started](https://clojure.org/guides/getting_started)
* [Deps and CLI guide](https://clojure.org/guides/deps_and_cli)
* [Deps and CLI reference](https://clojure.org/reference/deps_and_cli)

