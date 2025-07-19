---
title: 'Environment variables'
linkTitle: 'Environment variables'
description: 'Description goes here'
type: 'docs'
weight: 50 
---

Some information about how the project uses the environment variables during job submission and execution.

## Quick reference

Table goes here.

## Variables

Should put some text here.

### CAQRN_ENV


## Environment scripts

Something about the project using environment scripts for different job contexts.
Briefly explain that scheduled staging and production jobs use these environment scripts.

{{< tabpane lang="bash" >}}
{{< tab header="Sandbox" >}}
{{< include-file "/reference/sandbox_env.sh" >}}
{{< /tab >}}
{{< tab header="Staging" >}}
{{< include-file "/reference/staging_env.sh" >}}
{{< /tab >}}
{{< tab header="Production" >}}
{{< include-file "/reference/production_env.sh" >}}
{{< /tab >}}
{{< /tabpane >}}
