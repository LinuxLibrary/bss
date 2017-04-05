# Regular Expressions

***Features***

- Regular Expressions are supported by many applications
	- GREP - Line parsing tool which parses mathced test and/or RegEx
	- AWK - Field parsing tool which parses mathced test and/or RegEx
	- SED - Stream Editor - Permits modifications of the text streams
	- PERL - Supports normal text and/or RegEx matches
	- PYTHON - Supports normal text and/or RegEx matches
	- PHP - Supports normal text and/or RegEx matches
	
		> NOTE: Supports Perl compatible RegEx

	- .Net - Supports normal text and/or RegEx matches
	- Java - Supports normal text and/or RegEx matches
	- JavaScript -  Supports normal text and/or RegEx matches
- Ability to describe search patterns concisely

	```
	Search for "linux (or) Linux": [lL]inux
	```

- Reduces passes over text files - in particular large files
- Uses meta-characters and regular (literal[A-Za-z,0-9,_]) characters to describe search patterns
- First match wins unless quantifiers are used (typical RegEx algorithms)
