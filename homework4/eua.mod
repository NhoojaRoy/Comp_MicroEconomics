set OUTCOMES;
set PREFERENCES;

param preferred_probability {PREFERENCES, OUTCOMES};
param other_probability {PREFERENCES, OUTCOMES};

var utility {OUTCOMES} >= 0, <= 1;
var margin;

maximize minimum_margin: margin;

s.t. consistency {k in PREFERENCES}: sum {o in OUTCOMES} preferred_probability[k,o] * utility[o] - sum {o in OUTCOMES} other_probability[k,o] * utility[o] >= margin;


data;

set OUTCOMES := A B C D;
set PREFERENCES := 1 2 3 4;

param preferred_probability: A   B  C    D :=
                            1 0.1 0.2 0.3 0.4
                            2 0.4 0.4 0.1 0.1
                            3 0.6 0.1 0.0 0.3
                            4 0.4 0.3 0.2 0.1 ;

param other_probability:   A   B   C   D :=
                        1 0.1 0.2 0.4 0.3
                        2 0.4 0.2 0.2 0.2
                        3 0.4 0.3 0.3 0.0
                        4 0.5 0.5 0.0 0.0 ;

end;