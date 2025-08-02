[
  "if"
  "else"
  "while"
  "for"
  "do"
  "switch"
  "case"
  "default"
  "break"
  "continue"
  "return"
  "goto"
  "do"
  "catch"
  "as"
  "throw"
  "import"
  "namespace"
  "module"
  "uniform"
] @keyword


(identifier) @variable
; (field_identifier) @property
(namespace_identifier) @namespace

(comment) @comment
(type_identifier) @type
(primitive_type) @type

(number_literal) @number
(string_literal) @string

[
  "struct"
  "class"
  "interface"
] @keyword

[
  "#include"
  "#define"
  "#if"
  "#ifdef"
  "#ifndef"
  "#else"
  "#elif"
  "#endif"
  (preproc_directive)
] @keyword

[
  (true)
  (false)
] @boolean

[
  ","
  ":"
  "::"
  ";"
  (raw_string_delimiter)
] @punctuation.delimiter

[
  "{"
  "}"
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  "."
  ".*"
  "->*"
  "~"
  "-"
  "--"
  "-="
  "->"
  "="
  "!"
  "!="
  "|"
  "|="
  "||"
  "^"
  "^="
  "&"
  "&="
  "&&"
  "+"
  "++"
  "+="
  "*"
  "*="
  "/"
  "/="
  "%"
  "%="
  "<<"
  "<<="
  ">>"
  ">>="
  "<"
  "=="
  ">"
  "<="
  ">="
  "<=>"
  "||"
  "?"
] @operator

(conditional_expression ":" @operator)
(user_defined_literal (literal_suffix) @operator)
