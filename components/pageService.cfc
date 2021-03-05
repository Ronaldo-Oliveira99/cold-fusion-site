<cfcomponent output = "false" displayname="Page Service component" hint="This component handles various aspects of page management" >
    <cffunction name = "getPageByID" returnType = "query" hint="This function retrieves a single page from the database based o the unique ID number of the page">
    <cfargument name="pageID" type="numeric" required="true" hint="Unique ID number if the page to retrieve">
        <cfset var rsPage = ''/>
        <cfquery  name="rsPage">
            SELECT FLD_PAGETITLE, FLD_PAGECONTENT
            FROM TBL_PAGES
            WHERE FLD_PAGEID = #arguments.pageID# AND FLD_PAGEISACTIVE = 1
        </cfquery>
    <cfreturn rsPage>
    </cffunction> 
</cfcomponent>