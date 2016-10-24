image_list=(/home/batsal/git/who_is_that_pokemon/gen1/*) 
random_image=${image_list[RANDOM % ${#image_list[@]}]}
python /home/batsal/git/who_is_that_pokemon/mistry_pokemon.py $random_image
result="$(echo "$random_image"| rev | cut -d"/" -f1 | rev | cut -d"." -f1)"
# result="$random_image" | rev | cut -d"/" -f1 | rev | cut -d"." -f1`
xcowsay --at=0,0 --image=/home/batsal/git/who_is_that_pokemon/mistry_pokemon.png "WHO'S THAT POKEMON?"
xcowsay --at=0,0 --image=/home/batsal/git/who_is_that_pokemon/actual_pokemon.png  "IT'S $result !"

#xcowsay --image=${image_list[RANDOM % ${#image_list[@]}]} "WELCOME $USER!"
