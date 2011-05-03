#include <stdio.h>
#include <stdlib.h>

#define DIST_BCN 1100
#define DIST_MAD 800
#define DIST_LSB 600

void usage(char *prog_name){
	printf("%s Kilos_Vieiras Kilos_Pulpo Kilos_Centollos\n", prog_name);
}
int main(int argc, char **argv){
	long int kilos;
	int valors_mad[3] = {500, 0, 450};
	int valors_bcn[3] = {450, 120, 0};
	int valors_lsb[3] = {600, 100, 500};
	int perdues_mad = -5 - 2 * 2 * DIST_MAD;
	int perdues_bcn = -5 - 2 * 2 * DIST_BCN;
	int perdues_lsb = -5 - 2 * 2 * DIST_LSB;
	double ganancies_mad;
	double ganancies_bcn;
	double ganancies_lsb;
	int i;
	if(argc != 4){
		usage(argv[0]);
		exit(-1);
	}

	for(i = 0; i<3; i++){
		kilos = strtol(argv[i+1], (char **)NULL, 10);
		//printf("kilos: %ld\n", kilos);
		ganancies_mad += kilos * valors_mad[i];
		ganancies_bcn += kilos * valors_bcn[i];
		ganancies_lsb += kilos * valors_lsb[i];
	}
	//printf("%f %f %f\n", ganancies_mad, ganancies_bcn, ganancies_lsb);
	ganancies_mad = ganancies_mad * (1 - (0.01 * (int)(DIST_MAD / 100)));
	ganancies_bcn = ganancies_bcn * (1 - (0.01 * (int)(DIST_BCN / 100)));
	ganancies_lsb = ganancies_lsb * (1 - (0.01 * (int)(DIST_LSB / 100)));
	//printf("%f %f %f\n", ganancies_mad, ganancies_bcn, ganancies_lsb);
	//printf("%d %d %d\n", perdues_mad, perdues_bcn, perdues_lsb);
	ganancies_mad -= perdues_mad;
	ganancies_bcn -= perdues_bcn;
	ganancies_lsb -= perdues_lsb;
	//printf("%f %f %f\n", ganancies_mad, ganancies_bcn, ganancies_lsb);
	if(ganancies_mad > ganancies_bcn && ganancies_mad > ganancies_lsb){
		printf("MADRID");
	}else if(ganancies_bcn > ganancies_mad && ganancies_bcn > ganancies_lsb){
		printf("BARCELONA");
	}else if(ganancies_lsb > ganancies_mad && ganancies_lsb > ganancies_bcn){
		printf("LISBOA");
	}

	exit(0);
}
