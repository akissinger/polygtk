#include <stdlib.h>
#include <gtk/gtk.h>

struct callback {
  int name;
  struct callback *next;
};

typedef struct callback callback;

static callback *cbs = 0;

void push_callback(int name) {
  callback* cb = malloc(sizeof(callback));
  cb->next = cbs;
  cbs = cb;
  
  cb->name = name;
}

int pop_callback() {
  if (cbs == 0) {
    return -1;
  } else {
    callback *cb = cbs;
    cbs = cbs->next;
    
    int n = cb->name;
    free(cb);
    return n;
  }
}

static int schedule_cb0(GtkWidget *w, gpointer data) {
  int name = *((int*)data);
  push_callback(name);
  free(data);
  return 0;
}

int ml_signal_connect(GtkWidget *w, const char *sig, int cb_name) {
  int *np = malloc(sizeof(int));
  *np = cb_name;
  return g_signal_connect (w, sig, G_CALLBACK (schedule_cb0), np);
}


int times2(int i) {
  return i*2;
}
