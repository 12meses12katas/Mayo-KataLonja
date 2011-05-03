#include <stdio.h>
#include <stdlib.h>

void usage(char *prog_name){
	printf("%s Kilos_Vieiras Kilos_Pulpo Kilos_Centollos\n", prog_name);
}
int main(int argc, char **argv){
	long int kilos;
	int valors[3][3] = {{500, 0, 450},{450, 120, 0},{600, 100, 500}};
	int dists[3] = {800, 1100, 600};
	int perdues[3];
	double ganancies[3];
	int i, j, max;

	if(argc != 4){
		usage(argv[0]);
		exit(-1);
	}

	//Read for load
	for(i = 0; i<3; i++){
		kilos = strtol(argv[i+1], (char **)NULL, 10);
		//printf("kilos: %ld\n", kilos);
		//And calculate neat value for each market:
		for(j = 0; j<3; j++){
			ganancies[j] += kilos * valors[j][i];
		}
	}
	//printf("%f %f %f\n", ganancies_mad, ganancies_bcn, ganancies_lsb);

	//Devaluate the neat value
	for(j = 0; j<3; j++){
		ganancies[j] = ganancies[j] * (1 - (0.01 * (int)(dists[j] / 100)));
	}
	//printf("%f %f %f\n", ganancies_mad, ganancies_bcn, ganancies_lsb);
	//printf("%d %d %d\n", perdues_mad, perdues_bcn, perdues_lsb);

	//Loses for transport
	for(j = 0; j<3; j++){
		ganancies[j] -= 5 + 2*2*dists[j];
	}

	//Search for greatest:
	max = 0;
	for(j = 1; j<3; j++){
		if(ganancies[j]>ganancies[max]){
			max = j;
		}
	}
	switch(max){
		case 0:
			printf("MADRID");
			break;
		case 1:
			printf("BARCELONA");
			break;
		case 2:
		default:
			printf("LISBOA");
			break;
	}
	exit(0);
}
