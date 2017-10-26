#sh 

# takes prefix (LBT) notation 
# can be obtained at https://spot.lrde.epita.fr/trans.html
time ltl2dstar --ltl2nba=spin:~/apps/ltl2ba-1.2b1/ltl2ba --stutter=no --bisimulation=no --output=automaton --output-format=hoa prop7-prefix.ltl prop7.hoa
