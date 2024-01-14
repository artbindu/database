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
2. 