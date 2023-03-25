#!/bin/bash

# Set the number of times to run the program
N=10
echo "program name | time executing | number of processors | number of iteration" >> timer.txt

mix compile 8 8 8
start=$(date +%s%N)

m=8
printf "Running program1.exs with m=%d\n" $m
for i in $(seq 1 $N); do
	printf "iteration number %d\n" $i
	mix run lib/test.ex "g" "${i}" "${m}" #"g" is a quick fix due to variable argument amount
done


# m=16
# printf "Running program1.exs with m=%d\n" $m
# for i in $(seq 1 $N); do
# 	printf "iteration number %d\n" $i
# 	mix run lib/test.ex "g" "${i}" "${m}" 
# done

# m=8
# printf "Running program1.exs with m=%d\n" $m
# for i in $(seq 1 $N); do
# 	printf "iteration number %d\n" $i
# 	mix run lib/test.ex "g" "${i}" "${m}" 
# done

# m=4
# printf "Running program1.exs with m=%d\n" $m
# for i in $(seq 1 $N); do
# 	printf "iteration number %d\n" $i
# 	mix run lib/test.ex "g" "${i}" "${m}" 
# done

#m=1
#printf "Running program1.exs with m=%d\n" $m
#for i in $(seq 1 $N); do
#	printf "iteration number %d\n" $i
#	numactl --physcpubin=+1 mix run lib/test.ex "g" "${i}" "${m}"
#done


end=$(date +%s%N)    
sum2=$((end-start))



printf "total time elapsed: " $sum2
