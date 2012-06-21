#include <stdlib.h>
#include <gtk/gtk.h>
#include <stdio.h>

struct callback {
  int fname;
  gpointer sender;
  gpointer *params;
  int n_params;
};

typedef struct callback callback;

struct callback_list {
  callback *cb;
  struct callback_list *next;
};

typedef struct callback_list callback_list;

static GMutex *cbs_lock;
static callback_list *cbs = 0;

void initialize_callbacks() {
  cbs_lock = g_mutex_new();
}

void free_callback(callback *cb) {
  free(cb->params);
  free(cb);
}

void push_callback(callback *cb) {
  g_mutex_lock(cbs_lock);
  
  callback_list *head = malloc(sizeof(callback_list));
  head->cb = cb;
  head->next = cbs;
  cbs = head;
  
  g_mutex_unlock(cbs_lock);
}

void pop_callback(int *fname, callback **cb) {
  g_mutex_lock(cbs_lock);
  
  if (cbs != 0) {
    callback_list *head = cbs;
    cbs = head->next;
    *fname = head->cb->fname;
    *cb = head->cb;
    free(head);
  } else {
    *fname = -1;
    *cb = 0;
  }
  
  g_mutex_unlock(cbs_lock);
}

static int schedule_cb0(gpointer sender, gpointer data) {
  int name = *((int*)data);
  
  callback *cb = malloc(sizeof(callback));
  cb->fname = name;
  cb->sender = sender;
  cb->params = 0;
  cb->n_params = 0;
  
  push_callback(cb);
  return 0;
}

static int schedule_cb1(gpointer sender, gpointer p0, gpointer data) {
  int name = *((int*)data);
  
  callback *cb = malloc(sizeof(callback));
  cb->fname = name;
  cb->sender = sender;
  cb->params = malloc(sizeof(gpointer));
  cb->params[0] = p0;
  cb->n_params = 1;
  
  push_callback(cb);
  return 0;
}

int ml_signal_connect(GtkWidget *w, const char *sig, int cb_name) {
  guint sig_id = g_signal_lookup(sig, G_TYPE_FROM_INSTANCE(w));
  
  GSignalQuery *q = malloc(sizeof(GSignalQuery));
  g_signal_query(sig_id, q);
  
  printf("signal id: %d\n", q->signal_id);
  printf("signal params: %d\n", q->n_params);
  
  int n_params = q->n_params;
  free (q);
  
  int *np = malloc(sizeof(int));
  *np = cb_name;
  
  int hid;
  
  switch (n_params) {
    case 0:
      g_signal_connect (w, sig, G_CALLBACK (schedule_cb0), np);
      break;
    case 1:
      g_signal_connect (w, sig, G_CALLBACK (schedule_cb1), np);
      break;
  }
  
  
  return hid;
}


int times2(int i) {
  return i*2;
}
