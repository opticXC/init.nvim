" Vim syntax file for the Silver programming language
" Language:     Silver
" Maintainer:   Oh My Pi
" Filenames:    *.ag

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword silverKeyword struct enum impl trait fn let mut const
syn keyword silverKeyword if else while for break continue return defer
syn keyword silverKeyword import comptime cast move ref extern pub private
syn keyword silverKeyword asm in macro where priv

" Boolean literals
syn keyword silverBoolean true false

" Built-in primitive types
syn keyword silverType i8 i16 i32 i64 i128
syn keyword silverType u8 u16 u32 u64 u128
syn keyword silverType f32 f64 f80
syn keyword silverType c32 c64 c80
syn keyword silverType bool str char void

" Built-in container types (std library)
syn keyword silverType Vec Optional

" Attributes #[...]
syn region silverAttribute matchgroup=silverAttributeDelim start="\#\[" end="\]"
      \ contains=silverAttributeName,silverString
syn match silverAttributeName "\(\w\|::\)\+" contained

" Comments
syn keyword silverTodo TODO FIXME XXX NOTE HACK contained
syn match silverCommentLine "\/\/.*$" contains=silverTodo
syn region silverCommentBlock start="\/\*" end="\*\/"
      \ contains=silverTodo

" Strings
syn region silverString start="\"" end="\""
      \ contains=silverEscape
syn match silverEscape "\\[nrt0\\'"]" contained
syn match silverEscape "\\x[0-9a-fA-F]\{2}" contained
syn match silverEscape "\\u[0-9a-fA-F]\{4}" contained

" Character literals
syn match silverCharacter "'[^\\]'"
syn match silverCharacter "'\\[nrt0\\'"]'"

" Numbers
syn match silverNumber "\<[0-9][0-9_]*\>"
syn match silverNumber "\<0x[0-9a-fA-F][0-9a-fA-F_]*\>"
syn match silverNumber "\<0o[0-7][0-7_]*\>"
syn match silverNumber "\<0b[01][01_]*\>"
syn match silverFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\([eE][+-]\?[0-9]\+\)\?"
syn match silverFloat "\<[0-9][0-9_]*[eE][+-]\?[0-9]\+"

" Function definitions (fn name)
syn match silverFuncDef "\<fn\s\+[a-zA-Z_][a-zA-Z0-9_]*"
      \ contains=silverKeyword nextgroup=silverFuncName skipwhite
syn match silverFuncName "[a-zA-Z_][a-zA-Z0-9_]*" contained

" Macro definitions (macro name)
syn match silverMacroDef "\<macro\s\+[a-zA-Z_][a-zA-Z0-9_]*"
      \ contains=silverKeyword nextgroup=silverMacroName skipwhite
syn match silverMacroName "[a-zA-Z_][a-zA-Z0-9_]*" contained

" Module path separator (foo::bar)
syn match silverModuleSep "::"

" Operators
syn match silverOperator "->"
syn match silverOperator "=>"
syn match silverOperator "::"
syn match silverOperator "+\|-\|\*\|\/\|%"
syn match silverOperator "==\|!=\|<\||=\|>=\|&&\|||\|!"
syn match silverOperator "&\||\|\^\|<<\|>>"
syn match silverOperator "="

" Delimiters (parens, braces, brackets, semicolon, colon, comma)
syn match silverDelimiter "[{}();:,\[\]]"

" Preprocessor / extern linkage
syn match silverExtern "\<extern\s\+\"\(C\|Silver\|system\)\""
      \ contains=silverKeyword,silverString

" Conditional/loop grouping
syn keyword silverRepeat for while
syn keyword silverConditional if else

" Links
hi def link silverKeyword        Keyword
hi def link silverType           Type
hi def link silverBoolean        Boolean
hi def link silverCommentLine    Comment
hi def link silverCommentBlock   Comment
hi def link silverTodo           Todo
hi def link silverString         String
hi def link silverCharacter      Character
hi def link silverEscape         SpecialChar
hi def link silverNumber         Number
hi def link silverFloat          Float
hi def link silverFuncDef        Keyword
hi def link silverFuncName       Function
hi def link silverMacroDef       Keyword
hi def link silverMacroName      Function
hi def link silverAttribute      PreProc
hi def link silverAttributeDelim PreProc
hi def link silverAttributeName  Identifier
hi def link silverModuleSep      Delimiter
hi def link silverOperator       Operator
hi def link silverDelimiter      Delimiter
hi def link silverExtern         Keyword
hi def link silverRepeat         Repeat
hi def link silverConditional    Conditional
let b:current_syntax = "silver"
