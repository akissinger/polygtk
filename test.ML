use "gtk_base.ML";

open GTK
open GTKCallbacks

fun print_my_label cb = let
	val sender = cb_get_sender cb
in TextIO.print ("button clicked: " ^ gtk_button_get_label sender ^ "\n")
end

fun main () = let
  val _ = gtk_init (0,0)
  val win = gtk_window_new 0
  val vbox = gtk_vbox_new (false,0)
  val btn1 = gtk_button_new_with_label "sam"
  val btn2 = gtk_button_new_with_label "widges"
in (
  g_signal_connect (win, "destroy", (fn _ => gtk_main_quit ()));
  g_signal_connect (btn1, "clicked", print_my_label);
  g_signal_connect (btn2, "clicked", print_my_label);
  gtk_container_add (win,vbox);
  gtk_container_add (vbox,btn1);
  gtk_container_add (vbox,btn2);
  map gtk_widget_show [btn1,btn2,vbox,win];
  gtk_main ();
())
end
