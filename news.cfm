<!---Get news years--->
<cfquery name = "rsNewsYears" datasource = "hdStreet">
    SELECT Year(FLD_NEWSCREATIONDATE) as fld_newsyear
    FROM TBL_NEWS
    ORDER BY FLD_NEWSCREATIONDATE DESC
</cfquery> 

<cf_front  title="History">

  <div id="pageBody">

    <div id="calendarContent">
        <cfif isDefined("url.newsID")>
          <!-- Output a single news -->
          <cfquery name = "rsSingleNews" datasource="hdStreet">
            SELECT TBL_NEWS.FLD_NEWSCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_USERS.FLD_USERFIRSTNAME, TBL_USERS.FLD_USERLASTNAME 
            FROM TBL_NEWS INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
            WHERE FLD_NEWSID = #url.newsID#  
          </cfquery>

          <cfoutput>
            <h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
            <p>Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE, 'dd mmm yyyy')# by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#</p>
            #rsSingleNews.FLD_NEWSCONTENT# 
          </cfoutput>
        
        <cfelseif IsDefined("url.year")>
          <cfquery name = "rsNewsOfYear" datasource="hdStreet">
            SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
            FROM TBL_NEWS
            WHERE Year(FLD_NEWSCREATIONDATE) = #url.year#
            ORDER BY  FLD_NEWSCREATIONDATE DESC
          </cfquery>
          
          <h1>All the news of year <cfoutput>#url.year#</cfoutput></h1>
          <table>
            <!---Output  news of Year in a table--->
            <cfoutput query="rsNewsOfYear">
              <tr>  
                <td>#dateFormat(FLD_NEWSCREATIONDATE, 'dd mmm yyyy')#</td>
                <td>#FLD_NEWSTITLE#</td>
                <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
              </tr>
            </cfoutput>
          </table>
          
        <cfelse>
          <!---Output all news if no url scope newsID not present in URL--->
          <!---Get all news--->
          <cfquery datasource="hdStreet" name="rsAllNews">
            SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
            FROM TBL_NEWS
            ORDER BY FLD_NEWSCREATIONDATE DESC  
          </cfquery>
    
          <h1> News</h1>
          <table>
            <!---Output  news in a table--->
            <cfoutput query="rsAllNews">
              <tr>  
                <td>#dateFormat(FLD_NEWSCREATIONDATE, 'dd mmm yyyy')#</td>
                <td>#FLD_NEWSTITLE#</td>
                <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
              </tr>
            </cfoutput>
          </table>

        </cfif>
      </div>

      <div id="calendarSideBar">
        <h1>News archive</h1>
        <ul>
        <cfoutput query = "rsNewsYears" group="fld_newsyear">
          <li><a href="news.cfm?year=#fld_newsyear#">#fld_newsyear#</a></li>
        </cfoutput>
        </ul>
        <p class="alignRight">&nbsp;</p>
      </div>

  </div>

</cf_front> 
