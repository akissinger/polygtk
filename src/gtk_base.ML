use "config.ML";
PolyML.SaveState.loadState (Config_.ISAPLIB_HOME ^ "/heaps/all.polyml-heap");


structure GTKLibs =
struct
  val libpolygtk = CInterface.load_lib "libpolygtk.so"
  val libgtk = CInterface.load_lib "libgtk-x11-2.0.so"
end

structure GTKCallbacks =
struct
  structure CBName = SIntName
  datatype callback = CB of CInterface.vol

local
  open GTKLibs
  open CInterface
in
  val ml_signal_connect = call3 (load_sym libpolygtk "ml_signal_connect")
                                (POINTER,STRING,INT) INT
                                
  val cbtab = Unsynchronized.ref CBName.NTab.empty
  val d_thread = Unsynchronized.ref NONE
  
  val cb_init = call0 (load_sym libpolygtk "cb_init") () VOID
  fun cb_pop () = (fn(f,c)=>(f,CB c)) (call2ret2 (load_sym libpolygtk "cb_pop") () (INT,POINTER) ())
  fun cb_get_sender (CB cb) = call1 (load_sym libpolygtk "cb_get_sender") POINTER POINTER cb
  fun cb_free (CB cb) = call1 (load_sym libpolygtk "cb_free") POINTER VOID cb
  
  fun dispatch () =
    case cb_pop () of (~1,_) => () | (n,cb) =>
      let
        val f = CBName.NTab.get (!cbtab) (CBName.mk n)
        val () = f cb
        val () = cb_free cb
      in dispatch ()
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
       | NONE   => (
           cb_init ();
           (d_thread := SOME (Thread.fork (dispatch_loop,[])))
         )
  
  fun register_callback widget signal f = let
      val (nm,cbtab') = (!cbtab) |> CBName.NTab.add (CBName.default_name, f)
      val () = cbtab := cbtab'
    in ml_signal_connect (widget, signal, (CBName.dest nm))
    end
  
end
  
end


structure GTK =
struct

local
  open GTKLibs
  open GTKCallbacks
  open CInterface
in
  
  fun gtk_main () = (
    start_dispatch_loop ();
    call0 (load_sym libgtk "gtk_main") () VOID ()
  )
  
  fun gtk_main_quit () = (
    call0 (load_sym libgtk "gtk_main_quit") () VOID ();
    kill_dispatch_loop ()
  )
  
  fun g_signal_connect (widget,signal,f) = register_callback widget signal f
  
  val gtk_init = call2 (load_sym libgtk "gtk_init") (INT,INT) VOID
  val gtk_window_new = call1 (load_sym libgtk "gtk_window_new") INT POINTER
  val gtk_widget_show = call1 (load_sym libgtk "gtk_widget_show") POINTER VOID
  val gtk_button_new_with_label = call1 (load_sym libgtk "gtk_button_new_with_label") STRING POINTER
  val gtk_button_get_label = call1 (load_sym libgtk "gtk_button_get_label") POINTER STRING
  val gtk_container_add = call2 (load_sym libgtk "gtk_container_add") (POINTER,POINTER) VOID
  val gtk_vbox_new = call2 (load_sym libgtk "gtk_vbox_new") (BOOL,INT) POINTER
  
end

end



