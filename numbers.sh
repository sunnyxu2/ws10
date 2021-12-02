#!/bin/sh

huge=`echo "2 ^ 31 - 1" | bc`
cut -f $2 $1 | tail -n +2 | awk -v inf=$huge 'BEGIN { total = 0; count = 0; min = inf; max = 0; avg = 0;} { count = count + 1; total = total + $1; if ( $1 < min ) { min = $1 }; if ( $1 > max ) { max = $1 }; } END { avg = total / count; print min, max, avg }'
