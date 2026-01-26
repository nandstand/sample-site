# Portfolio site

This portfolio site contains samples representing work that I did in a previous role as a developer in a scientific computing setting, where I maintained software on an HPC cluster, wrote documentation, and managed software deployments.

Built with Hugo and the Docsy theme. Automated testing and deployment via GitHub Actions.

**Live site:** https://portfolio.christianf.io/

---

## Summary

### Documentation Samples

The site contains sample technical documentation for a fictional HPC software project — a quickstart guide, tutorial, and a reference doc. These represent my experience working with and writing documentation for scientific software that ran on HPC infrastructure.

### Sample Scripts

The `reference/` directory contains shell scripts and research notes for a fictional HPC project that I designed using public HPC provider documentation as reference:

- Environment configuration scripts (sandbox, staging, production)
- Slurm job submission and execution scripts
- Research notes based on public university HPC documentation

These scripts represent the kind of work that I did in my previous role: writing and troubleshooting orchestration scripts, helping teammates set up their development environments, and managing deployments across multiple environments.

### CI/CD Pipeline

The site is built, tested, and deployed automatically using GitHub Actions. The pipeline runs Markdown linting and link checking on pull requests, and deploys to GitHub Pages on merge. The portfolio contains [a more detailed explanation of how it works](https://portfolio.christianf.io/operations/automated-testing-deployment/).

---

## Building the site locally

### You will need

- Hugo Extended (v0.73.0+)
- Node.js (v22+)
- Go (v1.22+)

### Setup

Clone the repo:

```bash
git clone https://github.com/nandstand/sample-site.git
cd sample-site
```

Install Docsy's Node dependencies:
```bash
npm ci
```

### Build

Build and serve locally using dev configuration (builds draft pages):

```bash
hugo server
```

Production build:

```bash
hugo
```
