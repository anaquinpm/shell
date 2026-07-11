COUNT=10

while (( COUNT > 0  )) ; do
    echo -e "$COUNT \c"
    (( COUNT-- ))
done ; echo     # el ultimo echo da el salto de página en el shell
