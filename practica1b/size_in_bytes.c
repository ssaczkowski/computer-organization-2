#include <stdio.h>
#include <stdlib.h>

/* structure superlong */
typedef struct {
long long x0;
long long x1;
} superlong;

typedef struct nodoArbol NodoArbol; /* sinónimo de la estructura nodoArbol */
typedef NodoArbol *ptrNodoArbol; /* sinónimo de NodoArbol* */

/* Prototipo de la clase ASM */
void preOrden(ptrNodoArbol ptrArbol);
void enOrden(ptrNodoArbol ptrArbol);
extern ptrNodoArbol insertaNodo(ptrNodoArbol *ptrArbol, int dato);
extern void print(ptrNodoArbol *ptrArbol);


int main()
{

  char _char;
  short _short;
  int _int;
  long _long;
  long long _longLong;
  superlong _superlong;
  float _float;
  double _double;
  long double _longDouble;

 printf("Size in Bytes \n");

 printf("\n\n");

 printf("\n" + _char.sizeOf());

 return 0;
}


}
