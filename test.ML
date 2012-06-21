use "gtk_base.ML";

open GTK

fun print_hello _ = TextIO.print "hello\n"

fun main () = let
  val _ = gtk_init (0,0)
  val win = gtk_window_new 0
  val _ = g_signal_connect (win, "delete-event", print_hello)
  val _ = g_signal_connect (win, "destroy", (fn _ => gtk_main_quit ()))
  val btn = gtk_button_new_with_label "test"
  val _ = g_signal_connect (btn, "clicked", print_hello)
  val _ = gtk_container_add (win,btn)
  val _ = gtk_widget_show btn
  val _ = gtk_widget_show win
in gtk_main ()
end
