#!/bin/bash

ajouter_tache() {
	#demander la description
	read -p "entrez la description de la tache : " description

	#verifier si le fchier exixte, si non le créer

	if [! -f tasks.txt]; then
		touch tasks.txt
	fi

	#pour généré un ID  automatiquemnet 
	id=$(wc -l < tasks.sh)
	id=$((id +1))

	# ajouter la tache avec statu 0
	echo "$id|$description|0 >> tasks.txt

	echo "tache ajouter avec ID $id"



}

