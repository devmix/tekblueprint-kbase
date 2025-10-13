<#macro renderGlossary glossary><#if glossary??>
    <#compress>
        [%autowidth.stretch,options="header"]
        |===
        |Термин |Описание
        <#list glossary.entries as entry>
            <#if core.glossary.isMentioned(entry)>
                | ${core.glossary.shortNameWithAnchor(entry)}
                | ${core.glossary.mention(entry.description)!}
            </#if>
        </#list>
        |===
    </#compress>

</#if></#macro>

<#macro renderDocumentVersions versions><#compress>
    <#if versions??>
        [%autowidth.stretch,options="header"]
        |===
        5+^|ИСТОРИЯ ИЗМЕНЕНИЙ
        s|[nowrap]#ВЕРСИЯ# s|[nowrap]#УТВЕРДИЛ# s|[nowrap]#ДАТА# s|ОПИСАНИЕ ИЗМЕНЕНИЙ s|[nowrap]#АВТОР#
        <#list versions as v>
            |${v.number} |${v.approvedBy!} |[nowrap]#${core.dt.formatDate(v.date!)}# |${v.changeLog!} |${v.author!}
        </#list>
        |===
    </#if>
</#compress></#macro>