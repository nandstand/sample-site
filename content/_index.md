---
title: 'Welcome'
description: "Samples representing my experience supporting production software in a scientific computing setting"
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

This portfolio contains samples that represent my professional experience supporting production software and promoting knowledge share through documentation.

There are two sections that represent my operational work experience:

- [HPC operations and shell scripting](/operations/hpc-operations-shell-scripting/) -- samples that showcase my experience managing batch jobs and working with software deployed on HPC architecture
- [Automated testing and deployment](/operations/automated-testing-deployment/) -- an overview of the CI/CD pipeline that I developed for testing and deploying this site, a project that I used to continue building on the deployment management skills from my previous role

The technical writing samples include a [how-to guide](technical-writing/get-started/quickstart), a [tutorial](technical-writing/get-started/hpc-tutorial), and a [reference document](technical-writing/reference/environment-variables).

## Background

In my previous role, I worked as a developer in a scientific computing setting, where I was part of a team that maintained oceanographic software on an HPC cluster.

Along with development work, I helped support day-to-day operations and delivery to customers, and contributed to documentation across multiple projects.

I can't share samples of this work directly.
To get around this, I designed a fictional software project - an air quality monitoring system maintained by a university research team - and created sample scripts and documentation that demonstrate my skillset. The samples are based on publicly available HPC documentation from providers like Stanford, USC, and the University of Arizona.

## How I built this site

I built this site using Hugo, a static site generator.
I used Markdown to author content, and a combination of YAML and SCSS to configure the site's presentation.
In some places, I extended the site's theme to add new features, or to fix an issue with formatting.
The site's [full source](https://github.com/nandstand/sample-site) is available on GitHub.

To manage testing and deploying the site, I developed a CI/CD pipeline using GitHub Actions that includes a Markdown linter and a link checker.
As I make changes to the site's source code or content, it is automatically built, tested, and deployed via GitHub Pages.
To see how I set up this pipeline, see the workflow files for [CI tests](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml) and [deployment](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml), or read the overview in [Automated testing and deployment](/operations/automated-testing-deployment/).

## Research and writing process

Along with the source code for this site and its content, I also provide an open look into my research process for developing these samples.
You can view my full [research notes](https://github.com/nandstand/sample-site/tree/main/reference) in the site repository.

I used Microsoft's Writing Style Guide to write and proofread content.
I used this project as an opportunity to learn and apply [Diátaxis](https://diataxis.fr/), which is a system for authoring and organizing technical documentation.
