#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Kata Mayo: Lonja <aabilo@gmail.com>

import sys
from lonja import Lonja

def usage(argv):
    '''Imprime cómo utilzar el scrip si si __name__ == "__main__"'''
    print "Usage:\n"
    print argv[0], "<kg_vieira> <kg_pulpo> <kg_centollo> [kg_totales]"
    print "\n\t12mese12katas: Mayo-KataLonja\n\t<aabilio@gmail.com>"
    sys.exit()
            
def main(argv):
    if len(argv) > 5 or len(argv) < 4:
        usage(argv)
    else:
        myLonja = Lonja(int(argv[1]), int(argv[2]), int(argv[3]), int(argv[4]) if len(argv) == 5 else None)
        ciudad, beneficio = myLonja.calcularRentable()
        
        if beneficio < 0:
            print "Ninguna ciudad es rentable. La menos costosa (%d Euros) es %s" % (abs(beneficio), ciudad)
        else:
            print "La ciudad con mayores beneficios (%d Euros) es %s" % (beneficio, ciudad)

if __name__ == "__main__":
    main(sys.argv)
