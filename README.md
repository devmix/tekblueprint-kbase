# tekBlueprint.kbase

This repository contains publicly available components for the tekBlueprint project knowledge base.

## Structure

The repository is organized into several directories:

Hardware:

- `hardware-memory` -- contains hardware memory specifications.
- `hardware-network` -- contains hardware network specifications.
- `hardware-processor` -- contains hardware processor specifications.
- `hardware-server` -- contains hardware server specifications.
- `hardware-storage` -- contains hardware storage specifications.

Software:

- `software-language` -- contains software language specifications.
- `software-library` -- contains software library specifications.
- `software-package` -- contains software package specifications.
- `software-service` -- contains software service specifications.
- `software-tool` -- contains software tool specifications.

Knowledge:

- `knowledge-refbook` -- contains knowledge refbook specifications.
- `knowledge-technology` -- contains knowledge technology specifications.

Workforce:

- `workforce-calendar` - contains workforce calendar specifications.
- `workforce-process` - contains workforce process specifications.
- `workforce-resource` - contains workforce resource specifications.

## Usage with [tekBlueprint.kbase](https://tekblueprint.org/blog/tekblueprint-kbase/intro/)

Create file `workbench.xml` and add this repository:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<tekWorkbench modelVersion="0.1.0">
    <components>
        <repositories>
            <git id="git-public" name="devMix // tekBluepring.kbase (public)" priority="0"
                 url="https://github.com/devmix/tekblueprint-kbase" branch="main" folder="components"
                 updateInterval="1h"/>
        </repositories>
    </components>
</tekWorkbench>
```

- `priority` -- is used to resolve conflicts in the coincidence of the names of components.
- `git` -- connection parameters to the repository:
    - `{GITHUB_TOKEN}` -- token for access to the GitHub repository (if the private repository)
    - `updateInterval` -- interval of repository updates (pull).
    - `branch` -- branch of the repository.
    - `components' -- a catalog inside the repository.

Then set environment variable of the [docker image](https://hub.docker.com/r/tekblueprint/kbase) to this file.

```yaml
services:
  kbase:
    image: tekblueprint/kbase:latest
    volumes:
      - ./kbase-server/config/workbench.xml:/workspace/kbase/workbench.xml
    environment:
      tb-kbase.components.storage.git: /workspace/kbase/git
      tb-kbase.components.repositories.config: /workspace/kbase/workbench.xml
```