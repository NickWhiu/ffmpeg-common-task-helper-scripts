i=1

for f in $(gfind "./" -type f -name "*.[jJ][pP][gG]" -printf "%T+\t%p\n" | sort | awk '{print $2}'); do

   printf -v f2 "%06d" $i   

   mv "$f" "$f2.jpg"
   let i++     

done
