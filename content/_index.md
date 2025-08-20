---
title: 'Welcome'
description: "Samples of the kind of work I've done writing for developer audiences, built with a docs-as-code approach"
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

## About this site

This site features sample documentation for a fictional software project, representing the kind of technical writing that I did as a developer in a scientific computing setting, where I maintained and deployed software on a high-performance computing (HPC) cluster.

The samples include a [how-to guide](/get-started/quickstart/), a [tutorial](/get-started/hpc-tutorial/), and a [reference document](/reference/environment-variables/).
Before writing these samples, I drew from public resources to build reference material outlining how the software project works.
To see this reference material and my research process for designing the sample project, see the [reference](https://github.com/nandstand/sample-site/tree/main/reference) included in the site's repository.

I built the site using Hugo, a static site generator, using the Docsy theme.
The site is automatically tested and deployed to GitHub Pages via a CI/CD pipeline that includes a link checker and Markdown linter.
See the workflow files for [CI tests](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml) and [deployment](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml) to see how I did it, or view the site's [full source](https://github.com/nandstand/sample-site).

All content follows Microsoft's Writing Style Guide.

## About the software project

The Coastal Air Quality Research Network (CAQRN) generates air quality index products for public environmental health research.
The project is maintained and deployed on a public university HPC cluster (see [Stanford's Sherlock cluster](https://www.sherlock.stanford.edu/docs/) as an example).

The writing samples on this site cover some topics specific to HPC environments, like working with a batch job scheduler.
The samples also cover more common development topics, like Python dependency management and version control using Git.
