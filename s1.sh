#! /bin/bash 

x=5 
# Call s2.sh and pass x as an argument 
./s2.sh $x 

# Export x and call s2.sh ( another way to make x available to s2.sh )

export x 
./s2.sh 



