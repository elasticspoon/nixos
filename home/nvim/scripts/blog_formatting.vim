" Reformat Obisdian Callouts for Blog
:%substitute/>[ ]\?\[!WARNING\][-]\? \(.*\)\(\%(\n>.*\)*\)/{: .box-warning .ignore-blockquote }\r\r<!-- prettier-ignore -->\r>**\1**\\\\\2/g
:%substitute/>[ ]\?\[!NOTE\][-]\? \(.*\)\(\%(\n>.*\)*\)/{: .box-note .ignore-blockquote }\r\r<!-- prettier-ignore -->\r>**\1**\\\\\2/g
:write
