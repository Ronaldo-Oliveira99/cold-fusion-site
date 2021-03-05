<cfform id="frmConnexion" preservedata="true">
	<fieldset>
    <legend>Login</legend>
		<dl>
        	<dt><label for="fld_userEmail">E-mail address</label></dt>
            <dd><cfinput type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="email" validateAt="onSubmit" message="Please enter a valid e-mail Address" /></dd>
    		<dt><label for="fld_userPassword">Password</label></dt>
            <dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true"  validateAt="onSubmit" message="Please provide a password" /></dd>
        </dl>
        <cfinput type="submit" name="fld_submitLogin" id="fld_submitLogin" value="Login" />
    </fieldset>
</cfform>
