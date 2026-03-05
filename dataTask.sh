#!/bin/bash 
initialiser_base() {
	if [ -f "tasks.txt" ]; then
		echo "La base existe deja" 
	else 
		touch tasks.txt 
		echo "La base a ete cree avec succes"
	fi
}
