
<!-- saved from url=(0073)http://www.ks.uiuc.edu/Research/vmd/mailing_list/vmd-l/att-9381/hbond.tcl -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">proc hbond_occupancy { {dis 3} {ang 20} {sel1 protein} {sel2 none} {outfile stdout} {mol top} } {
  if {! [string compare $dis help]} {
     puts "Usage: hbond_occupancy distance angle selection1 selection2 mol"
     return
  }

  if {! [string compare $mol top]} {
     set mol [molinfo top]
  }

  if {[string compare $outfile stdout]} {
     set outfile [open $outfile w];
  }

  set hbondallframes {}
  set hbondcount {}

  if { ! [string compare $sel1 protein]} {
     set sel1 [atomselect $mol $sel1]
  }

  set framenumberbackup [molinfo $mol get frame]
  set numberofframes [molinfo $mol get numframes] 

  for { set i 0 } { $i &lt; $numberofframes } { incr i } {
      molinfo $mol set frame $i

      if {[string compare $sel2 none]} {
         set hbondsingleframe [measure hbonds $dis $ang $sel1 $sel2]
      } else {
         set hbondsingleframe [measure hbonds $dis $ang $sel1]
      }

      for { set j 0 } { $j &lt; [llength [lindex $hbondsingleframe 0] ] } { incr j } {
          set newhbond {}
          lappend newhbond [lindex $hbondsingleframe 0 $j ]
          lappend newhbond [lindex $hbondsingleframe 1 $j ] 
          lappend newhbond [lindex $hbondsingleframe 2 $j ]
          set hbondexist [lsearch $hbondallframes $newhbond]
          if { $hbondexist == -1 } {
             lappend hbondallframes $newhbond
             lappend hbondcount 1
          } else {
             lset hbondcount $hbondexist [expr { [lindex $hbondcount $hbondexist] + 1 } ]
          }
     }
  }

  for { set i 0 } { $i &lt; [llength $hbondallframes] } { incr i } {
      set donor [lindex $hbondallframes $i 0]
      set acceptor [lindex $hbondallframes $i 1]
      set occupancy [expr { 100*[lindex $hbondcount $i]/($numberofframes+0.0) } ]

      if {$i == 0 } {
         puts $outfile "donor \t acceptor \t occupancy"
      }
      puts $outfile [format "%s%i \t %s%i \t\t %.2f%%" [[atomselect $mol "index $donor"] get resname] [[atomselect $mol "index $donor"] get resid] [[atomselect $mol "index $acceptor"] get resname] [[atomselect $mol "index $acceptor"] get resid] $occupancy]
  }

  if {[string compare $outfile stdout]} {
     close $outfile
  }

  molinfo $mol set frame $framenumberbackup
}</pre></body></html>