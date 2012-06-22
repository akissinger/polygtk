(*
  Originally part of PolyChrome:
  
  https://github.com/KidkArolis/PolyChrome
  
  Copyright (c) 2010 Karolis Narkevicius

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
*)


(*******************************************************************************)

(* Example evaluation function: use PolyML's compiler to evaluate a 
   string in ML *)

fun evaluate file_name txt =
  let
    (* uses input and output buffers for compilation and output message *)
    val in_buffer = ref (String.explode txt);
    val out_buffer = ref ([]: string list);
    val current_line = ref 1;

    (* helper function *)
    fun drop_newline s =
    if String.isSuffix "\n" s then String.substring (s, 0, size s - 1)
    else s;

    fun output () = (String.concat (rev (! out_buffer)));

    (* take a charcter out of the input txt string *)
    fun get () =
      (case ! in_buffer of
        [] => NONE
      | c :: cs =>
          (in_buffer := cs; if c = #"\n" then current_line := ! current_line + 1 else (); SOME c));

    (* add to putput buffer *)
    fun put s = (out_buffer := s :: ! out_buffer);
    
    (* handling error messages *)
    fun put_message { message = msg1, hard, location : PolyML.location, 
                      context } =
    let val line_width = 76; in
       (put (if hard then "Error: " else "Warning: ");
        PolyML.prettyPrint (put, line_width) msg1;
        (case context of NONE => () 
         | SOME msg2 => PolyML.prettyPrint (put, line_width) msg2);
         put ("At line " ^ (Int.toString (#startLine location)) ^ "; of file: " 
              ^ file_name ^ "\n"))
    end;

    val compile_params = 
      [(** keep track of line numbers **)
       PolyML.Compiler.CPLineNo (fn () => ! current_line),

       (** the following catches any output during 
          compilation/evaluation and store it in the put stream. **)
       PolyML.Compiler.CPOutStream put,
      
       (** the following handles error messages specially 
          to say where they come from in the error message into 
          the put stream. **)
       PolyML.Compiler.CPErrorMessageProc put_message
      ]

    val _ = 
      (while not (List.null (! in_buffer)) do 
             PolyML.compiler (get, compile_params) ())
      handle exn => (* something went wrong... *)
       (put ("Exception- " ^ General.exnMessage exn ^ " raised"); ()
        (* Can do other stuff here: e.g. raise exn *) );

  (* finally, **return** any messages in the output buffer *)
  in (output ()) end;
