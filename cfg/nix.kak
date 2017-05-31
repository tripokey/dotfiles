# http://nixos.org/nix
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](nix) %{
    set buffer filetype nix
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

# TODO string interpolation
add-highlighter -group / regions -default code nix \
    string   '"'     (?<!\\)(\\\\)*"      '' \
    string   '\'\''  (?<!\\)(\\\\)*''     '' \
    comment  (#)     $                    '' \
    comment  /\*     \*/                  '' \

add-highlighter -group /nix/string  fill string
add-highlighter -group /nix/comment fill comment

add-highlighter -group /nix/code regex \b(import)\b 0:meta
add-highlighter -group /nix/code regex \b(true|false|null)\b 0:value
add-highlighter -group /nix/code regex \b(rec|let|in|inherit|if|then|else|assert|with)\b 0:keyword

# Commands
# ‾‾‾‾‾‾‾‾

# http://nixos.org/nixpkgs/manual/#chap-conventions

def -hidden nix-filter-around-selections %{
    # remove trailing white spaces
    try %{ exec -draft -itersel <a-x> s \h+$ <ret> d }
}

# TODO fix
def -hidden nix-indent-after "
 exec -draft \\; k x <a-k> ^\\h*(if)|(case\\h+[\\w']+\\h+of|let|in|\\{\\h+\\w+|\\w+\\h+->|[=(])$ <ret> j <a-gt>
"

# TODO fix
def -hidden nix-indent-on-new-line %{
    eval -draft -itersel %{
        # copy -- comments prefix and following white spaces
        try %{ exec -draft k <a-x> s ^\h*\K--\h* <ret> y gh j P }
        # preserve previous line indent
        try %{ exec -draft \; K <a-&> }
        # align to first clause
        try %{ exec -draft \; k x X s ^\h*(if|then|else)?\h*(([\w']+\h+)+=)?\h*(case\h+[\w']+\h+of|let)\h+\K.* <ret> s \`|.\' <ret> & }
        # filter previous line
        try %{ exec -draft k : nix-filter-around-selections <ret> }
        # indent after lines beginning with condition or ending with expression or =(
        try %{ nix-indent-after }
    }
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group nix-highlight global WinSetOption filetype=nix %{ add-highlighter ref nix }

hook global WinSetOption filetype=nix %{
    hook window InsertEnd  .* -group nix-hooks  nix-filter-around-selections
    hook window InsertChar \n -group nix-indent nix-indent-on-new-line
}

hook -group nix-highlight global WinSetOption filetype=(?!nix).* %{ remove-highlighter nix }

hook global WinSetOption filetype=(?!nix).* %{
    remove-hooks window nix-indent
    remove-hooks window nix-hooks
}
