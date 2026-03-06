#!/bin/bash
source taskTool.sh
source dataTask.sh


while true; do 
    echo '=========================' 
    echo '  Gestionnaire de taches ' 
    echo '=========================' 
    echo '1 - Initialiser la base' 
    echo '2 - Ajouter une tache' 
    echo '3 - Supprimer une tache' 
    echo '4 - Marquer une tache terminee' 
    echo '5 - Afficher les taches' 
    echo '6 - Sauvegarder la base' 
    echo '7 - Restaurer la base' 
    echo '8 - Supprimer la base' 
    echo '0 - Quitter' 
    echo '========================='
 
    read -p 'Votre choix : ' choix


    
	if [ "$choix" = '1' ]; then 
		initialiser_base 
	elif [ "$choix" = '2' ]; then 
		ajouter_tache
	elif [ "$choix" = '3' ]; then
		supprimer_tache
	elif [ "$choix" = "4" ]; then
		marquer_terminee
	elif [ "$choix" = "5" ]; then
		afficher_toutes_taches
	elif [ "$choix" = "6" ]; then
		sauvegarder_base
	elif [ "$choix" = "7" ]; then
		restaurer_base
	elif [ "$choix" = "8" ]; then
		supprimer_base 
	elif [ "$choix" = '0' ]; then 
		echo 'Au revoir !' 
		break 
	else 
		echo 'Choix invalide.' 
	fi 
done 
