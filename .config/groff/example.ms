.so /home/pypaut/.config/groff/macros
.TL
Document title
.AU
Author
.AI
Academy
.AB
This is an abstract.
.AE
.NH
Heading
.NH 2
Heading 2
.SH
Heading (no number)

.\" This is a comment.

.PP
This is a paragraph.
Est-ce qu'une phrase en fran\[,c]ais s'affiche correctement ?
Et avec les accents "\['e]", "\[`e]", "\[`a]" ?
Test : é, è, à, ã, õ ?

.PP
This is a second paragraph. With some
.B bold
text.
.I Italic
text.
.UL "Underlined"
text.
.BX "Boxed"
text. And this is a citation.
.[
anand06
.]
New phrase : \f[CW]test\f[]. \fBTest\fP.

.bp

.QP
This is a quoted paragraph.

.NH 2
List
.BL
Item 1
.BL
Item 2
.BL
Item 3
.NH 2
Mathematics
.EQ
E = mc sup {2}
.EN
.EQ
x != 3 +- 5
.EN
.EQ
M sub {ij}
.EN
.EQ
phi = {1 + sqrt 5} over 2
.EN
.EQ
s = sqrt {
    { 
        sum from i=1 to N ( x sub i - x bar ) sup 2 }
    over {
        N - 1
    }
}
.EN
.EQ
define disc `Delta = b sup 2 -4ac`
.EN
.EQ
disc
.EN
.EQ
delim $$
.EN

I can now add math to my paragraph : $E = mc sup 2$.

.EQ
delim off
.EN

I can now reuse my delimiter freely : $.

.TS
allbox tab(|) center;
c c c.
a|2|1
a|a|a
.TE
