#!/bin/bash 
initialiser_base() {
	if [ -f "tasks.txt" ]; then
		echo "La base existe deja" 
	else 
		touch tasks.txt 
		echo "La base a ete cree avec succes"
	fi
}

afficher_toutes_taches() {
	if [ -f "tasks.txt" ]; then
		cat tasks.txt 
	else 
		echo "la base n'existe pas,base non initialise"
	fi
}

sauvegarder_base() {
	if [ -f "tasks.txt" ]; then 
		cp tasks.txt tasks_backup.txt
		echo "sauvegarde creees: tasks_backup.txt"
	else 
		echo "Erreur la base n'existe pas"
	fi
}


