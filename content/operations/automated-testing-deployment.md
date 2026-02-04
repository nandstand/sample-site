---
title: 'Automated testing and deployment'
linkTitle: 'Automated testing and deployment'
description: 'Overview of the CI/CD pipeline used to deploy this site'
type: 'docs'
weight: 20
---

In my previous role, one of my responsibilities was managing the deployment of updates to my primary software project.
I managed the deployment of code changes that I wrote myself, and coordinated with teammates to get their changes merged in.

After leaving that role, I was interested in learning modern tools and techniques for handling this process.
I taught myself GitHub Actions and developed a CI/CD pipeline that tests and deploys the site as changes are made.
I also used this as an opportunity to get more hands-on experience with GitHub's pull request workflow by implementing CI tests for every merge into main.

---

## What I built

Two GitHub Actions workflows that handle building, testing, and deploying the live site.

**CI workflow** — Runs on every pull request. Builds the site, lints all Markdown content, and validates links by spinning up a local server and checking against it.

Full workflow file: [ci.yml](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml)

```mermaid
flowchart LR
    subgraph B ["Build"]
        direction TB
        A1[Checkout code] --> A2[Install dependencies]
        A2 --> A3[Build site with Hugo]
        A3 --> A4[Upload build artifact]
    end
    
    subgraph LM ["Lint Markdown"]
        direction TB
        B1[Checkout code] --> B2[Run markdownlint]
    end
    
    subgraph LC ["Link check"]
        direction TB
        C1[Download build artifact] --> C2[Start local HTTP server]
        C2 --> C3[Run Lychee link checker]
    end
    
    B ~~~ LM
    B --> LC
```

**Deploy workflow** — Runs on push to `main`. Builds and deploys the site, then validates links against the live production URL to confirm the deployment succeeded.

Full workflow file: [deploy.yml](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml)

```mermaid
flowchart LR
    subgraph B ["Build"]
        direction TB
        A1[Checkout code] --> A2[Install dependencies]
        A2 --> A3[Build site with Hugo]
        A3 --> A4[Upload build artifact]
    end
    
    subgraph L ["Lint"]
        direction TB
        B1[Checkout code] --> B2[Run markdownlint]
    end
    
    subgraph D ["Deploy"]
        direction TB
        D1[Download build artifact] --> D2[Push to gh-pages branch]
    end
    
    subgraph LC ["Link check"]
        direction TB
        C1[Download build artifact] --> C2[Run Lychee against live URL]
    end
    
    B ~~~ L
    B --> D
    D --> LC
```

---

## Quality checks

### Markdown linting

All content is checked against a customized [markdownlint](https://github.com/DavidAnson/markdownlint) configuration. Catches formatting inconsistencies and potential rendering issues before they reach production.

### Link checking

Broken links are caught automatically using [Lychee](https://github.com/lycheeverse/lychee). The approach differs between CI and deploy:

- **CI** — Spins up a local HTTP server and checks links against the built site.
- **Deploy** — After publishing, checks links against the live production URL.
