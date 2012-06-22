#!/bin/env ruby

require 'readline'

# HACK: GTK standard enums, these will be returned as INTs
ENUMS = [
  'GtkAccelFlags',
  'GtkAnchorType',
  'GtkArrowPlacement',
  'GtkArrowType',
  'GtkAttachOptions',
  'GtkButtonBoxStyle',
  'GtkCornerType',
  'GtkCurveType',
  'GtkDeleteType',
  'GtkDirectionType',
  'GtkExpanderStyle',
  'GtkIMPreeditStyle',
  'GtkIMStatusStyle',
  'GtkJustification',
  'GtkMatchType',
  'GtkMetricType',
  'GtkMovementStep',
  'GtkOrientation',
  'GtkPackType',
  'GtkPathPriorityType',
  'GtkPathType',
  'GtkPolicyType',
  'GtkPositionType',
  'GtkPreviewType',
  'GtkReliefStyle',
  'GtkResizeMode',
  'GtkScrollStep',
  'GtkScrollType',
  'GtkSelectionMode',
  'GtkShadowType',
  'GtkSideType',
  'GtkStateType',
  'GtkSubmenuDirection',
  'GtkSubmenuPlacement',
  'GtkToolbarStyle',
  'GtkUpdateType',
  'GtkVisibility',
  'GtkWindowPosition',
  'GtkWindowType',
  'GtkSortType',
  'GtkDragResult']

def recognize_type(str)
  is_ptr = str.match(/^G(t|d)k\w* \*|^gpointer/) != nil
  
  if is_ptr
    return ["POINTER", str.match(/\*\*/) != nil]
  else
    is_out = str.match(/\*/) != nil
    if str.match(/^g?float/)
      return ["FLOAT",is_out]
    elsif str.match(/^g?double/)
      return ["DOUBLE",is_out]
    elsif str.match(/^g?long/)
      return ["LONG",is_out]
    elsif str.match(/^g?int/)
      return ["INT",is_out]
    elsif str.match(/^guint|^unsigned int/)
      return ["UINT",is_out]
    elsif str.match(/^gboolean/)
      return ["BOOL",is_out]
    elsif str.match(/^(const)? g?char */)
      return ["STRING", str.match(/\*\*/) != nil]
    elsif str.match(/^void/)
      return ["VOID",is_out]
    elsif ENUMS.any? {|e| str.match(/^#{e}/)!=nil}
      return ["INT",is_out]
    else # unrecognized
      return [nil,false]
    end
  end
end

if ARGV[0] == '-f'
  force = true
  header = ARGV[1]
else
  force = false
  header = ARGV[0]
end

struct_name = header[0,header.length-2]

if !force and File.exist?(struct_name + '.ML')
  r = Readline.readline('ML file exists, overwrite? [yN] ')
  if r[0,1].downcase != 'y'
    exit(1)
  end
end

f = File.open(header)

out = File.open(struct_name + '.ML', 'w')

out.puts %{
structure #{struct_name} =
struct
  local
    open CInterface
    open GTKLibs
  in

}

f.each_line do |ln|
  parts = ln.match(/^(.*?)\s*(\w+)\s*\((.*)\);\s*$/)
  
  out.puts "    (* #{ln.strip} *)"
  
  if parts != nil
    type = recognize_type(parts[1])[0]
    name = parts[2]
    args = parts[3].split(',').map{|a| recognize_type(a.strip)}
    
    if type[0] != nil and args.all?{|a|a[1] != nil}
      # partition by the second argument and project it out
      inargs,outargs = (args.partition {|a| !a[1]}).each{|as| as.map!{|a|a[0]}}
      # out.puts inargs.inspect
      # out.puts outargs.inspect
      
      if outargs.empty?
        out.puts %{    val #{name} = call#{inargs.length}}
        out.puts %{      (load_sym libgtk "#{name}")}
        out.puts %{      (#{inargs.join(',')}) #{type}}
      else
        out.puts %{    val #{name} = call#{inargs.length+outargs.length}ret#{outargs.length}}
        out.puts %{      (load_sym libgtk "#{name}")}
        out.puts %{      (#{inargs.join(',')}) (#{outargs.join(',')})}
      end
    else
      out.puts "    (* !!!! WARNING: unrecognized type !!!! *)"
      out.puts "    (* #{[type,name,args].inspect} *)"
      out.puts "    (* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! *)"
    end
    out.puts
  end
end

out.puts %{  end
end
}


out.close()
f.close()
