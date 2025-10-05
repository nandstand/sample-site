---
title: 'Welcome'
description: "Sample developer documentation, built using a docs-as-code approach"
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

## About this portfolio

This portfolio contains sample documentation that demonstrates my approach to technical writing using modern documentation tools and techniques.
The samples include a [how-to guide](/get-started/quickstart), a [tutorial](/get-started/hpc-tutorial), and a [reference document](/reference/environment-variables).

In my previous role, I worked as a developer in a scientific computing setting, where I maintained software distributed on high-performance computing infrastructure, and taught new team members how to work confidently with HPC tools and workflows.

I wanted to present samples that reflect my technical skill set and background, and showcase my experience writing to address the needs of software teams in production settings.
I designed a fictitious software project—an air quality monitoring system maintained by a university research team—and created documentation covering developer onboarding in a setting where getting started can be challenging.

## How I built this site

I built this site using Hugo, a static site generator.
I used Markdown to author content, and a combination of YAML and SCSS to configure the site's presentation.
In some places, I extended the site's theme to add new features, or to fix an issue with formatting.
The site's [full source](https://github.com/nandstand/sample-site) is available on GitHub.

To manage testing and deploying the site, I developed a CI/CD pipeline using GitHub Actions that includes a Markdown linter and a link checker.
As I make changes to the site's source code or content, it is automatically built, tested, and deployed via GitHub Pages.
To see how I set up this pipeline, see the workflow files for [CI tests](https://github.com/nandstand/sample-site/blob/main/.github/workflows/ci.yml) and [deployment](https://github.com/nandstand/sample-site/blob/main/.github/workflows/deploy.yml).

## Research and writing process

Along with the source code for this site and its content, I also provide an open look into my research process.
You can view my full [research notes](https://github.com/nandstand/sample-site/tree/main/reference) in the site repository.

Research is a large part of the writing process.
I wanted to show my approach, and offer transparency about the resources that I used when designing the scenario presented in this documentation.

I used Microsoft's Writing Style Guide to write and proofread content.
I used this project as an opportunity to learn and apply [Diátaxis](https://diataxis.fr/), which is a system for authoring and organizing technical documentation.
