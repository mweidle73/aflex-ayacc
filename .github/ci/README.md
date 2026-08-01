# GitHub maintenance overlay

This repository preserves the historical University of California, Irvine
Aflex and Ayacc 1.4a distribution used by Abuild. It is intentionally not an
upstream continuation of the generators.

The branches have distinct roles:

- `master` is frozen at the original imported source snapshot;
- `abuild` carries the patches used by the Abuild submodule;
- `abuild-gh` adds only the GitHub workflows and their supporting files below
  `.github/`.

The tag `aflex-ayacc-1.4a-import` names the imported source snapshot described
by `RELEASE`. The archive from which the historic Git import was made is not
available with an independently published checksum, so the tag does not claim
byte identity with an external tarball.

There is deliberately no automated upstream synchronization. Maintained
descendants exist as the separate
[Ada-France Aflex](https://github.com/Ada-France/aflex) and
[Ada-France Ayacc](https://github.com/Ada-France/ayacc) projects, but their
history and interfaces have diverged from this frozen combined distribution.
Updates from those projects must not be merged automatically.

## Local validation

From a checkout of `abuild-gh`, run:

```sh
.github/ci/run .github/ci/check
.github/ci/run .github/ci/build-pages
```

The first command performs the same integration test as the hosted workflow:

1. build Aflex and Ayacc with Debian Trixie;
2. run Ayacc over the historical calculator grammar;
3. run Aflex over the corresponding scanner definition;
4. check that all seven expected generated source files are non-empty;
5. split the legacy generated `.a` sources with `gnatchop`;
6. compile the generated calculator with GNAT in Ada 2022 mode; and
7. execute it with committed input and byte-compare its output with the
   committed expected result.

The historical distribution has no separate unit-test suite. This test is an
end-to-end check of both generators and their generated Ada code, not a claim
of exhaustive generator coverage. The second command renders the historical
manual pages into the same static site that GitHub Pages publishes.

The launcher maps the invoking UID and GID into the container and uses a
writable temporary home. The build commands run without network access and
with a read-only container root filesystem; only the repository mount and the
private `/tmp` filesystem are writable.
