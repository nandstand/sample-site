---
title: 'Environment'
linkTitle: 'Environment'
description: ''
type: 'docs'
weight: 999
draft: true
---

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
