<!---Get page content for fld_pageID = 2--->
<cfinclude template = "includes/myFunctions.cfm">
<cfset rsPage = getPageContent(2) />
<cf_front  title="HD Street band - History">
  <div id="pageBody">
    <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
          #rsPage.FLD_PAGECONTENT#
    </cfoutput>
  </div>
</cf_front> 
