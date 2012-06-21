PolyML.SaveState.loadState "/users/alek/git/quanto/isaplib/heaps/all.polyml-heap";

structure GTK =
struct

structure CB = SIntName

local
  open CInterface

  val cbtab = Unsynchronized.ref CB.NTab.empty
  val d_thread = Unsynchronized.ref NONE

  val libtest = load_lib "libtest.so"
  val libgtk = load_lib "libgtk-x11-2.0.so"
  val ml_signal_connect = call3 (load_sym libtest "ml_signal_connect")
                                (POINTER,STRING,INT) INT
                                
  val times2 = call1 (load_sym libtest "times2") INT INT
  
  val push_callback = call1 (load_sym libtest "push_callback") INT VOID
  val pop_callback  = call0 (load_sym libtest "pop_callback") () INT
  
  fun dispatch () =
    case pop_callback () of ~1 => () | n  =>
      let
        val f = CB.NTab.get (!cbtab) (CB.mk n)
        val cbtab' = (!cbtab) |> CB.NTab.delete (CB.mk n)
        val () = cbtab := cbtab'
      in (f (); dispatch ())
      end
  
  fun dispatch_loop () = (
    dispatch ();
    OS.Process.sleep (Time.fromMilliseconds 50);
    dispatch_loop (); ())
  
  fun kill_dispatch_loop () =
    case !d_thread of SOME t => (Thread.interrupt t; d_thread := NONE)
                    | NONE   => ()
  
  fun start_dispatch_loop () =
    case !d_thread
      of SOME _ => (kill_dispatch_loop (); start_dispatch_loop ())
       | NONE   => (d_thread := SOME (Thread.fork (dispatch_loop,[])))
in
  
  val gtk_init = call2 (load_sym libgtk "gtk_init") (INT,INT) INT
  val gtk_window_new = call1 (load_sym libgtk "gtk_window_new") INT POINTER
  val gtk_widget_show = call1 (load_sym libgtk "gtk_widget_show") POINTER INT
  
  fun gtk_main () = (
    start_dispatch_loop ();
    call0 (load_sym libgtk "gtk_main") () INT ()
  )
  
  fun gtk_main_quit () = (
    call0 (load_sym libgtk "gtk_main_quit") () INT ();
    kill_dispatch_loop ()
  )
  
  
  fun g_signal_connect widget signal f = let
    val (nm,cbtab') = (!cbtab) |> CB.NTab.add (CB.default_name, f)
    val () = cbtab := cbtab'
  in ml_signal_connect (widget, signal, (CB.dest nm))
  end
end

end

open GTK

fun main () = (
    gtk_init (0,0);
    let val win = gtk_window_new 0 in
    g_signal_connect win "destroy" gtk_main_quit;
    gtk_widget_show win;
    gtk_main () end;
  ())


