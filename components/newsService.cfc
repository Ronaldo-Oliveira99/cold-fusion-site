<cfcomponent output="false">
    <cffunction name = "getNewsForYear" access = "public" returnType="query">
        <cfargument name="year" type="numeric" required="true" />
        
    </cffunction>

    <cffunction name = "getNewsByID" access = "public" returnType="query">
        <cfargument name="newsID" type="numeric" required="true" />
        
    </cffunction>

    <cffunction name = "getLatestNews" access = "public" returnType="query">
        
    </cffunction>

    <cffunction name = "getNewsYears" access = "public" returnType="query">
        
    </cffunction>
</cfcomponent>