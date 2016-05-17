A = load './in/';
B = foreach A generate flatten(TOKENIZE((chararray)$0,' ')) as word;
C =  foreach B generate flatten(TOKENIZE(REPLACE(LOWER($0),'','|'),'|')) as letter;
D = group C by letter;
E = foreach D generate COUNT(C), group;
store E into './charcount';