---
title: Collect SAP HANA audit logs in Microsoft Sentinel | Microsoft Docs
description: This article explains how to collect audit logs from your SAP HANA database.
author: batamig
ms.author: bagol
ms.topic: how-to
ms.date: 06/09/2024


#Customer intent: As a security analyst, I want to collect and analyze SAP HANA audit logs to Microsoft Sentinel so that I can monitor and respond to security events effectively.

---

# Collect SAP HANA audit logs in Microsoft Sentinel

This article explains how to collect audit logs from your SAP HANA database.

> [!IMPORTANT]
> Microsoft Sentinel SAP HANA support is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

## Prerequisites

SAP HANA logs are sent over Syslog. Make sure that your Azure Monitor Agent is configured to collect Syslog files. For more information, see:

For more information, see [Ingest syslog and CEF messages to Microsoft Sentinel with the Azure Monitor Agent](../connect-cef-syslog-ama.md).

## Collect SAP HANA audit logs

1. Make sure that the SAP HANA audit log trail is configured to use Syslog, as described in *SAP Note 0002624117*, which is accessible from the [SAP Launchpad support site](https://launchpad.support.sap.com/#/notes/0002624117). For more information, see:

    - [SAP HANA Audit Trail - Best Practice](https://help.sap.com/docs/SAP_HANA_PLATFORM/b3ee5778bc2e4a089d3299b82ec762a7/35eb4e567d53456088755b8131b7ed1d.html?version=2.0.03)
    - [Recommendations for Auditing](https://help.sap.com/viewer/742945a940f240f4a2a0e39f93d3e2d4/2.0.05/en-US/5c34ecd355e44aa9af3b3e6de4bbf5c1.html)
    - [SAP HANA Security Guide for SAP HANA Platform](https://help.sap.com/docs/SAP_HANA_PLATFORM/b3ee5778bc2e4a089d3299b82ec762a7/4f7cde1125084ea3b8206038530e96ce.html)

1. Check your operating system Syslog files for any relevant HANA database events.

1. Sign into your HANA database operating system as a user with sudo privileges.

1. Install an agent on your machine and confirm that your machine is connected. For more information, see [Install and manage Azure Monitor Agent](/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-portal).

1. Configure your agent to collect Syslog data. For more information, see [Collect Syslog events with Azure Monitor Agent](/azure/azure-monitor/agents/data-collection-syslog).

    > [!TIP]
    > Because the facilities where HANA database events are saved can change between different distributions, we recommend that you add all facilities. Check them against your Syslog logs, and then remove any that aren't relevant.

## Verify your configuration

Use the following steps in both Microsoft Sentinel and your SAP HANA database to verify that your system is configured as expected.

### Microsoft Sentinel 
In Microsoft Sentinel's **Logs** page, check to confirm that HANA database events are now shown in the ingested logs. For example, run the following query:

```Kusto
//generated function structure for custom log Syslog
// generated on 2024-05-07
let D_Syslog = datatable(TimeGenerated:datetime
,EventTime:datetime
,Facility:string
,HostName:string
,SeverityLevel:string
,ProcessID:int
,HostIP:string
,ProcessName:string
,Type:string
)['1000-01-01T00:00:00Z', '1000-01-01T00:00:00Z', 'initialString', 'initialString', 'initialString', 'initialString',1,'initialString', 'initialString', 'initialString'];

let T_Syslog = (Syslog | project
TimeGenerated = column_ifexists('TimeGenerated', '1000-01-01T00:00:00Z')
,EventTime = column_ifexists('EventTime', '1000-01-01T00:00:00Z')
,Facility = column_ifexists('Facility', 'initialString')
,HostName = column_ifexists('HostName', 'initialString')
,SeverityLevel = column_ifexists('SeverityLevel', 'initialString')
,ProcessID = column_ifexists('ProcessID', 1)
,HostIP = column_ifexists('HostIP', 'initialString')
,ProcessName = column_ifexists('ProcessName', 'initialString')
,Type = column_ifexists('Type', 'initialString')
);
T_Syslog | union isfuzzy= true (D_Syslog | where TimeGenerated != '1000-01-01T00:00:00Z')
```

### SAP HANA

In your SAP HANA database, check your configured audit policies. For more information on the required SQL statements, see [SAP Note 3016478](https://me.sap.com/notes/3016478/E).

## Add analytics rules for SAP HANA in Microsoft Sentinel

Use the following built-in analytics rules to have Microsoft Sentinel start triggering alerts on related SAP HANA activity:

- **SAP - (PREVIEW) HANA DB -Assign Admin Authorizations**
- **SAP - (PREVIEW) HANA DB -Audit Trail Policy Changes**
- **SAP - (PREVIEW) HANA DB -Deactivation of Audit Trail**
- **SAP - (PREVIEW) HANA DB -User Admin actions**

For more information, see [Microsoft Sentinel solution for SAP® applications: security content reference](sap-solution-security-content.md).

## Related content

Learn more about the Microsoft Sentinel Solution for SAP BTP:

- [Deploy Microsoft Sentinel solution for SAP® applications](deploy-sap-btp-solution.md)
- [Microsoft Sentinel Solution for SAP BTP: security content reference](sap-btp-security-content.md)

Learn more about the Microsoft Sentinel solution for SAP® applications:

- [Deploy Microsoft Sentinel solution for SAP® applications](deployment-overview.md)
- [Prerequisites for deploying Microsoft Sentinel solution for SAP® applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md)
- [Deploy SAP Change Requests (CRs) and configure authorization](preparing-sap.md)
- [Deploy the solution content from the content hub](deploy-sap-security-content.md)
- [Deploy and configure the container hosting the SAP data connector agent](deploy-data-connector-agent-container.md)
- [Deploy the SAP data connector with SNC](configure-snc.md)
- [Monitor the health of your SAP system](../monitor-sap-system-health.md)
- [Enable and configure SAP auditing](configure-audit.md)

Troubleshooting:

- [Troubleshoot your Microsoft Sentinel solution for SAP® applications deployment](sap-deploy-troubleshoot.md)
- [HANA audit log is not generated in SYSLOG | SAP note](https://me.sap.com/notes/3305033/E)
- [How to Redirect syslog Auditing for HANA to an alternate location | SAP note](https://me.sap.com/notes/2386609)

Reference files:

- [Microsoft Sentinel solution for SAP® applications data reference](sap-solution-log-reference.md)
- [Microsoft Sentinel solution for SAP® applications: security content reference](sap-solution-security-content.md)
- [Kickstart script reference](reference-kickstart.md)
- [Update script reference](reference-update.md)
- [Systemconfig.ini file reference](reference-systemconfig.md)

For more information, see [Microsoft Sentinel solutions](../sentinel-solutions.md).
