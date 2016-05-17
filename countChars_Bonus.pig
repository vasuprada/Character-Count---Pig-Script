A = load './in/';
B = foreach A generate flatten(TOKENIZE((chararray)$0)) as word;
C =  foreach B generate flatten(TOKENIZE(REPLACE(LOWER($0),'','|'),'|')) as letter;
D = FILTER C by (letter matches '.*a.*' or letter matches '.*e.*' or letter matches '.*i.*' or letter matches '.*o.*' or letter matches '.*u.*');
E = group D by letter;
F = foreach E generate COUNT(D), group;
store F into './vowelcount';