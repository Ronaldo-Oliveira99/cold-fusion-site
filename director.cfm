<!---Get page content--->
<cfquery  name="rsPage2">
        SELECT FLD_PAGETITLE, FLD_PAGECONTENT
        FROM TBL_PAGES
    </cfquery>
<cfinclude template = "includes/myFunctions.cfm" />
<cfset rsPage = getPageContent(1) />
<cf_front title="About Director">
  <div id="pageBody">
    <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
          #rsPage.FLD_PAGECONTENT#
    </cfoutput>

  </div>
</cf_front> 
