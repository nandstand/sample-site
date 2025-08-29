---
title: 'Welcome'
description: "Samples of my work, built using a docs-as-code approach"
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

## Overview

This portfolio contains samples of my work—you'll find a [setup guide](/get-started/quickstart/), a [tutorial](/get-started/hpc-tutorial/), and a [reference document](/reference/environment-variables/).
These are sample documents for a fictional software project, designed to emulate the kind of writing that I've done as a developer working in a high-performance computing (HPC) setting.

Each of these documents covers topics related to setting up for work in an HPC environment.
Some topics are universal to software development in any setting (e.g., Git workflows, managing software dependencies).
Others relate to the specific quirks of working with software deployed on an HPC cluster.
In either case, I try to keep things as simple and as clear as possible, while presenting a scenario that is plausible and representative of my real work.

## How I built this site

I built this site using Hugo, a static site generator.
I used Markdown to author content, and a combination of YAML and SCSS to configure the site's presentation.
In some places, I extended the site's theme to add new features, or to fix an issue with formatting.
This involved working with Hugo shortcodes, which are HTML and Go templates that extend Hugo's base functionality.
The site's [full source](https://github.com/nandstand/sample-site) is available on GitHub.

To manage testing and deploying the site, I developed a CI/CD pipeline using GitHub Actions that includes a Markdown linter and a link checker.
As I make changes to the site's source code or content, it is automatically built, tested, and deployed via GitHub Pages.
To see how I set up this pipeline, see the workflow files for [CI tests](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml) and [deployment](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml).

## Research and writing process

All content follows Microsoft's Writing Style Guide.
