<cfcomponent output="false">
    <cfset this.name = 'hdStreetWebsite' />
    <cfset  this.applicationTimeout = CreateTimeSpan(0, 2, 0, 0)/>
    <cfset this.datasource = 'hdStreet' />       
    <cfset this.customTagPaths= Expandpath('/cfTraining/customTags') >
</cfcomponent> 