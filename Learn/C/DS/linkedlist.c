#include <stdio.h>
#include <stdlib.h>

struct Ll {
  int val;
  struct Ll *n; // next
};
typedef struct Ll Ll;

Ll *head = NULL;
Ll *curr = NULL;

Ll *create_ll(int v) {
  Ll *ll = (Ll *)malloc(sizeof(Ll));
  if (ll == NULL)
    return NULL;

  ll->val = v;
  ll->n = NULL;
  return ll;
}

Ll *add_ll(int val, Ll *l) { // this function add to beginning only
  if (l == NULL)
    return create_ll(val);
  Ll *new = create_ll(val);
  new->n = l;
  return new;
}

void printll(Ll *l){
        if(l == NULL)
                return;
        printf("%d\n", l->val);
        return printll(l->n);
}

int main(void) {
        Ll* l = create_ll(0);

        for (int i=1; i<10; i++) {
                l = add_ll(i, l);

        }
        printll(l);
        return 0;
}
