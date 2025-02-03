
1: What is Jq:
	- Jq is a command-line tool to parse JSON Data on Linux Command Line 
	- Parsing JSON Data means
		- Reading JSON Data
		- Writing JSON Data
		- Modifying (Inserting/Deleting) JSON Data

2: Jq command syntax:
	- Syntax:
		- jq [options] 'LogicToParseJsonData' [input] -> It gives Output
		- Note:
				- Options are always optional but based on requirement we can also pass options
				-  LogicToParseJsonData can be framed with filters, conditions, functions etc ...
				- Input -> It can be file/directly a JSON String/JSON Data From Unix/Linux Command
		- jq --help command will give all info
Filters:
- Filter are used to filter the data
	- Identity Filter: [ . (DOT) is called Identity filter ]
			- It is used or useful to validate the JSON data
			- It is called identity filter because its input and output both are identical
			- Syntax
					- jq 'LogicToParseJsonData' [input]
						- jq . [input]
						- jq '.' [input]--> Prefer to use this one
						- jq "." [Input]
	- Field Filter:
			-  It is useful to get key/property value from a JSON Dta
				- Syntax:
					- jq .key [input]
					- jq '.key' [input]
					- jq '.key' [input]
			- We can also Chain keys/properties together to get nested objects.
				- Syntax:
					- jq '.key1.key2.key3' fileName
			- Note: Filters are also called as operators.
Jq Options to work with Raw String (-R and -r Options):
What is RAW String:
	- It is northing but NON JSON DATA
- Option_1 
		- -R -> To Read NON Json Data (Read Raw String)
- Option_2
		- -r -> To Get RAW String (print Output)
		- It will remove the the cotations like from "King" to King
			- eg: jq -r 'LogicToParseJsonData' [input] 
Jq Command with Field Filter & Comma:
Comma(,):
	- It is Useful to apply multiple Field Filters in one single jq command, so that we can get multiple key values.
			- eg: jq 'LogicToParseJsonData, LogicToParseJsonData' [Input] 
Jq Command with -S(Upper case 'S') Option to Sort Keys:
	-  Sort the JSON file Keys in to alphabetical order
	Note: Only we can do in the output only not in the actual file.
			- eg: jq -S 'LogicToParseJsonData' [input] 
Jq Command with -s(Lower Case 's') option to combine Multiple JSON Files:
	- Use to create new output or file using 2 or more JSON files then we use -s(Lower Case) option 
	Note: Result is an Array, where values are from input files.

Different Ways to pass JSON Data as an Input to Jq Command:
There are 3 ways to pass JSON Data as input to Jq Command

Parsing API Response with Jq Command
pass API to jq in different ways
our api is : https://randomuser.me/api/
	- jq '.' <<< "$(curl -s https://randomuser.me/api/)"
	- curl -s https://randomuser.me/api/ | jq '.'

Parsing Cloud CLI and Kubectl Command's Output with Jq
	- eg: jq '.' <<< "$(aws iam list-users --output json)"

Iterator Filter or Array Filter for Arrays:
- Iterator filter or Array Filter is like a loop, which is useful to take and print one by one values from a JSON array.
		- eg: jq '.[]' [Input File]

Iterator Filter with Index of Array Values: 


Constructing JSON null, number, string and Boolean dat's with jq without any input Json data


Constructing JSON Array with Jq without Any Input JSON Data

Constructing/Creating JSON Object with Jq without Any Input JSON Data

	- Create/ Construct JSON object with one of the input VALUE
			- eg: jq '{"new_key": .inputfile_key}' inputfile

--tab and -c Options for Jq Command
	- --tab
		- used for Indentation
		- eg: jq --tab '{"devops_tools": .tools}' devopsinfo.json
	- -c
		- Compact instead of pretty-printed output (in single line)
		- eg: jq -c '{"devops_tools": .tools}' devopsinfo.json
	- We can use both --tab and -c in jq command which ever mentioned last jq will take that(having heigh priority)

Adding or Modifying a Key Value for a given JSON Object

	eg: jq '.members[0].friends={"Vamsi": "Masters Friend", "Balakrishna": "Room Friend", "Anil": "PG Friend"}' family.json
Adding and Modifying a Value for a given JSON Array

eg: 
	- jq '.[-1]="test"' family.json
	- jq '.members.[-1]="test"' family.json
	- jq '.members[length]={"a" : "b"}' family.json
	- jq '.members.[length]=9999' family.json

Recreating an Object with shortcut

Jq Command with Exit Status

Storing the Jq Command Output into a Shell Variable

Understanding About Jq Pipes

	eg: 
		- jq '.members[]' family.json | jq '.firstname'
		- jq '.members[]' family.json | jq '.firstname' | jq 'length'
		- jq '.members[].firstname | length' family.json
		- 
Creating JSON array from Input file
	eg: 
		- jq '[.members[].firstname]' family.json

FUNCTIONS (Jq Functions)

	- key and length Functions:

	- min, max, add, sort, reverse & unique Functions for array of NUMBERS
	- eg: array = [1,3,4,5,2,5,6,7]



	- has Function:

	- map & map_values Functions

	- Select Function

