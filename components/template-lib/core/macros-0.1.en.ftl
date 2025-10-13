<#macro renderGlossary glossary><#if glossary?has_content>
    <#compress>
        [%autowidth.stretch,options="header"]
        |===
        |Term |Description
        <#list glossary.entries as entry>
            <#if core.glossary.isMentioned(entry)>
                | ${core.glossary.shortNameWithAnchor(entry)}
                | ${entry.description!}
            </#if>
        </#list>
        |===
    </#compress>

</#if></#macro>

<#macro renderDocumentVersions versions><#compress>
    <#if versions?has_content>
        [%autowidth.stretch,options="header"]
        |===
        5+^|VERSION HISTORY
        s|[nowrap]#VERSION# s|[nowrap]#APPROVED BY# s|[nowrap]#DATE# s|DESCRIPTION OF CHANGE s|[nowrap]#AUTHOR#
        <#list versions as v>
            |${v.number} |${v.approvedBy!} |[nowrap]#${core.dt.formatDate(v.date!)}# |${v.changeLog!} |${v.author!}
        </#list>
        |===
    </#if>
</#compress></#macro>