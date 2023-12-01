homebrew-tools - Homebrew Tap for Clojure
================

This tap contains the formula for the Clojure CLI. Most of the time, you should probably not be here at all and should instead follow the instructions on the [CLI Install Guide](https://clojure.org/guides/install_clojure).

## Why is there a Clojure-specific tap?

The Clojure-specific tap (vs the homebrew-core tap) gives the Clojure team full control over the Clojure formula, the timing of formula releases, and an archive of old and pre-release versions. 

This tap is the source of the official Clojure brew formula (not the homebrew-core formula). The formulas in this tap and homebrew-central are similar but not identical. In particular, the homebrew-core formula depends on and attempts to update to the latest version of Java. Clojure itself does not require that and the formulas here simply assume you have (somehow) installed Java and put it on your path; they will not install Java for you.

## Clojure CLI versions

The Clojure CLI (`clj` and `clojure`) use a versioning scheme CLOJURE_VERSION.COMMITS (like "1.10.1.507"). The Clojure version is a prefix of the Clojure tools version for three reasons:

1. It is a relative indicator of the general age of the tools release.
2. It is the version of Clojure used by the tools themselves to compute classpaths.
3. If you do not specify a Clojure version in your dependencies (or don't have a deps.edn file), this is the version of Clojure that will be used when running a REPL or a program.

Importantly though, your own deps.edn file controls the version of Clojure that your program, library, or REPL will use! **ANY version of Clojure can be used with ANY version of the Clojure tools**.

## Install

When installing the Clojure CLI, you can choose either the latest stable CLI release (normal use), or a specific versioned release.

### Latest Stable CLI Release

Most users should use the current stable release, defined in the `clojure` formula.

To install, upgrade, or uninstall the stable Clojure CLI release from this tap use the respective commands:

```
brew install clojure/tools/clojure
brew upgrade clojure/tools/clojure
brew uninstall clojure
```

The latest stable CLI release can also be obtained from homebrew-central (it may lag this tap slightly).

### Versioned Release

Versioned releases can only be obtained from this tap. Version releases are useful for two purposes:

* Running a specific older version - sometimes useful for reproducing or testing a particular environment
* Testing a new version before release - occasionally a prerelease version will be made available for testing before it is designated as the stable release.

Versioned formulas are named `clojure@some.version` (homebrew convention).

Note that you cannot install both the stable version AND a specific named version - these will conflict. You must `brew uninstall clojure` first before installing a specific version. There are various cases where you may still have uninstalled but linked versions - in those cases `brew` will give you a helpful message telling you what to do.

To install or uninstall a versioned Clojure CLI from the Clojure tap:

```
brew install clojure/tools/clojure@1.10.1.502
brew uninstall clojure@1.10.1.502
```

## Links

Please see the following docs on how to use the `clj` and `clojure` scripts:

* [Clojure CLI Installation Guide](https://clojure.org/guides/install_clojure)
* [Clojure CLI Changelog](https://clojure.org/releases/tools)
* [Deps and CLI guide](https://clojure.org/guides/deps_and_cli)
* [Deps and CLI reference](https://clojure.org/reference/deps_and_cli)

