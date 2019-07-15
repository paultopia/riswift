# riswift

Micro-library to serialize and deserialize ris files.  WIP.  


note to self:

broad strategy: 

- enum with two types, multi-tag with associated types string for label and array<string> for elements; single tag with associated types string and content. 
- parse by initializing a map of multi-tags and a map of single tags, looping over lines, for each line: 
	- extract tag and content
	- test tag against list of tags, fail the whole thing if not valid.
	- test content against any validator for tag, fail the whole thing if not valid
	- if content in multi-list, check to see if exists in multi-tag map, if so, append to inner list, if not, create list with element
	- if content in single-tag-list, check to see if in there already, if so, impermissible dupe and fail; if not, add.
- then create a codable struct from those maps.  in the initializer, handle parsing out into subfields, date types, etc. 
- then it should be able to dump to json, and should be easy-ish to reverse this to serialize to a ris.
