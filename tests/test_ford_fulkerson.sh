#!/bin/bash
echo "*******************************************"
echo "*******************************************"
echo "**Tests de l'algorithme de Ford-Fulkerson**"
echo "*******************************************"
make
echo "### ouverture du graphe ###"
ocamlbuild graph_png.byte
./graph_png.byte tests/graph2 0 7 tests/graph2_init_dot
sleep 2
dot -Tpng tests/graph2_init_dot > tests/graph2_init_png
sleep 2
eog tests/graph2_init_png &
sleep 2

echo "

note comportementale : si plusieurs noeuds sont possibles, l'algo choisi le dernier dans la liste des arcs

"
echo "
----resultat attendu------
noeud 6, cout 2
noeud 7, cout 27
 ------------
 cout_min : 2 
----resultat obtenu-------"

sleep 2
./ftest.byte tests/graph2 0 7 tests/graph2_final_dot
sleep 2
dot -Tpng tests/graph2_final_dot > tests/graph2_final_png
sleep 2
eog tests/graph2_final_png &
sleep 2

