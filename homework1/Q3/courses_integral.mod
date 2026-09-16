set REQUIREMENTS;
set COURSES;

param points_required{i in REQUIREMENTS};
param points_contributed{i in REQUIREMENTS, j in COURSES};
param effort{j in COURSES};
var select{COURSES} binary;

minimize eff: sum{j in COURSES} effort[j] * select[j];
s.t. fulfil{c in REQUIREMENTS}: sum{j in COURSES} points_contributed[c, j] * select[j] >= points_required[c];

data;

set REQUIREMENTS := NS SS H;
set COURSES :=  ITN THO TUOB ABIT;
param points_required := NS 10 SS 10 H 10;
param points_contributed : ITN THO TUOB ABIT :=
        NS      8   3   5   4
        SS      6   6   3   2
        H       4   8   1   2
;

param effort := ITN 5 THO 5 TUOB 2 ABIT 2;

end;


