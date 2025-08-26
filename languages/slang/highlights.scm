;; Keywords
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

  "namespace"
  "extension"
  "interface"
  "struct"
  "class"

  "goto"
  "catch"
  "as"
  "throw"

  "return"
  "import"
  "module"
  "uniform"

  "as"
  "is"
] @keyword

(this) @keyword

[
  "property"
  "get"
  "set"
] @keyword

;; Special methods
[
  "__init"
  "__subscript"
] @keyword

;; Pre-processor directives
[
  "#include"
  "#define"
  "#ifdef"
  "#ifndef"
  "#if"
  "#else"
  "#elif"
  "#endif"
] @keyword

(true) @boolean
(false) @boolean

;; Types
(primitive_type) @type.builtin
(type_identifier) @type
(placeholder_type_specifier) @type.placeholder

;; Literals
(number_literal) @number
(string_literal) @string
(true) @boolean
(false) @boolean
(this) @variable.builtin

;; Comments
(comment) @comment

;; Functions
(function_declarator
  declarator: (identifier) @function)

(function_declarator
  declarator: (field_identifier) @function)

(template_function
  name: (identifier) @function)

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (field_expression
    field: (field_identifier) @function.method.call))

(preproc_function_def
  name: (identifier) @function.special)

;; Variables
;; (identifier) @variable
;; (field_identifier) @property

(type_hinted_declarator
  (identifier) @variable)

(init_declarator
  declarator: (identifier) @variable)

(parameter_declaration
  declarator: (identifier) @variable.parameter)

;; Structures / Interfaces / Extensions / Classes
(struct_specifier name: (type_identifier) @type)
(interface_specifier name: (type_identifier) @type)
(extension_specifier name: (type_identifier) @type)
(class_specifier name: (type_identifier) @type)

(base_class_clause
  (type_identifier) @type)

;; Namespaces
(namespace_identifier) @namespace

;; Semantics
(bitfield_clause (identifier) @type)
(semantics (identifier) @type)

;; Generics
(interface_requirements
  (identifier) @type)

;; Operators
(binary_expression operator: _ @operator)
(assignment_expression operator: _ @operator)
(update_expression operator: _ @operator)

;; Properties
;; (property_declaration (identifier) @property)
;; (property_get) @keyword
;; (property_set) @keyword

[ "," "." ":" ";" "->" ] @punctuation.delimiter
["(" ")" "[" "]" "{" "}"] @punctuation.bracket
