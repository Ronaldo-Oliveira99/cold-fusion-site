<!---Form processing begins here--->
<cfif StructKeyExists(form, "form.fld_editUserSubmit") >
	<!--- Server side form validation --->
	<cfset aErrorMessages = arrayNew(1) />
	<cfset variables.formSubmitComplete = false />
	
	<!--- Validate firstName --->
	<cfif form.fld_userFirstName EQ '' >
		<cfset arrayAppend(aErrorMessages, 'Favor , insira o nome') >
	</cfif>
	
	<!--- Validate Last Name --->
	<cfif  form.fld_userLastName 	EQ ''>
		<cfset arrayAppend(aErrorMessages, 'Favor Insira o sobrenome')>
	</cfif>

	<!--- Vallidate emaill--->
	<cfif form.fld_userEmail EQ ''>
		<cfset arrayAppend(aErrorMessages, 'Favor Forneça um endereço de email')>
	</cfif>

	<!--- Vallidate Password--->
	<cfif form.fld_userPassword EQ ''>
		<cfset arrayAppend(aErrorMessages, 'Favor forneça o password') >
	</cfif>

	<!--- Vallidate Password consfirmation--->
	<cfif form.fld_userPasswordConfirm EQ ''>
		<cfset arrayAppend(aErrorMessages, 'Favor consfirme o password') >
	</cfif>

	<!--- validate password and password confirm Match --->
	<cfif form.fld_userPassword NEQ form.fld_userPasswordConfirm >
		<cfset arrayAppend(aErrorMessages, 'Favor senhas não conferem!') >
	</cfif>
	
	<!--- Continue form processing if the aErrorMessages array is empty --->
	<cfif ArrayIsEmpty(aErrorMessages)>	
		<cfquery datasource="hdStreet">
			UPDATE TBL_USERS
			SET 
			FLD_USERFIRSTNAME = '#form.fld_userFirstName#' ,
			FLD_USERLASTNAME = '#form.fld_userLastName#',
			FLD_USEREMAIL = '#form.fld_userEmail#',
			FLD_USERPASSWORD = '#form.fld_userPassword#',
			FLD_USERINSTRUMENT = #form.fld_userInstrument#,
			FLD_USERCOMMENT = '#form.fld_userComment#' 
			WHERE FLD_USERID = #form.fld_userID#
		</cfquery>
		<cfset variables.formSubmitComplete = true />
	</cfif>

</cfif>
<!---Form processing ends here--->

<!---Get user to update--->	
<cfquery name = "rsUserToUpdate" datasource="hdStreet">
	SELECT  FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL, FLD_USERPASSWORD, FLD_USERCOMMENT, 
        	FLD_USERINSTRUMENT
	FROM TBL_USERS
	WHERE FLD_USERID = 18 
</cfquery>
<!--- Get instruments to feed the form's Drop-Down list --->
<cfquery datasource="hdStreet" name="rsInstrumentsList">
	SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
	FROM TBL_INSTRUMENTS
	ORDER BY FLD_INSTRUMENTNAME ASC
</cfquery>


<cf_front  title="Profile">

	<div id="pageBody">
		<h1>Update your profile</h1>
		<cfform id="frm_editUser">
			<fieldset>
				<legend>Your profile</legend>
				<!---Output error messages if any--->
					<cfif isDefined('aErrorMessages')  AND NOT ArrayIsEmpty(aErrorMessages) >
						<cfoutput>
							<cfloop array="#aErrorMessages#" index="message">
								<p>#message#</p>
							</cfloop>
						</cfoutput>										
					</cfif>
				<!---Output feedback message if form has been successfully submitted--->
				<cfif StructKeyExists(variables, "formSubmitComplete") AND variables.formSubmitComplete> 
					<p>Seu perfil foi atualizado com sucesso</p>
				</cfif>
				
				<dl>
					<!---First name text field--->
					<dt><label for="fld_userFirstName">First Name</label></dt>
					<dd><cfinput name="fld_userFirstName" id="fld_userFirstName" value="#rsUserToUpdate.FLD_USERFIRSTNAME#" required="true" message="Please provide a valid first name" validateAt="onSubmit" /></dd>
					<!---Last name text field--->
					<dt><label for="fld_userLastName">Last Name</label></dt>
					<dd><cfinput name="fld_userLastName" id="fld_userLastName" value="#rsUserToUpdate.FLD_USERLASTNAME#" required="true" message="Please, provide a valid last name" validateAt="onSubmit" /></dd>
					<!---E-Mail Address text field--->
					<dt><label for="fld_userEmail">E-mail Address</label></dt>
					<dd><cfinput name="fld_userEmail" id="fld_userEmail"  value="#rsUserToUpdate.FLD_USEREMAIL#" required="true" validate="email" message="Please, provide a valid e-mail Address" validateAt="onSubmit" /></dd>
					<!---Password text field--->
					<dt><label for="fld_userPassword">Password</label></dt>
					<dd><cfinput type="password" name="fld_userPassword"  value="#rsUserToUpdate.FLD_USERPASSWORD#" id="fld_userPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
					<dt><label for="fld_userPasswordConfirm">Confirm password</label></dt>
					<dd><cfinput type="password" name="fld_userPasswordConfirm"  value="#rsUserToUpdate.FLD_USERPASSWORD#" id="fld_userPasswordConfirm" required="true" message="Please, confirm your password" validateAt="onSubmit" /></dd>
					<!---Instruments drop-down list--->
					<dt><label for="fld_userInstrument">Instrument</label></dt>
					<dd>
						<cfselect name="fld_userInstrument" id="fld_userInstrument" query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME" queryposition="below" selected="#rsUserToUpdate.FLD_USERINSTRUMENT#" >
							<option value="0">Please choose your instrument</option>
						</cfselect>
					</dd>
					<!---Comment Textarea--->
					<dt><label for="fld_userComment">Comment</label></dt>
					<dd>
						<cftextarea name="fld_userComment" id="fld_userComment" >
							<cfoutput>
								#rsUserToUpdate.FLD_USERCOMMENT#
							</cfoutput>
						</cftextarea>
					</dd>
				</dl>
				<cfinput name="fld_userID" value="#rsUserToUpdate.FLD_USERID#" type="hidden" />
				<!---Submit button--->
				<input type="submit" name="fld_editUserSubmit" id="fld_editUserSubmit" value="Update my profile" />
			</fieldset>
		</cfform>
	</div>

</cf_front> 