#This code was completed independently by Nhooja Roy.

set VOTES;
set OTHER_ALTERNATIVES;

param special_score{v in VOTES};
param other_score{v in VOTES, a in OTHER_ALTERNATIVES};

var choose_vote{v in VOTES}, binary;

minimize remove: sum{v in VOTES} choose_vote[v];

s.t. special_wins{a in OTHER_ALTERNATIVES}: sum{v in VOTES} (1 - choose_vote[v]) * special_score[v] >=
                                            sum{v in VOTES} (1 - choose_vote[v]) * other_score[v, a];

# Given Example from Homework 3:
# data;
# set VOTES := v1 v2 v3 v4;
# set OTHER_ALTERNATIVES := a b;
# param special_score := v1 1 v2 1 v3 0 v4 1;
# param other_score: a b :=
# v1 2 0
# v2 2 0
# v3 1 2
# v4 0 2;
# end;


#My Own example from 2:
#Output File produced as expected result with a modified borda score of 0 for a and 1, 1 for b and c.

# #For score of a:
# data;
# set VOTES := v1;
# set OTHER_ALTERNATIVES := b c;
# param special_score := v1 2;
# param other_score: b c :=
# v1 1 0;
# end;

# #For Score of b:
# data;
# set VOTES := v1;
# set OTHER_ALTERNATIVES := a c;
# param special_score := v1 1;
# param other_score: a c :=
# v1 2 0;
# end;

#For Score of c:
data;
set VOTES := v1;
set OTHER_ALTERNATIVES := a b;
param special_score := v1 0;
param other_score: a b :=
v1 2 1;
end;
