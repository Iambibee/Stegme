#!/bin/bash

echo "Welcome, this tool will guid you to hide a text file in image or audio file!"

#Installing steghide tool

if [ -a /usr/bin/steghide ];
then
	echo ""
else
	sudo apt install steghide
fi

#Choose a option

echo "Please enter what you want to do"
CHOICE="Embed_a_file Extract_a_file Get_info_about_stegfile Quit"

select OPTION in $CHOICE;do

#Embed a file
if [ $REPLY = 1 ];
then
	echo "Your choice is $OPTION"
	read -p "Enter the name of cover file(image.jpg/image.png/audio.wav) :" COVER_FILE
	read -p "Enter the text file name what you want to hide or embed(text.txt) :" EMBED_FILE
	steghide --embed -cf $COVER_FILE -ef $EMBED_FILE

#Extract a file
elif [ $REPLY = 2 ];
then
	echo "Your choice is $OPTION"
	read -p "Enter the stegfile(image.jpg) name what you want to extract :" EXTRACT_FILE
	steghide extract -sf $EXTRACT_FILE

#Getting informations about stegfile
elif [ $REPLY = 3 ];
then
	echo "Your choice is $OPTION"
	read -p "Enter the stegfile name what you want to get informations :" INFORMATIONS
	steghide info $INFORMATIONS

#Quit 
elif [ $REPLY = 4 ];
then
	echo "Thank you for use this tool"
	break

#Invalid input
else
	echo "Invalid input,Please enter a valid input"
fi
done
