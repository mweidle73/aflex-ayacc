# Aflex and Ayacc 1.4a

This repository preserves the historical University of California, Irvine
Aflex lexical-analyzer generator and Ayacc parser generator used by
[Abuild](https://github.com/mweidle73/abuild). It is a compatibility archive,
not the current upstream for either generator.

The rendered historical manuals are available on the
[project documentation site](https://mweidle73.github.io/aflex-ayacc/).
New projects should evaluate the maintained
[Ada-France Aflex](https://github.com/Ada-France/aflex) and
[Ada-France Ayacc](https://github.com/Ada-France/ayacc) repositories.

## Branches

- `master` is frozen at the original imported 1.4a source snapshot.
- `abuild` carries the compatibility patches used by the Abuild submodule.
- `abuild-gh` adds the GitHub workflows and supporting files below `.github/`
  to the `abuild` source state.

The annotated tag `aflex-ayacc-1.4a-import` identifies the original imported
snapshot. The historical Git import was not accompanied by an independently
published archive checksum, so the tag does not claim byte identity with an
external tarball.

There is deliberately no automated merge from the modern Ada-France projects.
Their histories and interfaces have diverged from this combined distribution;
any future update requires an explicit compatibility review.

## Building

With a current GNAT toolchain and GNU Make, build both generators from the
repository root:

```sh
make -j8
```

The resulting programs are `aflex/src/aflex` and `ayacc/src/ayacc`.

## Continuous integration

The historical distribution contains no independent unit-test suite. The
`abuild-gh` branch therefore runs an end-to-end integration test that exercises
both generators together:

1. build Aflex and Ayacc on Debian Trixie;
2. generate a parser from the historical calculator grammar with Ayacc;
3. generate its scanner with Aflex;
4. require all seven expected generated source files to be non-empty;
5. split the legacy generated `.a` sources with `gnatchop`;
6. compile the generated calculator with GNAT in Ada 2022 mode;
7. execute it with committed input and byte-compare the output with a committed
   expected result.

This is a real generator integration test, not merely a successful-build
check. It validates the complete grammar-to-executable path, but it does not
claim exhaustive coverage of either generator.

From a checkout of `abuild-gh`, run the same checks locally in the hardened
non-root Trixie container:

```sh
.github/ci/run .github/ci/check
.github/ci/run .github/ci/build-pages
```

The second command renders the historical Aflex and Ayacc manual pages used by
GitHub Pages. More details about the container and branch overlay are in
`.github/ci/README.md` on `abuild-gh`.

## Historical material and licensing

The original top-level distribution notice, registration form and obsolete FTP
instructions are preserved unchanged in [README.UCI](README.UCI). Component
documentation remains below `aflex/` and `ayacc/`.

See [COPYING](COPYING) for the distribution and Aflex-derived license notices.
Copyright and license notices in individual source files remain applicable.
