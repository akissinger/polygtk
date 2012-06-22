GtkWidget * gtk_entry_new (void);
GtkWidget * gtk_entry_new_with_buffer (GtkEntryBuffer *buffer);
GtkWidget * gtk_entry_new_with_max_length (gint max);
GtkEntryBuffer * gtk_entry_get_buffer (GtkEntry *entry);
void gtk_entry_set_buffer (GtkEntry *entry, GtkEntryBuffer *buffer);
void gtk_entry_set_text (GtkEntry *entry, const gchar *text);
void gtk_entry_append_text (GtkEntry *entry, const gchar *text);
void gtk_entry_prepend_text (GtkEntry *entry, const gchar *text);
void gtk_entry_set_position (GtkEntry *entry, gint position);
const gchar * gtk_entry_get_text (GtkEntry *entry);
guint16 gtk_entry_get_text_length (GtkEntry *entry);
void gtk_entry_select_region (GtkEntry *entry, gint start, gint end);
void gtk_entry_set_visibility (GtkEntry *entry, gboolean visible);
void gtk_entry_set_invisible_char (GtkEntry *entry, gunichar ch);
void gtk_entry_unset_invisible_char (GtkEntry *entry);
void gtk_entry_set_editable (GtkEntry *entry, gboolean editable);
void gtk_entry_set_max_length (GtkEntry *entry, gint max);
gboolean gtk_entry_get_activates_default (GtkEntry *entry);
gboolean gtk_entry_get_has_frame (GtkEntry *entry);
const GtkBorder * gtk_entry_get_inner_border (GtkEntry *entry);
gint gtk_entry_get_width_chars (GtkEntry *entry);
void gtk_entry_set_activates_default (GtkEntry *entry, gboolean setting);
void gtk_entry_set_has_frame (GtkEntry *entry, gboolean setting);
void gtk_entry_set_inner_border (GtkEntry *entry, const GtkBorder *border);
void gtk_entry_set_width_chars (GtkEntry *entry, gint n_chars);
gunichar gtk_entry_get_invisible_char (GtkEntry *entry);
void gtk_entry_set_alignment (GtkEntry *entry, gfloat xalign);
gfloat gtk_entry_get_alignment (GtkEntry *entry);
void gtk_entry_set_overwrite_mode (GtkEntry *entry, gboolean overwrite);
gboolean gtk_entry_get_overwrite_mode (GtkEntry *entry);
PangoLayout * gtk_entry_get_layout (GtkEntry *entry);
void gtk_entry_get_layout_offsets (GtkEntry *entry, gint *x, gint *y);
gint gtk_entry_layout_index_to_text_index(GtkEntry *entry, gint layout_index);
gint gtk_entry_text_index_to_layout_index(GtkEntry *entry, gint text_index);
gint gtk_entry_get_max_length (GtkEntry *entry);
gboolean gtk_entry_get_visibility (GtkEntry *entry);
void gtk_entry_set_completion (GtkEntry *entry, GtkEntryCompletion *completion);
GtkEntryCompletion * gtk_entry_get_completion (GtkEntry *entry);
void gtk_entry_set_cursor_hadjustment (GtkEntry *entry, GtkAdjustment *adjustment);
GtkAdjustment * gtk_entry_get_cursor_hadjustment (GtkEntry *entry);
void gtk_entry_set_progress_fraction (GtkEntry *entry, gdouble fraction);
gdouble gtk_entry_get_progress_fraction (GtkEntry *entry);
void gtk_entry_set_progress_pulse_step (GtkEntry *entry, gdouble fraction);
gdouble gtk_entry_get_progress_pulse_step (GtkEntry *entry);
void gtk_entry_progress_pulse (GtkEntry *entry);
gboolean gtk_entry_im_context_filter_keypress(GtkEntry *entry, GdkEventKey *event);
void gtk_entry_reset_im_context (GtkEntry *entry);
void gtk_entry_set_icon_from_pixbuf (GtkEntry *entry, GtkEntryIconPosition icon_pos, GdkPixbuf *pixbuf);
void gtk_entry_set_icon_from_stock (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *stock_id);
void gtk_entry_set_icon_from_icon_name (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *icon_name);
void gtk_entry_set_icon_from_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos, GIcon *icon);
GtkImageType gtk_entry_get_icon_storage_type (GtkEntry *entry, GtkEntryIconPosition icon_pos);
GdkPixbuf * gtk_entry_get_icon_pixbuf (GtkEntry *entry, GtkEntryIconPosition icon_pos);
const gchar * gtk_entry_get_icon_stock (GtkEntry *entry, GtkEntryIconPosition icon_pos);
const gchar * gtk_entry_get_icon_name (GtkEntry *entry, GtkEntryIconPosition icon_pos);
GIcon * gtk_entry_get_icon_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos);
void gtk_entry_set_icon_activatable (GtkEntry *entry, GtkEntryIconPosition icon_pos, gboolean activatable);
gboolean gtk_entry_get_icon_activatable (GtkEntry *entry, GtkEntryIconPosition icon_pos);
void gtk_entry_set_icon_sensitive (GtkEntry *entry, GtkEntryIconPosition icon_pos, gboolean sensitive);
gboolean gtk_entry_get_icon_sensitive (GtkEntry *entry, GtkEntryIconPosition icon_pos);
gint gtk_entry_get_icon_at_pos (GtkEntry *entry, gint x, gint y);
void gtk_entry_set_icon_tooltip_text (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *tooltip);
gchar * gtk_entry_get_icon_tooltip_text (GtkEntry *entry, GtkEntryIconPosition icon_pos);
void gtk_entry_set_icon_tooltip_markup (GtkEntry *entry, GtkEntryIconPosition icon_pos, const gchar *tooltip);
gchar * gtk_entry_get_icon_tooltip_markup (GtkEntry *entry, GtkEntryIconPosition icon_pos);
void gtk_entry_set_icon_drag_source (GtkEntry *entry, GtkEntryIconPosition icon_pos, GtkTargetList *target_list, GdkDragAction actions);
gint gtk_entry_get_current_icon_drag_source (GtkEntry *entry);
GdkWindow * gtk_entry_get_icon_window (GtkEntry *entry, GtkEntryIconPosition icon_pos);
GdkWindow * gtk_entry_get_text_window (GtkEntry *entry);