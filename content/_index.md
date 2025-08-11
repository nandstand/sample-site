---
title: 'Welcome'
description: ''
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

## About this site

This site hosts sample documentation for a fictional software project, meant to represent the kinds of documents that I wrote previously as a developer in a scientific computing setting.

The samples include a [how-to guide](/get-started/quickstart/), a [tutorial](/get-started/hpc-tutorial/), and a [reference document](/reference/environment-variables/).
Before writing these samples, I drew from public resources to build reference material outlining how the software project works.
To see this reference material and my research process for designing the sample project, see the [reference](https://github.com/nandstand/sample-site/tree/main/reference) included in the site's repository.

I built the site using Hugo, a static site generator, using the [Docsy](https://www.docsy.dev/) theme.
The site is automatically tested and deployed to GitHub Pages via a CI/CD pipeline that includes a link checker and Markdown linter.
To see how I set this up, see the workflow files for [CI tests](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml) and [deployment](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml), or view the site's [full source](https://github.com/nandstand/sample-site).

All content follows Microsoft's Writing Style Guide.

## About the sample project

The Coastal Air Quality Research Network (CAQRN) generates air quality index products for public environmental health research.
The project is maintained and deployed on a public university HPC cluster (see [Stanford's Sherlock cluster](https://www.sherlock.stanford.edu/docs/) as an example).

The writing samples on this site cover some topics specific to HPC environments, like working with a batch job scheduler.
The samples also cover more common development topics, like Python dependency management and version control using Git.
