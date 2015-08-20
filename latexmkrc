$pdflatex = "xelatex --shell-escape %S";
$pdf_mode = "1";
$hash_calc_ignore_pattern{'aux'} = '\\l@list@run.*';