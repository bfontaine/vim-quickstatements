" Vim indent file
" Language:     QuickStatements
" Maintainer:   Baptiste Fontaine <b at ptistefontaine.fr>
" Last Changed: 13 Sep 2019

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Spec: https://www.wikidata.org/wiki/Help:QuickStatements#Command_sequence_syntax
" > Each command is on a new line
" > Each statement must consist of an entity, a property, and a value.

" Properties
syn match qsPropertyEntity "P[1-9]\d*"

syn match qsLabel "L[a-z]\{2\}"
syn match qsAlias "A[a-z]\{2\}"
syn match qsDescription "D[a-z]\{2\}"
syn match qsSitelink "S[a-z]\{2,\}wiki"

syn match qsSourceProperty "S\d\+" nextgroup=@qsValue


" Entities
syn match qsItemEntity "Q[1-9]\d*"
syn match qsLexeme "L\d\+"
syn match qsForm "L\d+-F\d+"
syn match qsSense "L\d+-S\d+"
" > An entity can be an item, a property, a lexeme, a form, or a sense.
syn cluster qsEntity contains=qsItemEntity,qsPropertyEntity,qsLexeme,qsForm,qsSense


" Commands
" > You can create new items by inserting a line consisting only of the word 'CREATE'.
syn match qsCreateCommand "^CREATE$"

syn match qsLastCommand "^LAST" nextgroup=qsPropertyEntity skipwhite
syn match qsMergeCommand "^MERGE" nextgroup=qsItemEntity skipwhite
syn match qsRemoveCommand "^-" nextgroup=qsItemEntity

" Values
syn keyword qsSpecialValue somevalue
syn keyword qsSpecialValue novalue

syn region qsString start=+\([a-z]\{2\}:\)\?"+ end=+"+

"                                 quantity (decimals)
"            +/- prefix  quantity (int) |       tolerance v2              tolerance v1                      unit
"                     |      |         /              |                         |                             |
"                     vvvv  vvvv  vvvvvv       vvvvvvvvvvvvvvvvv  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv      vvvvv
syn match qsQuantity "[+-]\?\d\+\(\.\d\+\)\?\(\~\d\+\(\.\d\+\)\?\|\[\d\+\(.\d\+\)\?,\d\+\(\.\d\+\)\?\]\)\?\(U\d\+\)\?"

" +2011-00-00T00:00:00Z/9
"             prefix   YYYY   -   MM          -   DD             T hh    : mm    : ss      /  precision
syn match qsDate "[+-]\d\{4,\}-\(0\d\|1[0-2]\)-\([0-2]\d\|3[01]\)T[0-5]\d:[0-5]\d:[0-5]\dZ\/\(\d\|1[0-4]\)\>"

"                        @<--lat--->/<--lon--->
syn match qsCoordinates "@\d\+\.\d\+/\d\+\.\d\+"

" > A value can be another entity, a string, a time, a location, a quantity, somevalue, novalue
syn cluster qsValue contains=qsItemEntity,qsString,qsTime,qsLocation,qsQuantity,qsSpecialValue

syn match qsComment "/\*.*\*/$"

hi def link qsSourceProperty qsProperty
hi def link qsPropertyEntity qsProperty
hi def link qsLabel          qsProperty
hi def link qsAlias          qsProperty
hi def link qsDescription    qsProperty
hi def link qsSitelink       qsProperty

hi def link qsDate         qsConstant
hi def link qsCoordinates  qsConstant
hi def link qsQuantity     qsConstant

hi def link qsSpecialValue Special

hi def link qsItemEntity   Identifier
hi def link qsLexeme       Identifier
hi def link qsForm         Identifier
hi def link qsSense        Identifier

hi def link qsProperty       Identifier

hi def link qsCreateCommand  qsCommand
hi def link qsLastCommand    qsCommand
hi def link qsMergeCommand   qsCommand
hi def link qsRemoveCommand  qsCommand
hi def link qsCommand        Statement

hi def link qsComment        Comment
hi def link qsConstant       Constant
hi def link qsSpecial        Special
hi def link qsString         String

" Set Current Syntax
" ==================
let b:current_syntax = "quickstatements"

" vim: ts=4
