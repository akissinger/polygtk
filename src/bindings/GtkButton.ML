
structure GtkButton =
struct
  local
    open CInterface
    open GTKLibs
  in

    (* GtkWidget * gtk_button_new (void); *)
    val gtk_button_new = call1
      (load_sym libgtk "gtk_button_new")
      (VOID) POINTER

    (* GtkWidget * gtk_button_new_with_label (const gchar *label); *)
    val gtk_button_new_with_label = call1
      (load_sym libgtk "gtk_button_new_with_label")
      (STRING) POINTER

    (* GtkWidget * gtk_button_new_with_mnemonic (const gchar *label); *)
    val gtk_button_new_with_mnemonic = call1
      (load_sym libgtk "gtk_button_new_with_mnemonic")
      (STRING) POINTER

    (* GtkWidget * gtk_button_new_from_stock (const gchar *stock_id); *)
    val gtk_button_new_from_stock = call1
      (load_sym libgtk "gtk_button_new_from_stock")
      (STRING) POINTER

    (* void gtk_button_pressed (GtkButton *button); *)
    val gtk_button_pressed = call1
      (load_sym libgtk "gtk_button_pressed")
      (POINTER) VOID

    (* void gtk_button_released (GtkButton *button); *)
    val gtk_button_released = call1
      (load_sym libgtk "gtk_button_released")
      (POINTER) VOID

    (* void gtk_button_clicked (GtkButton *button); *)
    val gtk_button_clicked = call1
      (load_sym libgtk "gtk_button_clicked")
      (POINTER) VOID

    (* void gtk_button_enter (GtkButton *button); *)
    val gtk_button_enter = call1
      (load_sym libgtk "gtk_button_enter")
      (POINTER) VOID

    (* void gtk_button_leave (GtkButton *button); *)
    val gtk_button_leave = call1
      (load_sym libgtk "gtk_button_leave")
      (POINTER) VOID

    (* void gtk_button_set_relief (GtkButton *button, GtkReliefStyle newstyle); *)
    val gtk_button_set_relief = call2
      (load_sym libgtk "gtk_button_set_relief")
      (POINTER,INT) VOID

    (* GtkReliefStyle gtk_button_get_relief (GtkButton *button); *)
    val gtk_button_get_relief = call1
      (load_sym libgtk "gtk_button_get_relief")
      (POINTER) INT

    (* const gchar * gtk_button_get_label (GtkButton *button); *)
    val gtk_button_get_label = call1
      (load_sym libgtk "gtk_button_get_label")
      (POINTER) STRING

    (* void gtk_button_set_label (GtkButton *button, const gchar *label); *)
    val gtk_button_set_label = call2
      (load_sym libgtk "gtk_button_set_label")
      (POINTER,STRING) VOID

    (* gboolean gtk_button_get_use_stock (GtkButton *button); *)
    val gtk_button_get_use_stock = call1
      (load_sym libgtk "gtk_button_get_use_stock")
      (POINTER) BOOL

    (* void gtk_button_set_use_stock (GtkButton *button, gboolean use_stock); *)
    val gtk_button_set_use_stock = call2
      (load_sym libgtk "gtk_button_set_use_stock")
      (POINTER,BOOL) VOID

    (* gboolean gtk_button_get_use_underline (GtkButton *button); *)
    val gtk_button_get_use_underline = call1
      (load_sym libgtk "gtk_button_get_use_underline")
      (POINTER) BOOL

    (* void gtk_button_set_use_underline (GtkButton *button, gboolean use_underline); *)
    val gtk_button_set_use_underline = call2
      (load_sym libgtk "gtk_button_set_use_underline")
      (POINTER,BOOL) VOID

    (* void gtk_button_set_focus_on_click (GtkButton *button, gboolean focus_on_click); *)
    val gtk_button_set_focus_on_click = call2
      (load_sym libgtk "gtk_button_set_focus_on_click")
      (POINTER,BOOL) VOID

    (* gboolean gtk_button_get_focus_on_click (GtkButton *button); *)
    val gtk_button_get_focus_on_click = call1
      (load_sym libgtk "gtk_button_get_focus_on_click")
      (POINTER) BOOL

    (* void gtk_button_set_alignment (GtkButton *button, gfloat xalign, gfloat yalign); *)
    val gtk_button_set_alignment = call3
      (load_sym libgtk "gtk_button_set_alignment")
      (POINTER,FLOAT,FLOAT) VOID

    (* void gtk_button_get_alignment (GtkButton *button, gfloat *xalign, gfloat *yalign); *)
    val gtk_button_get_alignment = call3ret2
      (load_sym libgtk "gtk_button_get_alignment")
      (POINTER) (FLOAT,FLOAT)

    (* void gtk_button_set_image (GtkButton *button, GtkWidget *image); *)
    val gtk_button_set_image = call2
      (load_sym libgtk "gtk_button_set_image")
      (POINTER,POINTER) VOID

    (* GtkWidget * gtk_button_get_image (GtkButton *button); *)
    val gtk_button_get_image = call1
      (load_sym libgtk "gtk_button_get_image")
      (POINTER) POINTER

    (* void gtk_button_set_image_position (GtkButton *button, GtkPositionType position); *)
    val gtk_button_set_image_position = call2
      (load_sym libgtk "gtk_button_set_image_position")
      (POINTER,INT) VOID

    (* GtkPositionType gtk_button_get_image_position (GtkButton *button); *)
    val gtk_button_get_image_position = call1
      (load_sym libgtk "gtk_button_get_image_position")
      (POINTER) INT

    (* GdkWindow * gtk_button_get_event_window (GtkButton *button); *)
    val gtk_button_get_event_window = call1
      (load_sym libgtk "gtk_button_get_event_window")
      (POINTER) POINTER

  end
end
