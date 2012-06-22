open GTK
open GTKCallbacks


fun print_entry_text entry _ =
  TextIO.print ("Text box says: " ^ gtk_entry_get_text entry ^ "\n")

fun main () = let
  val _ = gtk_init (0,0)
  val win = gtk_window_new 0
  val vbox = gtk_vbox_new (false,0)
  val entry = gtk_entry_new ()
  val btn = gtk_button_new_with_label "send"
  
in (
  g_signal_connect (win, "destroy", (fn _ => gtk_main_quit ()));
  g_signal_connect (btn, "clicked", (print_entry_text entry));
  gtk_container_add (win,vbox);
  gtk_container_add (vbox,entry);
  gtk_container_add (vbox,btn);
  map gtk_widget_show [btn,entry,vbox,win];
  gtk_main ();
())
end
