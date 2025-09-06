---
title: 'Welcome'
description: "Sample developer documentation, built using a docs-as-code approach"
linkTitle: 'Welcome'
type: 'docs'
no_list: true
---

## About this portfolio

This portfolio contains sample documentation that demonstrates my approach to technical writing using modern documentation tools and techniques.
The samples include a how-to guide, a tutorial, and a reference document.

As a developer, I've worked on scientific computing projects using high-performance computing resources.
This work involved maintaining software distributed on HPC infrastructure, and helping new team members work confidently with the tools used in these settings.

I wanted to present samples that reflect my technical skill set and background, and showcase my experience writing to address practical needs in a production setting.
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

All content in the sample documentation follows Microsoft's Writing Style Guide.
