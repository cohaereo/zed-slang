(module_declaration
    "module" @context
    name: (module_name) @name
) @item

(namespace_definition
    "namespace" @context
    name: (namespace_identifier) @name
) @item

(extension_specifier
    "extension" @context
    name: (type_identifier) @name
    (base_class_clause)? @context
) @item

(class_specifier
    "class" @context
    name: (type_identifier) @name
    (base_class_clause)? @context
) @item

(interface_specifier
    "interface" @context
    name: (type_identifier) @name
) @item

(struct_specifier
    "struct" @context
    name: (type_identifier)? @name
    name: (template_type name: (type_identifier) @name)?
) @item

(function_definition
    type: (type_identifier)? @context
    type: (primitive_type)? @context
    declarator: (function_declarator
        declarator: (identifier)? @name
        declarator: (field_identifier)? @name
        declarator: (template_function
            name: (identifier) @name
        )?
        parameters: (parameter_list) @context
        (semantics)? @context
    )
) @item

(subscript_declaration
    "__subscript" @name
    (parameter_list) @context
) @item

(init_declaration
    "__init" @name
    (parameter_list) @context
) @item

(field_declaration
    type: (type_identifier)? @context
    type: (primitive_type)? @context
    declarator: (function_declarator
        declarator: (identifier)? @name
        declarator: (field_identifier)? @name
        declarator: (template_function
            name: (identifier) @name
        )?
        parameters: (parameter_list) @context
    )
) @item

(field_declaration
    type: (primitive_type)? @context
    type: (type_identifier)? @context
    declarator: (field_identifier)? @name
    declarator: (array_declarator)? @context
    (bitfield_clause (identifier))? @context
) @item

(preproc_function_def
    "#define" @context
    (identifier) @name
    parameters: (preproc_params)? @context
) @item

(declaration
    (qualifiers) @context
    type: (template_type)? @context
    type: (type_identifier)? @context
    declarator: (identifier) @name
) @item
