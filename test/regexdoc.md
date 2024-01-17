### How to use Regex in MySQL

### Regular Expression Functions and Operators:
#### 1. Pattern Matching
Name  | Description
-| -
`REGEXP` | Whether string matches regular expression
`NOT REGEXP` | Negation of `REGEXP`
`RLIKE` | Whether string matches regular expression
`NOT RLIKE` | Negation of `RLIKE`
`REGEXP_LIKE()` | Whether string matches regular expression
`NOT REGEXP_LIKE()` | Negation of `REGEXP_LIKE()`

#### 2. Substring indexing or matching

Name  | Description
-| -
`REGEXP_INSTR()` | Starting index of substring matching regular expressionb
`NOT REGEXP_INSTR()` | Return False(`0`)/True(`1`) if `REGEXP_INSTR()` return a valid index or not respectively
`REGEXP_SUBSTR()` | Return substring matching regular expression

#### 3. String Replacement

Name  | Description
-| -
`REGEXP_REPLACE()` | Replace substrings matching regular expression




## Reference:
1. [MySQL](https://dev.mysql.com/doc/)
   - [Function & Operators](https://dev.mysql.com/doc/refman/8.2/en/string-functions.html)
   - [Regex](https://dev.mysql.com/doc/refman/8.2/en/regexp.html)




## Uses of Regex in PostgreSQL

Syntex | Description
-|-
^|Match Beginning
$|Match End
. | Match any characters
a*| Match any sequence
a+ | Match one or more characters
a? | Match either zero or one character
a|b | Match either or case; a or b
(abc)* | Match zero or more instances of the sequence


https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Pattern-matching-Conditions.html
https://onecompiler.com/mysql/3zzpxaa7u
https://dev.mysql.com/doc/refman/8.3/en/regexp.html#function_regexp-like

REGEX_LIKE(str, regx_ptrn, match_type)
	str: Define the matching string or input db columns
	regx_ptrn: Define the regular expression pattern 
	match_type: Define how matching will perform; like: Case-sensitive, multiline mode etc.
		  It's is a optional condition and default matching type is 'Case-Insensitive Matching(i)'
		  Now all matching types as follows
			Case-01: Case-Sensitive Matching: 'c' 
			Case-02: Case-Insensitive Matching: 'i'
			Case-03: Multi-line Mode: 'm', If your input data (str) contains multiple lines, then every line treated as a single string. 
That means, if you want to match anything at start or end of any line then, just use ^(start) or $(end), like normal string validation. In details please check example.
			Case-04: New Line Validation Mode with Parameter full-stop(.): 'n'
			Case-05: Unix / newline validation: 'u'

c: It represents a case-sensitive matching.
i: It represents a case-insensitive matching.
m: It represents a multiple-line mode that allows line terminators within the string. By default, this function matches line terminators at the start and end of the string.
n: It is used to modify the . (dot) character to match line terminators.
u: It represents Unix-only line endings.

			
REGEX_INSTR(str, regx_ptrn, pos, occurrence, return_option, match_type)
	str: Define the matching string or input db columns
	regx_ptrn: Define the regular expression pattern for matching
	pos:
	occurrence:
	return_option: 
	match_type: Define how matching will perform;
				Check defination of REGEX_LIKE 'match_type'
   Character indexes begin at 1.	
				
SELECT REGEXP_INSTR('a b c d e f a', 'a', 1, 1, 0) AS start_index_;  
SELECT REGEXP_INSTR('a b c d e f a', 'a', 1, 2, 0) AS a_index_2;  

REGEX_SUBSTR(str, regx_ptrn, pos, occurrence, match_type)
	str: Define the matching string or input db columns
	regx_ptrn: Define the regular expression pattern for matching
	pos:
	occurrence:
	match_type: Define how matching will perform;
				Check defination of REGEX_LIKE 'match_type'

REGEX_REPLACE(str, regx_ptrn, rep_str, pos, occurrence, match_type)
	str: Define the matching string or input db columns
	regx_ptrn: Define the regular expression pattern for matching
	rep_str: define the string replacement value of regex matching 
	pos:
	occurrence:
	match_type: Define how matching will perform;
				Check defination of REGEX_LIKE 'match_type'
	
		    
