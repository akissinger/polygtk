
structure GtkEntry =
struct
  local
    open CInterface
    open GTKLibs
  in

    (* GtkWidget * gtk_entry_new (void); *)
    val gtk_entry_new = call1
      (load_sym libgtk "gtk_entry_new")
      (VOID) POINTER

    (* GtkWidget * gtk_entry_new_with_buffer (GtkEntryBuffer *buffer); *)
    val gtk_entry_new_with_buffer = call1
      (load_sym libgtk "gtk_entry_new_with_buffer")
      (POINTER) POINTER

    (* GtkWidget * gtk_entry_new_with_max_length (gint max); *)
    val gtk_entry_new_with_max_length = call1
      (load_sym libgtk "gtk_entry_new_with_max_length")
      (INT) POINTER

    (* GtkEntryBuffer * gtk_entry_get_buffer (GtkEntry *entry); *)
    val gtk_entry_get_buffer = call1
      (load_sym libgtk "gtk_entry_get_buffer")
      (POINTER) POINTER

    (* void gtk_entry_set_buffer (GtkEntry *entry, GtkEntryBuffer *buffer); *)
    val gtk_entry_set_buffer = call2
      (load_sym libgtk "gtk_entry_set_buffer")
      (POINTER,POINTER) VOID

    (* void gtk_entry_set_text (GtkEntry *entry, const gchar *text); *)
    val gtk_entry_set_text = call2
      (load_sym libgtk "gtk_entry_set_text")
      (POINTER,STRING) VOID

    (* void gtk_entry_append_text (GtkEntry *entry, const gchar *text); *)
    val gtk_entry_append_text = call2
      (load_sym libgtk "gtk_entry_append_text")
      (POINTER,STRING) VOID

    (* void gtk_entry_prepend_text (GtkEntry *entry, const gchar *text); *)
    val gtk_entry_prepend_text = call2
      (load_sym libgtk "gtk_entry_prepend_text")
      (POINTER,STRING) VOID

    (* void gtk_entry_set_position (GtkEntry *entry, gint position); *)
    val gtk_entry_set_position = call2
      (load_sym libgtk "gtk_entry_set_position")
      (POINTER,INT) VOID

    (* const gchar * gtk_entry_get_text (GtkEntry *entry); *)
    val gtk_entry_get_text = call1
      (load_sym libgtk "gtk_entry_get_text")
      (POINTER) STRING

    (* guint16 gtk_entry_get_text_length (GtkEntry *entry); *)
    val gtk_entry_get_text_length = call1
      (load_sym libgtk "gtk_entry_get_text_length")
      (POINTER) UINT

    (* void gtk_entry_select_region (GtkEntry *entry, gint start, gint end); *)
    val gtk_entry_select_region = call3
      (load_sym libgtk "gtk_entry_select_region")
      (POINTER,INT,INT) VOID

    (* void gtk_entry_set_visibility (GtkEntry *entry, gboolean visible); *)
    val gtk_entry_set_visibility = call2
      (load_sym libgtk "gtk_entry_set_visibility")
      (POINTER,BOOL) VOID

    (* void gtk_entry_set_invisible_char (GtkEntry *entry, gunichar ch); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* ["VOID", "gtk_entry_set_invisible_char", [["POINTER", false], [nil, false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* void gtk_entry_unset_invisible_char (GtkEntry *entry); *)
    val gtk_entry_unset_invisible_char = call1
      (load_sym libgtk "gtk_entry_unset_invisible_char")
      (POINTER) VOID

    (* void gtk_entry_set_editable (GtkEntry *entry, gboolean editable); *)
    val gtk_entry_set_editable = call2
      (load_sym libgtk "gtk_entry_set_editable")
      (POINTER,BOOL) VOID

    (* void gtk_entry_set_max_length (GtkEntry *entry, gint max); *)
    val gtk_entry_set_max_length = call2
      (load_sym libgtk "gtk_entry_set_max_length")
      (POINTER,INT) VOID

    (* gboolean gtk_entry_get_activates_default (GtkEntry *entry); *)
    val gtk_entry_get_activates_default = call1
      (load_sym libgtk "gtk_entry_get_activates_default")
      (POINTER) BOOL

    (* gboolean gtk_entry_get_has_frame (GtkEntry *entry); *)
    val gtk_entry_get_has_frame = call1
      (load_sym libgtk "gtk_entry_get_has_frame")
      (POINTER) BOOL

    (* const GtkBorder * gtk_entry_get_inner_border (GtkEntry *entry); *)
    val gtk_entry_get_inner_border = call1
      (load_sym libgtk "gtk_entry_get_inner_border")
      (POINTER) POINTER

    (* gint gtk_entry_get_width_chars (GtkEntry *entry); *)
    val gtk_entry_get_width_chars = call1
      (load_sym libgtk "gtk_entry_get_width_chars")
      (POINTER) INT

    (* void gtk_entry_set_activates_default (GtkEntry *entry, gboolean setting); *)
    val gtk_entry_set_activates_default = call2
      (load_sym libgtk "gtk_entry_set_activates_default")
      (POINTER,BOOL) VOID

    (* void gtk_entry_set_has_frame (GtkEntry *entry, gboolean setting); *)
    val gtk_entry_set_has_frame = call2
      (load_sym libgtk "gtk_entry_set_has_frame")
      (POINTER,BOOL) VOID

    (* void gtk_entry_set_inner_border (GtkEntry *entry, const GtkBorder *border); *)
    val gtk_entry_set_inner_border = call2
      (load_sym libgtk "gtk_entry_set_inner_border")
      (POINTER,POINTER) VOID

    (* void gtk_entry_set_width_chars (GtkEntry *entry, gint n_chars); *)
    val gtk_entry_set_width_chars = call2
      (load_sym libgtk "gtk_entry_set_width_chars")
      (POINTER,INT) VOID

    (* gunichar gtk_entry_get_invisible_char (GtkEntry *entry); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* [nil, "gtk_entry_get_invisible_char", [["POINTER", false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* void gtk_entry_set_alignment (GtkEntry *entry, gfloat xalign); *)
    val gtk_entry_set_alignment = call2
      (load_sym libgtk "gtk_entry_set_alignment")
      (POINTER,FLOAT) VOID

    (* gfloat gtk_entry_get_alignment (GtkEntry *entry); *)
    val gtk_entry_get_alignment = call1
      (load_sym libgtk "gtk_entry_get_alignment")
      (POINTER) FLOAT

    (* void gtk_entry_set_overwrite_mode (GtkEntry *entry, gboolean overwrite); *)
    val gtk_entry_set_overwrite_mode = call2
      (load_sym libgtk "gtk_entry_set_overwrite_mode")
      (POINTER,BOOL) VOID

    (* gboolean gtk_entry_get_overwrite_mode (GtkEntry *entry); *)
    val gtk_entry_get_overwrite_mode = call1
      (load_sym libgtk "gtk_entry_get_overwrite_mode")
      (POINTER) BOOL

    (* PangoLayout * gtk_entry_get_layout (GtkEntry *entry); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* [nil, "gtk_entry_get_layout", [["POINTER", false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* void gtk_entry_get_layout_offsets (GtkEntry *entry, gint *x, gint *y); *)
    val gtk_entry_get_layout_offsets = call3ret2
      (load_sym libgtk "gtk_entry_get_layout_offsets")
      (POINTER) (INT,INT)

    (* gint gtk_entry_layout_index_to_text_index(GtkEntry *entry, gint layout_index); *)
    val gtk_entry_layout_index_to_text_index = call2
      (load_sym libgtk "gtk_entry_layout_index_to_text_index")
      (POINTER,INT) INT

    (* gint gtk_entry_text_index_to_layout_index(GtkEntry *entry, gint text_index); *)
    val gtk_entry_text_index_to_layout_index = call2
      (load_sym libgtk "gtk_entry_text_index_to_layout_index")
      (POINTER,INT) INT

    (* gint gtk_entry_get_max_length (GtkEntry *entry); *)
    val gtk_entry_get_max_length = call1
      (load_sym libgtk "gtk_entry_get_max_length")
      (POINTER) INT

    (* gboolean gtk_entry_get_visibility (GtkEntry *entry); *)
    val gtk_entry_get_visibility = call1
      (load_sym libgtk "gtk_entry_get_visibility")
      (POINTER) BOOL

    (* void gtk_entry_set_completion (GtkEntry *entry, GtkEntryCompletion *completion); *)
    val gtk_entry_set_completion = call2
      (load_sym libgtk "gtk_entry_set_completion")
      (POINTER,POINTER) VOID

    (* GtkEntryCompletion * gtk_entry_get_completion (GtkEntry *entry); *)
    val gtk_entry_get_completion = call1
      (load_sym libgtk "gtk_entry_get_completion")
      (POINTER) POINTER

    (* void gtk_entry_set_cursor_hadjustment (GtkEntry *entry, GtkAdjustment *adjustment); *)
    val gtk_entry_set_cursor_hadjustment = call2
      (load_sym libgtk "gtk_entry_set_cursor_hadjustment")
      (POINTER,POINTER) VOID

    (* GtkAdjustment * gtk_entry_get_cursor_hadjustment (GtkEntry *entry); *)
    val gtk_entry_get_cursor_hadjustment = call1
      (load_sym libgtk "gtk_entry_get_cursor_hadjustment")
      (POINTER) POINTER

    (* void gtk_entry_set_progress_fraction (GtkEntry *entry, gdouble fraction); *)
    val gtk_entry_set_progress_fraction = call2
      (load_sym libgtk "gtk_entry_set_progress_fraction")
      (POINTER,DOUBLE) VOID

    (* gdouble gtk_entry_get_progress_fraction (GtkEntry *entry); *)
    val gtk_entry_get_progress_fraction = call1
      (load_sym libgtk "gtk_entry_get_progress_fraction")
      (POINTER) DOUBLE

    (* void gtk_entry_set_progress_pulse_step (GtkEntry *entry, gdouble fraction); *)
    val gtk_entry_set_progress_pulse_step = call2
      (load_sym libgtk "gtk_entry_set_progress_pulse_step")
      (POINTER,DOUBLE) VOID

    (* gdouble gtk_entry_get_progress_pulse_step (GtkEntry *entry); *)
    val gtk_entry_get_progress_pulse_step = call1
      (load_sym libgtk "gtk_entry_get_progress_pulse_step")
      (POINTER) DOUBLE

    (* void gtk_entry_progress_pulse (GtkEntry *entry); *)
    val gtk_entry_progress_pulse = call1
      (load_sym libgtk "gtk_entry_progress_pulse")
      (POINTER) VOID

    (* gboolean gtk_entry_im_context_filter_keypress(GtkEntry *entry, GdkEventKey *event); *)
    val gtk_entry_im_context_filter_keypress = call2
      (load_sym libgtk "gtk_entry_im_context_filter_keypress")
      (POINTER,POINTER) BOOL

    (* void gtk_entry_reset_im_context (GtkEntry *entry); *)
    val gtk_entry_reset_im_context = call1
      (load_sym libgtk "gtk_entry_reset_im_context")
      (POINTER) VOID

    (* void gtk_entry_set_icon_from_pixbuf (GtkEntry *entry, GtkEntryIconPosition icon_pos, GdkPixbuf *pixbuf); *)
    val gtk_entry_set_icon_from_pixbuf = call3
      (load_sym libgtk "gtk_entry_set_icon_from_pixbuf")
      (POINTER,INT,POINTER) VOID

    (* void gtk_entry_set_icon_from_stock (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *stock_id); *)
    val gtk_entry_set_icon_from_stock = call3
      (load_sym libgtk "gtk_entry_set_icon_from_stock")
      (POINTER,INT,STRING) VOID

    (* void gtk_entry_set_icon_from_icon_name (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *icon_name); *)
    val gtk_entry_set_icon_from_icon_name = call3
      (load_sym libgtk "gtk_entry_set_icon_from_icon_name")
      (POINTER,INT,STRING) VOID

    (* void gtk_entry_set_icon_from_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos, GIcon *icon); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* ["VOID", "gtk_entry_set_icon_from_gicon", [["POINTER", false], ["INT", false], [nil, false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* GtkImageType gtk_entry_get_icon_storage_type (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* [nil, "gtk_entry_get_icon_storage_type", [["POINTER", false], ["INT", false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* GdkPixbuf * gtk_entry_get_icon_pixbuf (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_pixbuf = call2
      (load_sym libgtk "gtk_entry_get_icon_pixbuf")
      (POINTER,INT) POINTER

    (* const gchar * gtk_entry_get_icon_stock (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_stock = call2
      (load_sym libgtk "gtk_entry_get_icon_stock")
      (POINTER,INT) STRING

    (* const gchar * gtk_entry_get_icon_name (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_name = call2
      (load_sym libgtk "gtk_entry_get_icon_name")
      (POINTER,INT) STRING

    (* GIcon * gtk_entry_get_icon_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* [nil, "gtk_entry_get_icon_gicon", [["POINTER", false], ["INT", false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* void gtk_entry_set_icon_activatable (GtkEntry *entry, GtkEntryIconPosition icon_pos, gboolean activatable); *)
    val gtk_entry_set_icon_activatable = call3
      (load_sym libgtk "gtk_entry_set_icon_activatable")
      (POINTER,INT,BOOL) VOID

    (* gboolean gtk_entry_get_icon_activatable (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_activatable = call2
      (load_sym libgtk "gtk_entry_get_icon_activatable")
      (POINTER,INT) BOOL

    (* void gtk_entry_set_icon_sensitive (GtkEntry *entry, GtkEntryIconPosition icon_pos, gboolean sensitive); *)
    val gtk_entry_set_icon_sensitive = call3
      (load_sym libgtk "gtk_entry_set_icon_sensitive")
      (POINTER,INT,BOOL) VOID

    (* gboolean gtk_entry_get_icon_sensitive (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_sensitive = call2
      (load_sym libgtk "gtk_entry_get_icon_sensitive")
      (POINTER,INT) BOOL

    (* gint gtk_entry_get_icon_at_pos (GtkEntry *entry, gint x, gint y); *)
    val gtk_entry_get_icon_at_pos = call3
      (load_sym libgtk "gtk_entry_get_icon_at_pos")
      (POINTER,INT,INT) INT

    (* void gtk_entry_set_icon_tooltip_text (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *tooltip); *)
    val gtk_entry_set_icon_tooltip_text = call3
      (load_sym libgtk "gtk_entry_set_icon_tooltip_text")
      (POINTER,INT,STRING) VOID

    (* gchar * gtk_entry_get_icon_tooltip_text (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_tooltip_text = call2
      (load_sym libgtk "gtk_entry_get_icon_tooltip_text")
      (POINTER,INT) STRING

    (* void gtk_entry_set_icon_tooltip_markup (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *tooltip); *)
    val gtk_entry_set_icon_tooltip_markup = call3
      (load_sym libgtk "gtk_entry_set_icon_tooltip_markup")
      (POINTER,INT,STRING) VOID

    (* gchar * gtk_entry_get_icon_tooltip_markup (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_tooltip_markup = call2
      (load_sym libgtk "gtk_entry_get_icon_tooltip_markup")
      (POINTER,INT) STRING

    (* void gtk_entry_set_icon_drag_source (GtkEntry *entry, GtkEntryIconPosition icon_pos, GtkTargetList *target_list, GdkDragAction actions); *)
    (* !!!! WARNING: unrecognized type !!!! *)
    (* ["VOID", "gtk_entry_set_icon_drag_source", [["POINTER", false], ["INT", false], ["POINTER", false], [nil, false]]] *)
    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)

    (* gint gtk_entry_get_current_icon_drag_source (GtkEntry *entry); *)
    val gtk_entry_get_current_icon_drag_source = call1
      (load_sym libgtk "gtk_entry_get_current_icon_drag_source")
      (POINTER) INT

    (* GdkWindow * gtk_entry_get_icon_window (GtkEntry *entry, GtkEntryIconPosition icon_pos); *)
    val gtk_entry_get_icon_window = call2
      (load_sym libgtk "gtk_entry_get_icon_window")
      (POINTER,INT) POINTER

    (* GdkWindow * gtk_entry_get_text_window (GtkEntry *entry); *)
    val gtk_entry_get_text_window = call1
      (load_sym libgtk "gtk_entry_get_text_window")
      (POINTER) POINTER

  end
end
