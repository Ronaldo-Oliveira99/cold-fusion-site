<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create a structure using the structNew() function--->
	<cfset stUser = structNew() />
	<cfset stUser.firstName = 'Ronaldo'/>
	<cfset stUser.lastName = 'Luiz'/>
	<cfset stUser.age = 36/>
	<p>Trazer a estrutura explicita</p>
	<cfdump var = "#stUser#" label="Estrutura Explicita" />

	<!---Step 2 - Create the same structure using implicit notation--->
	<cfset stUserImplicit = {firstName='Ronaldo', lastName='Luiz', age=36} />
	<p>Trazer uma estrutura Implicita</p>
	<cfdump var = "#stUserImplicit#" label="Estrutura Implicita" />
	
	<!---Step 3 - use structDelete() --->
	<cfset StructDelete(stUser, 'age') />
	<p>Trazer stUser após deletar a chave 'age'</p>
	<cfdump var = "#stUser#" label="Estrutura Explicita apoós deletar age" />
	
	<!---Step 4 - use structClear() --->
	<cfset  structClear(stUser)/>
	<p>Trazer stUser depos de usar structClear(), a estutura existe, mas sem chaves/valor</p>
	<cfdump var = "#stUser#" label="Estrutura Explicita Esvaziada" />

	<!---Step 5 - use structCount()--->
	<p>stUserImplicit holds <cfoutput>#structCount(stUserImplicit)#</cfoutput> elements</p>
</body>
</html>