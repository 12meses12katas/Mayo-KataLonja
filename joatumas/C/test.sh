RES=`./katalonja 50 100 50`;
if [ $RES = "LISBOA" ];then
	echo Primera prova correcta;
else
	echo Primera prova incorrecta;
	exit -1;
fi

RES=`./katalonja 0 200 0`;
if [ $RES = "BARCELONA" ];then
	echo Segona prova correcta;
else
	echo Segona prova incorrecta;
	exit -1;
fi



