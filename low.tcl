# ======================================================================
# Definir las opciones del hardware y los nodos para 20 vehiculos
# ======================================================================
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/Nakagami       ;# radio-propagation
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             20                          ;# number of mobilenodes
set val(rp)             OLSR                       ;# routing protocol
set opt(x)              1041
set opt(y)              762
set opt(stop)           120                       ;# time to stop simulation
# ======================================================================
#Programa Principal
# ======================================================================
#Configuraciones basicas para la VANET
Antenna/OmniAntenna set Gt_ 18.0
Antenna/OmniAntenna set Gr_ 18.0
Phy/WirelessPhy set bandwidth_ 11Mb

#Frequencia (2.4 GHz 802.11b)
Phy/WirelessPhy set freq_ 5.8e+9

Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set basicRate_ 6Mb
#COnfigurar la inicializacion del simulador
set ns_         [new Simulator]
set tracefd     [open low_trace.tr w]
$ns_ trace-all $tracefd
#Configurar network animation
set namtrace        [open low_nam.nam w]
$ns_ namtrace-all-wireless $namtrace $opt(x) $opt(y)
#COnfigurar el espacio fiscio a representar
set topo        [new Topography]
$topo load_flatgrid $opt(x) $opt(y)
#God
create-god $val(nn)
#Configuracion general de cada nodo
$ns_ node-config -adhocRouting $val(rp) \
                 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
                 -channelType $val(chan) \
                 -topoInstance $topo \
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON \
                 -macTrace ON
for {set i 0} {$i < $val(nn)} {incr i} {
    set node_($i) [$ns_ node]
#Deshabilitar el movimiento aleatorio de los nodos
    $node_($i) random-motion 0;
}
#Definir las coordenadas iniciales de cada uno de los nodos(vehiculos) en el escenario urbano -> esta configuracion se extrae de movility.tcl
#vehiculo 0
$node_(0) set X_ 845.14
$node_(0) set Y_ 377.98
$node_(0) set Z_ 0.0
#vehiculo 1
$node_(1) set X_ 254.32
$node_(1) set Y_ 399.17
$node_(1) set Z_ 0.0
#vehiculo 2
$node_(2) set X_ 425.21
$node_(2) set Y_ 546.8
$node_(2) set Z_ 0.0
#vehiculo 3
$node_(3) set X_ 851.49
$node_(3) set Y_ 397.99
$node_(3) set Z_ 0.0
#vehiculo 4
$node_(4) set X_ 638.68
$node_(4) set Y_ 232.67
$node_(4) set Z_ 0.0
#vehiculo 5
$node_(5) set X_ 629.95
$node_(5) set Y_ 524.98
$node_(5) set Z_ 0.0
#vehiculo 6
$node_(6) set X_ 220.98
$node_(6) set Y_ 168.64
$node_(6) set Z_ 0.0
#vehiculo 7
$node_(7) set X_ 432.91
$node_(7) set Y_ 470.91
$node_(7) set Z_ 0.0
#vehiculo 8
$node_(8) set X_ 414.15
$node_(8) set Y_ 410.87
$node_(8) set Z_ 0.0
#vehiculo 9
$node_(9) set X_ 835.29
$node_(9) set Y_ 292.14
$node_(9) set Z_ 0.0
#vehiculo 10
$node_(10) set X_ 759.37
$node_(10) set Y_ 394.9
$node_(10) set Z_ 0.0
#vehiculo 11
$node_(11) set X_ 874.65
$node_(11) set Y_ 490.19
$node_(11) set Z_ 0.0
#vehiculo 12
$node_(12) set X_ 851.49
$node_(12) set Y_ 397.99
$node_(12) set Z_ 0.0
#vehiculo 13
$node_(13) set X_ 737.62
$node_(13) set Y_ 171.84
$node_(13) set Z_ 0.0
#vehiculo 14
$node_(14) set X_ 616.44
$node_(14) set Y_ 212.01
$node_(14) set Z_ 0.0
#vehiculo 15
$node_(15) set X_ 758.61
$node_(15) set Y_ 737.07
$node_(15) set Z_ 0.0
#vehiculo 16
$node_(16) set X_ 220.98
$node_(16) set Y_ 168.64
$node_(16) set Z_ 0.0
#vehiculo 17
$node_(17) set X_ 679.24
$node_(17) set Y_ 301.14
$node_(17) set Z_ 0.0
#vehiculo 18
$node_(18) set X_ 834.03
$node_(18) set Y_ 400.87
$node_(18) set Z_ 0.0
#vehiculo 19
$node_(19) set X_ 776.27
$node_(19) set Y_ 506.88
$node_(19) set Z_ 0.0
#Definir el moviemiento de los nodos(vehiculos) de acuerdo con la informacion del escenario urbano -> esta configuracion se extrae de movility.tcl
#trayectoria 0
$ns_ at 0.0 "$node_(0) setdest 845.14 377.98 0.00"
$ns_ at 1.0 "$node_(0) setdest 847.11 377.65 1.99"
$ns_ at 2.0 "$node_(0) setdest 850.49 377.08 3.43"
$ns_ at 3.0 "$node_(0) setdest 854.96 376.23 4.55"
#trayectoria 1
$ns_ at 3.0 "$node_(1) setdest 254.32 399.17 26.07"
$ns_ at 4.0 "$node_(0) setdest 859.69 371.85 6.75"
$ns_ at 4.0 "$node_(1) setdest 278.6 406.62 25.43"
$ns_ at 5.0 "$node_(0) setdest 864.75 365.64 8.13"
$ns_ at 5.0 "$node_(1) setdest 302.95 415.58 25.95"
$ns_ at 6.0 "$node_(0) setdest 873.93 362.86 9.76"
$ns_ at 6.0 "$node_(1) setdest 325.52 423.72 24.00"
#trayectoria 2
$ns_ at 6.0 "$node_(2) setdest 425.21 546.8 0.00"
$ns_ at 7.0 "$node_(0) setdest 885.12 362.68 11.40"
$ns_ at 7.0 "$node_(1) setdest 344.44 428.46 19.50"
$ns_ at 7.0 "$node_(2) setdest 426.92 546.84 1.71"
$ns_ at 8.0 "$node_(0) setdest 896.09 368.49 13.58"
$ns_ at 8.0 "$node_(1) setdest 358.99 432.11 15.00"
$ns_ at 8.0 "$node_(2) setdest 430.36 546.92 3.44"
$ns_ at 9.0 "$node_(0) setdest 905.81 379.38 16.02"
$ns_ at 9.0 "$node_(1) setdest 369.5 434.74 10.83"
$ns_ at 9.0 "$node_(2) setdest 435.57 546.83 5.21"
#trayectoria 3
$ns_ at 9.0 "$node_(3) setdest 851.49 397.99 0.00"
$ns_ at 10.0 "$node_(0) setdest 902.44 397.08 18.36"
$ns_ at 10.0 "$node_(1) setdest 377.68 436.8 8.44"
$ns_ at 10.0 "$node_(2) setdest 442.13 546.69 6.56"
$ns_ at 10.0 "$node_(3) setdest 850.2 398.17 1.30"
$ns_ at 11.0 "$node_(0) setdest 892.04 405.82 13.91"
$ns_ at 11.0 "$node_(1) setdest 382.8 437.95 5.26"
$ns_ at 11.0 "$node_(2) setdest 450.74 546.51 8.61"
$ns_ at 11.0 "$node_(3) setdest 847.27 398.58 2.96"
$ns_ at 12.0 "$node_(0) setdest 879.12 406.0 13.18"
$ns_ at 12.0 "$node_(1) setdest 389.33 436.22 7.77"
$ns_ at 12.0 "$node_(2) setdest 460.95 546.3 10.21"
$ns_ at 12.0 "$node_(3) setdest 842.39 399.31 4.93"
#trayectoria 4
$ns_ at 12.0 "$node_(4) setdest 638.68 232.67 0.00"
$ns_ at 13.0 "$node_(0) setdest 868.66 405.54 10.25"
$ns_ at 13.0 "$node_(1) setdest 395.94 428.22 9.68"
$ns_ at 13.0 "$node_(2) setdest 473.02 546.04 12.07"
$ns_ at 13.0 "$node_(3) setdest 836.13 400.46 6.36"
$ns_ at 13.0 "$node_(4) setdest 639.6 234.42 1.98"
$ns_ at 14.0 "$node_(0) setdest 861.7 399.33 8.66"
$ns_ at 14.0 "$node_(1) setdest 407.32 423.29 12.15"
$ns_ at 14.0 "$node_(2) setdest 486.98 545.75 13.97"
$ns_ at 14.0 "$node_(3) setdest 827.95 402.08 8.34"
$ns_ at 14.0 "$node_(4) setdest 641.32 237.66 3.67"
#trayectoria 5
$ns_ at 14.0 "$node_(5) setdest 629.95 524.98 0.00"
$ns_ at 15.0 "$node_(0) setdest 855.63 397.41 6.74"
$ns_ at 15.0 "$node_(1) setdest 422.56 422.34 14.49"
$ns_ at 15.0 "$node_(2) setdest 500.17 545.48 13.19"
$ns_ at 15.0 "$node_(3) setdest 817.81 404.1 10.34"
$ns_ at 15.0 "$node_(4) setdest 643.65 242.07 5.00"
$ns_ at 15.0 "$node_(5) setdest 628.42 525.2 1.55"
$ns_ at 16.0 "$node_(0) setdest 847.43 398.56 8.28"
$ns_ at 16.0 "$node_(1) setdest 437.08 432.48 16.00"
$ns_ at 16.0 "$node_(2) setdest 513.33 544.5 13.21"
$ns_ at 16.0 "$node_(3) setdest 805.96 406.45 12.08"
$ns_ at 16.0 "$node_(4) setdest 647.16 248.71 7.51"
$ns_ at 16.0 "$node_(5) setdest 625.26 525.64 3.19"
$ns_ at 17.0 "$node_(0) setdest 837.07 400.27 10.51"
$ns_ at 17.0 "$node_(1) setdest 452.66 440.3 18.18"
$ns_ at 17.0 "$node_(2) setdest 526.31 542.9 13.08"
$ns_ at 17.0 "$node_(3) setdest 792.81 409.06 13.41"
$ns_ at 17.0 "$node_(4) setdest 651.64 257.18 9.58"
$ns_ at 17.0 "$node_(5) setdest 619.67 526.44 5.64"
#trayectoria 6
$ns_ at 17.0 "$node_(6) setdest 220.98 168.64 0.00"
$ns_ at 18.0 "$node_(0) setdest 824.39 402.79 12.93"
$ns_ at 18.0 "$node_(1) setdest 472.86 440.22 20.20"
$ns_ at 18.0 "$node_(2) setdest 539.78 541.14 13.58"
$ns_ at 18.0 "$node_(3) setdest 777.36 412.13 15.75"
$ns_ at 18.0 "$node_(4) setdest 656.83 266.98 11.09"
$ns_ at 18.0 "$node_(5) setdest 612.34 527.48 7.40"
$ns_ at 18.0 "$node_(6) setdest 222.28 169.11 1.38"
$ns_ at 19.0 "$node_(0) setdest 809.73 405.7 14.95"
$ns_ at 19.0 "$node_(1) setdest 495.2 439.76 22.35"
$ns_ at 19.0 "$node_(2) setdest 553.47 539.34 13.82"
$ns_ at 19.0 "$node_(3) setdest 760.59 415.46 17.10"
$ns_ at 19.0 "$node_(4) setdest 662.92 278.41 12.95"
$ns_ at 19.0 "$node_(5) setdest 602.82 528.83 9.61"
$ns_ at 19.0 "$node_(6) setdest 224.83 170.01 2.70"
$ns_ at 20.0 "$node_(0) setdest 793.3 408.96 16.74"
$ns_ at 20.0 "$node_(1) setdest 518.89 438.08 23.75"
$ns_ at 20.0 "$node_(2) setdest 566.47 537.37 13.15"
$ns_ at 20.0 "$node_(3) setdest 741.73 419.22 19.24"
$ns_ at 20.0 "$node_(4) setdest 669.48 290.16 13.46"
$ns_ at 20.0 "$node_(5) setdest 592.3 530.33 10.62"
$ns_ at 20.0 "$node_(6) setdest 228.74 171.39 4.14"
#trayectoria 7
$ns_ at 20.0 "$node_(7) setdest 432.91 470.91 0.00"
$ns_ at 21.0 "$node_(0) setdest 775.45 412.51 18.20"
$ns_ at 21.0 "$node_(1) setdest 544.54 434.02 25.97"
$ns_ at 21.0 "$node_(2) setdest 579.15 535.43 12.84"
$ns_ at 21.0 "$node_(3) setdest 721.09 423.14 21.00"
$ns_ at 21.0 "$node_(4) setdest 675.82 301.56 13.04"
$ns_ at 21.0 "$node_(5) setdest 581.41 531.87 11.00"
$ns_ at 21.0 "$node_(6) setdest 234.97 173.85 6.69"
$ns_ at 21.0 "$node_(7) setdest 431.65 472.33 1.79"
$ns_ at 22.0 "$node_(0) setdest 755.09 416.56 20.76"
$ns_ at 22.0 "$node_(1) setdest 569.72 429.55 25.58"
$ns_ at 22.0 "$node_(2) setdest 592.44 533.54 13.42"
$ns_ at 22.0 "$node_(3) setdest 698.45 426.98 22.97"
$ns_ at 22.0 "$node_(4) setdest 679.96 309.05 8.56"
$ns_ at 22.0 "$node_(5) setdest 570.79 533.42 10.73"
$ns_ at 22.0 "$node_(6) setdest 243.43 177.27 9.11"
$ns_ at 22.0 "$node_(7) setdest 428.07 474.14 3.76"
$ns_ at 23.0 "$node_(0) setdest 732.75 420.94 22.77"
$ns_ at 23.0 "$node_(1) setdest 594.08 424.86 24.80"
$ns_ at 23.0 "$node_(2) setdest 605.24 531.72 12.93"
$ns_ at 23.0 "$node_(3) setdest 673.78 431.85 25.15"
$ns_ at 23.0 "$node_(4) setdest 681.97 312.69 4.16"
$ns_ at 23.0 "$node_(5) setdest 559.97 535.24 10.97"
$ns_ at 23.0 "$node_(6) setdest 253.45 181.35 10.80"
$ns_ at 23.0 "$node_(7) setdest 422.85 476.79 5.49"
#trayectoria 8
$ns_ at 23.0 "$node_(8) setdest 414.15 410.87 0.00"
$ns_ at 24.0 "$node_(0) setdest 708.63 425.28 24.50"
$ns_ at 24.0 "$node_(1) setdest 619.64 420.13 25.99"
$ns_ at 24.0 "$node_(2) setdest 618.55 529.83 13.44"
$ns_ at 24.0 "$node_(3) setdest 647.74 437.01 26.54"
$ns_ at 24.0 "$node_(4) setdest 683.69 317.14 4.83"
$ns_ at 24.0 "$node_(5) setdest 548.87 536.72 11.19"
$ns_ at 24.0 "$node_(6) setdest 264.85 185.99 12.30"
$ns_ at 24.0 "$node_(7) setdest 415.28 477.84 7.38"
$ns_ at 24.0 "$node_(8) setdest 414.11 408.41 2.47"
$ns_ at 25.0 "$node_(0) setdest 682.54 430.11 26.55"
$ns_ at 25.0 "$node_(1) setdest 644.92 415.58 25.68"
$ns_ at 25.0 "$node_(2) setdest 627.5 528.55 9.04"
$ns_ at 25.0 "$node_(3) setdest 620.33 442.39 27.94"
$ns_ at 25.0 "$node_(4) setdest 680.27 320.6 5.40"
$ns_ at 25.0 "$node_(5) setdest 537.55 538.2 11.42"
$ns_ at 25.0 "$node_(6) setdest 278.16 191.42 14.35"
$ns_ at 25.0 "$node_(7) setdest 405.13 476.56 9.88"
$ns_ at 25.0 "$node_(8) setdest 414.05 404.37 4.05"
#trayectoria 9
$ns_ at 25.0 "$node_(9) setdest 835.29 292.14 0.00"
$ns_ at 26.0 "$node_(0) setdest 654.34 435.7 28.74"
$ns_ at 26.0 "$node_(1) setdest 669.71 411.12 25.18"
$ns_ at 26.0 "$node_(2) setdest 633.16 527.75 5.72"
$ns_ at 26.0 "$node_(3) setdest 591.11 447.51 29.67"
$ns_ at 26.0 "$node_(4) setdest 674.53 321.77 5.85"
$ns_ at 26.0 "$node_(5) setdest 527.36 539.54 10.28"
$ns_ at 26.0 "$node_(6) setdest 293.16 197.53 16.18"
$ns_ at 26.0 "$node_(7) setdest 394.3 469.67 12.26"
$ns_ at 26.0 "$node_(8) setdest 413.96 398.4 5.96"
$ns_ at 26.0 "$node_(9) setdest 833.78 292.42 1.54"
$ns_ at 27.0 "$node_(0) setdest 625.66 441.38 29.24"
$ns_ at 27.0 "$node_(1) setdest 690.06 407.45 20.68"
$ns_ at 27.0 "$node_(2) setdest 640.29 525.75 7.50"
$ns_ at 27.0 "$node_(3) setdest 561.77 452.25 29.72"
$ns_ at 27.0 "$node_(4) setdest 666.43 323.3 8.24"
$ns_ at 27.0 "$node_(5) setdest 517.08 540.87 10.37"
$ns_ at 27.0 "$node_(6) setdest 309.64 204.24 17.77"
$ns_ at 27.0 "$node_(7) setdest 387.19 457.21 13.87"
$ns_ at 27.0 "$node_(8) setdest 413.85 390.72 7.69"
$ns_ at 27.0 "$node_(9) setdest 830.88 292.96 2.95"
$ns_ at 28.0 "$node_(0) setdest 597.66 446.23 28.43"
$ns_ at 28.0 "$node_(1) setdest 705.99 404.58 16.18"
#trayectoria 10
$ns_ at 28.0 "$node_(10) setdest 759.37 394.9 0.00"
$ns_ at 28.0 "$node_(2) setdest 642.15 519.3 7.41"
$ns_ at 28.0 "$node_(3) setdest 532.43 456.78 29.69"
$ns_ at 28.0 "$node_(4) setdest 656.92 325.09 9.68"
$ns_ at 28.0 "$node_(5) setdest 506.67 542.01 10.47"
$ns_ at 28.0 "$node_(6) setdest 328.38 208.84 19.30"
$ns_ at 28.0 "$node_(7) setdest 385.43 446.44 10.75"
$ns_ at 28.0 "$node_(8) setdest 413.7 381.03 9.69"
$ns_ at 28.0 "$node_(9) setdest 825.98 293.86 4.99"
$ns_ at 29.0 "$node_(0) setdest 569.6 451.05 28.47"
$ns_ at 29.0 "$node_(1) setdest 717.51 402.67 11.68"
$ns_ at 29.0 "$node_(10) setdest 761.8 394.42 2.48"
$ns_ at 29.0 "$node_(2) setdest 639.17 512.96 7.02"
$ns_ at 29.0 "$node_(3) setdest 507.42 459.72 25.20"
$ns_ at 29.0 "$node_(4) setdest 645.45 327.25 11.67"
$ns_ at 29.0 "$node_(5) setdest 496.36 542.36 10.31"
$ns_ at 29.0 "$node_(6) setdest 349.13 213.63 21.28"
$ns_ at 29.0 "$node_(7) setdest 389.47 435.98 11.10"
$ns_ at 29.0 "$node_(8) setdest 413.52 368.9 12.13"
$ns_ at 29.0 "$node_(9) setdest 819.53 295.05 6.55"
$ns_ at 30.0 "$node_(0) setdest 541.53 455.37 28.40"
$ns_ at 30.0 "$node_(1) setdest 724.62 401.59 7.19"
$ns_ at 30.0 "$node_(10) setdest 766.14 393.54 4.43"
$ns_ at 30.0 "$node_(2) setdest 634.89 505.18 8.88"
$ns_ at 30.0 "$node_(3) setdest 486.73 460.51 20.70"
$ns_ at 30.0 "$node_(4) setdest 631.78 329.81 13.91"
$ns_ at 30.0 "$node_(5) setdest 485.98 542.57 10.38"
$ns_ at 30.0 "$node_(6) setdest 366.06 217.54 17.36"
$ns_ at 30.0 "$node_(7) setdest 399.26 425.59 13.38"
$ns_ at 30.0 "$node_(8) setdest 413.31 354.57 14.33"
$ns_ at 30.0 "$node_(9) setdest 811.39 296.55 8.28"
$ns_ at 31.0 "$node_(0) setdest 517.18 458.75 24.59"
$ns_ at 31.0 "$node_(1) setdest 729.55 399.79 5.32"
$ns_ at 31.0 "$node_(10) setdest 772.87 392.19 6.87"
#trayectoria 11
$ns_ at 31.0 "$node_(11) setdest 874.65 490.19 0.00"
$ns_ at 31.0 "$node_(2) setdest 629.45 495.32 11.26"
$ns_ at 31.0 "$node_(3) setdest 470.54 461.0 16.20"
$ns_ at 31.0 "$node_(4) setdest 618.47 332.21 13.53"
$ns_ at 31.0 "$node_(5) setdest 475.37 542.79 10.62"
$ns_ at 31.0 "$node_(6) setdest 378.61 220.43 12.88"
$ns_ at 31.0 "$node_(7) setdest 414.99 424.39 15.80"
$ns_ at 31.0 "$node_(8) setdest 413.05 338.36 16.21"
$ns_ at 31.0 "$node_(9) setdest 801.54 298.37 10.02"
$ns_ at 32.0 "$node_(0) setdest 497.14 460.2 20.09"
$ns_ at 32.0 "$node_(1) setdest 729.45 395.44 4.74"
$ns_ at 32.0 "$node_(10) setdest 780.99 390.55 8.29"
$ns_ at 32.0 "$node_(11) setdest 872.22 490.52 2.45"
$ns_ at 32.0 "$node_(2) setdest 623.1 483.81 13.15"
$ns_ at 32.0 "$node_(3) setdest 458.84 461.35 11.70"
$ns_ at 32.0 "$node_(4) setdest 604.74 334.69 13.95"
$ns_ at 32.0 "$node_(5) setdest 463.89 543.03 11.48"
$ns_ at 32.0 "$node_(6) setdest 387.12 222.4 8.73"
$ns_ at 32.0 "$node_(7) setdest 427.49 425.0 11.88"
$ns_ at 32.0 "$node_(8) setdest 412.73 320.19 18.17"
$ns_ at 32.0 "$node_(9) setdest 790.13 300.47 11.60"
$ns_ at 33.0 "$node_(0) setdest 480.43 460.7 16.73"
$ns_ at 33.0 "$node_(1) setdest 726.41 389.68 6.51"
$ns_ at 33.0 "$node_(10) setdest 790.5 388.64 9.70"
$ns_ at 33.0 "$node_(11) setdest 867.85 491.12 4.41"
$ns_ at 33.0 "$node_(2) setdest 615.75 470.48 15.22"
$ns_ at 33.0 "$node_(3) setdest 450.3 461.64 8.56"
$ns_ at 33.0 "$node_(4) setdest 590.76 337.27 14.22"
$ns_ at 33.0 "$node_(5) setdest 452.99 543.26 10.90"
$ns_ at 33.0 "$node_(6) setdest 391.44 223.41 4.44"
$ns_ at 33.0 "$node_(7) setdest 438.96 434.52 13.72"
$ns_ at 33.0 "$node_(8) setdest 412.38 300.05 20.15"
$ns_ at 33.0 "$node_(9) setdest 778.77 302.57 11.56"
$ns_ at 34.0 "$node_(0) setdest 467.34 461.1 13.09"
$ns_ at 34.0 "$node_(1) setdest 722.29 381.86 8.84"
$ns_ at 34.0 "$node_(10) setdest 801.48 386.43 11.20"
$ns_ at 34.0 "$node_(11) setdest 861.41 492.0 6.50"
#trayectoria 12
$ns_ at 34.0 "$node_(12) setdest 851.49 397.99 0.00"
$ns_ at 34.0 "$node_(2) setdest 610.12 460.27 11.65"
$ns_ at 34.0 "$node_(3) setdest 440.19 463.59 10.44"
$ns_ at 34.0 "$node_(4) setdest 577.1 339.79 13.90"
$ns_ at 34.0 "$node_(5) setdest 442.21 543.49 10.78"
$ns_ at 34.0 "$node_(6) setdest 397.32 220.34 6.96"
$ns_ at 34.0 "$node_(7) setdest 453.25 440.36 16.07"
$ns_ at 34.0 "$node_(8) setdest 412.03 280.16 19.88"
$ns_ at 34.0 "$node_(9) setdest 767.52 304.64 11.44"
$ns_ at 35.0 "$node_(0) setdest 455.98 461.44 11.36"
$ns_ at 35.0 "$node_(1) setdest 716.96 371.76 11.42"
$ns_ at 35.0 "$node_(10) setdest 814.88 383.73 13.67"
$ns_ at 35.0 "$node_(11) setdest 853.02 493.15 8.47"
$ns_ at 35.0 "$node_(12) setdest 848.94 398.35 2.58"
$ns_ at 35.0 "$node_(2) setdest 606.01 452.82 8.50"
$ns_ at 35.0 "$node_(3) setdest 432.55 471.34 10.57"
$ns_ at 35.0 "$node_(4) setdest 565.06 342.01 12.24"
$ns_ at 35.0 "$node_(5) setdest 431.51 543.71 10.70"
$ns_ at 35.0 "$node_(6) setdest 404.34 214.69 9.23"
$ns_ at 35.0 "$node_(7) setdest 471.15 440.24 17.90"
$ns_ at 35.0 "$node_(8) setdest 411.75 264.78 15.38"
$ns_ at 35.0 "$node_(9) setdest 756.48 306.68 11.23"
$ns_ at 36.0 "$node_(0) setdest 449.13 461.69 6.86"
$ns_ at 36.0 "$node_(1) setdest 711.25 360.92 12.25"
$ns_ at 36.0 "$node_(10) setdest 830.09 380.74 15.50"
$ns_ at 36.0 "$node_(11) setdest 843.23 494.49 9.88"
$ns_ at 36.0 "$node_(12) setdest 844.31 399.0 4.67"
#trayectoria 13
$ns_ at 36.0 "$node_(13) setdest 737.62 171.84 0.00"
$ns_ at 36.0 "$node_(2) setdest 604.01 449.18 4.15"
$ns_ at 36.0 "$node_(3) setdest 422.66 476.89 10.70"
$ns_ at 36.0 "$node_(4) setdest 557.19 343.15 7.96"
$ns_ at 36.0 "$node_(5) setdest 425.31 543.59 6.20"
$ns_ at 36.0 "$node_(6) setdest 413.77 213.96 11.81"
$ns_ at 36.0 "$node_(7) setdest 490.58 439.88 19.44"
$ns_ at 36.0 "$node_(8) setdest 411.52 253.9 10.88"
$ns_ at 36.0 "$node_(9) setdest 744.92 308.79 11.75"
$ns_ at 37.0 "$node_(0) setdest 440.58 463.33 8.80"
$ns_ at 37.0 "$node_(1) setdest 705.36 349.74 12.63"
$ns_ at 37.0 "$node_(10) setdest 842.92 378.36 13.05"
$ns_ at 37.0 "$node_(11) setdest 832.12 496.0 11.22"
$ns_ at 37.0 "$node_(12) setdest 837.94 400.1 6.47"
$ns_ at 37.0 "$node_(13) setdest 736.38 172.45 1.38"
$ns_ at 37.0 "$node_(2) setdest 598.7 446.23 6.45"
$ns_ at 37.0 "$node_(3) setdest 414.99 479.6 8.19"
$ns_ at 37.0 "$node_(4) setdest 546.84 343.85 10.38"
$ns_ at 37.0 "$node_(5) setdest 420.69 542.88 4.70"
$ns_ at 37.0 "$node_(6) setdest 420.04 223.22 14.34"
$ns_ at 37.0 "$node_(7) setdest 511.62 438.89 21.06"
$ns_ at 37.0 "$node_(8) setdest 411.32 246.89 7.00"
$ns_ at 37.0 "$node_(9) setdest 733.34 310.91 11.77"
$ns_ at 38.0 "$node_(0) setdest 432.4 471.51 11.25"
$ns_ at 38.0 "$node_(1) setdest 699.79 339.18 11.94"
$ns_ at 38.0 "$node_(10) setdest 851.35 376.93 8.55"
$ns_ at 38.0 "$node_(11) setdest 818.71 497.84 13.53"
$ns_ at 38.0 "$node_(12) setdest 830.12 401.65 7.97"
$ns_ at 38.0 "$node_(13) setdest 733.63 173.81 3.07"
$ns_ at 38.0 "$node_(2) setdest 591.91 447.35 6.88"
$ns_ at 38.0 "$node_(3) setdest 413.3 486.19 7.12"
$ns_ at 38.0 "$node_(4) setdest 534.13 344.67 12.74"
$ns_ at 38.0 "$node_(5) setdest 417.81 539.38 4.74"
$ns_ at 38.0 "$node_(6) setdest 412.39 237.37 16.53"
$ns_ at 38.0 "$node_(7) setdest 533.85 435.92 22.43"
$ns_ at 38.0 "$node_(8) setdest 411.08 244.07 2.86"
$ns_ at 38.0 "$node_(9) setdest 721.99 312.99 11.54"
$ns_ at 39.0 "$node_(0) setdest 422.92 476.76 10.23"
$ns_ at 39.0 "$node_(1) setdest 696.24 332.45 7.61"
$ns_ at 39.0 "$node_(10) setdest 858.3 374.24 7.66"
$ns_ at 39.0 "$node_(11) setdest 804.98 499.71 13.86"
$ns_ at 39.0 "$node_(12) setdest 820.91 403.48 9.40"
$ns_ at 39.0 "$node_(13) setdest 729.19 176.0 4.95"
#trayectoria 14
$ns_ at 39.0 "$node_(14) setdest 616.44 212.01 0.00"
$ns_ at 39.0 "$node_(2) setdest 583.32 448.95 8.74"
$ns_ at 39.0 "$node_(3) setdest 413.5 494.88 8.68"
$ns_ at 39.0 "$node_(4) setdest 520.64 345.69 13.52"
$ns_ at 39.0 "$node_(5) setdest 417.48 534.96 4.44"
$ns_ at 39.0 "$node_(6) setdest 408.33 254.23 18.13"
$ns_ at 39.0 "$node_(7) setdest 557.59 431.7 24.12"
$ns_ at 39.0 "$node_(8) setdest 410.99 243.87 0.21"
$ns_ at 39.0 "$node_(9) setdest 711.07 314.99 11.10"
$ns_ at 40.0 "$node_(0) setdest 415.94 478.96 7.29"
$ns_ at 40.0 "$node_(1) setdest 693.89 328.0 5.03"
$ns_ at 40.0 "$node_(10) setdest 861.62 368.4 6.72"
$ns_ at 40.0 "$node_(11) setdest 791.34 501.58 13.76"
$ns_ at 40.0 "$node_(12) setdest 810.4 405.57 10.71"
$ns_ at 40.0 "$node_(13) setdest 722.63 178.56 7.05"
$ns_ at 40.0 "$node_(14) setdest 615.16 212.32 1.32"
$ns_ at 40.0 "$node_(2) setdest 572.58 450.6 10.87"
$ns_ at 40.0 "$node_(3) setdest 413.71 505.77 10.90"
$ns_ at 40.0 "$node_(4) setdest 507.56 346.62 13.11"
$ns_ at 40.0 "$node_(5) setdest 417.36 528.4 6.56"
$ns_ at 40.0 "$node_(6) setdest 408.73 274.7 20.47"
$ns_ at 40.0 "$node_(7) setdest 581.34 427.34 24.14"
$ns_ at 40.0 "$node_(8) setdest 409.33 241.86 2.64"
$ns_ at 40.0 "$node_(9) setdest 699.75 317.07 11.51"
$ns_ at 41.0 "$node_(0) setdest 413.28 485.39 7.48"
$ns_ at 41.0 "$node_(1) setdest 693.65 327.53 0.53"
$ns_ at 41.0 "$node_(10) setdest 868.82 363.62 8.76"
$ns_ at 41.0 "$node_(11) setdest 781.19 502.96 10.25"
$ns_ at 41.0 "$node_(12) setdest 798.26 407.98 12.38"
$ns_ at 41.0 "$node_(13) setdest 713.69 181.94 9.55"
$ns_ at 41.0 "$node_(14) setdest 611.45 213.21 3.81"
$ns_ at 41.0 "$node_(2) setdest 560.14 452.5 12.58"
$ns_ at 41.0 "$node_(3) setdest 413.98 519.25 13.49"
$ns_ at 41.0 "$node_(4) setdest 493.43 347.63 14.16"
$ns_ at 41.0 "$node_(5) setdest 417.2 520.22 8.18"
$ns_ at 41.0 "$node_(6) setdest 409.12 297.05 22.36"
$ns_ at 41.0 "$node_(7) setdest 604.72 422.85 23.80"
$ns_ at 41.0 "$node_(8) setdest 405.69 239.29 4.46"
$ns_ at 41.0 "$node_(9) setdest 689.11 319.04 10.82"
$ns_ at 42.0 "$node_(0) setdest 413.51 495.19 9.80"
$ns_ at 42.0 "$node_(1) setdest 693.65 327.53 0.00"
$ns_ at 42.0 "$node_(10) setdest 879.25 362.62 10.51"
$ns_ at 42.0 "$node_(11) setdest 774.21 503.96 7.05"
$ns_ at 42.0 "$node_(12) setdest 784.13 410.79 14.41"
$ns_ at 42.0 "$node_(13) setdest 703.17 185.91 11.25"
$ns_ at 42.0 "$node_(14) setdest 605.94 214.55 5.67"
#trayectoria 15
$ns_ at 42.0 "$node_(15) setdest 758.61 737.07 0.00"
$ns_ at 42.0 "$node_(2) setdest 545.27 454.8 15.05"
$ns_ at 42.0 "$node_(3) setdest 414.19 530.31 11.06"
$ns_ at 42.0 "$node_(4) setdest 479.48 348.62 13.99"
$ns_ at 42.0 "$node_(5) setdest 416.99 509.89 10.33"
$ns_ at 42.0 "$node_(6) setdest 409.53 320.21 23.16"
$ns_ at 42.0 "$node_(7) setdest 627.91 418.64 23.56"
$ns_ at 42.0 "$node_(8) setdest 400.25 235.92 5.82"
$ns_ at 42.0 "$node_(9) setdest 678.25 321.06 11.04"
$ns_ at 43.0 "$node_(0) setdest 413.74 507.33 12.14"
$ns_ at 43.0 "$node_(1) setdest 692.39 325.73 2.19"
$ns_ at 43.0 "$node_(10) setdest 890.19 364.45 11.85"
$ns_ at 43.0 "$node_(11) setdest 765.47 505.25 8.84"
$ns_ at 43.0 "$node_(12) setdest 767.65 414.06 16.80"
$ns_ at 43.0 "$node_(13) setdest 691.42 190.34 12.56"
$ns_ at 43.0 "$node_(14) setdest 598.29 215.93 7.78"
$ns_ at 43.0 "$node_(15) setdest 757.59 735.04 2.27"
$ns_ at 43.0 "$node_(2) setdest 528.99 457.31 16.47"
$ns_ at 43.0 "$node_(3) setdest 414.31 536.87 6.56"
$ns_ at 43.0 "$node_(4) setdest 465.42 348.22 14.10"
$ns_ at 43.0 "$node_(5) setdest 416.77 498.19 11.71"
$ns_ at 43.0 "$node_(6) setdest 409.92 342.61 22.40"
$ns_ at 43.0 "$node_(7) setdest 651.29 414.43 23.76"
$ns_ at 43.0 "$node_(8) setdest 395.42 227.1 8.37"
$ns_ at 43.0 "$node_(9) setdest 667.01 323.19 11.43"
$ns_ at 44.0 "$node_(0) setdest 413.97 519.2 11.88"
$ns_ at 44.0 "$node_(1) setdest 689.37 322.63 4.39"
$ns_ at 44.0 "$node_(10) setdest 900.87 371.36 13.52"
$ns_ at 44.0 "$node_(11) setdest 754.91 506.75 10.66"
$ns_ at 44.0 "$node_(12) setdest 753.72 416.83 14.20"
$ns_ at 44.0 "$node_(13) setdest 677.16 194.98 14.99"
$ns_ at 44.0 "$node_(14) setdest 589.21 217.46 9.21"
$ns_ at 44.0 "$node_(15) setdest 755.77 731.42 4.06"
$ns_ at 44.0 "$node_(2) setdest 511.25 459.35 17.87"
$ns_ at 44.0 "$node_(3) setdest 413.1 542.4 5.77"
$ns_ at 44.0 "$node_(4) setdest 452.06 347.2 13.40"
$ns_ at 44.0 "$node_(5) setdest 416.58 489.41 8.78"
$ns_ at 44.0 "$node_(6) setdest 410.27 365.26 22.65"
$ns_ at 44.0 "$node_(7) setdest 674.31 410.29 23.39"
$ns_ at 44.0 "$node_(8) setdest 397.26 217.72 9.47"
$ns_ at 44.0 "$node_(9) setdest 656.43 325.18 10.77"
$ns_ at 45.0 "$node_(0) setdest 414.17 529.13 9.94"
$ns_ at 45.0 "$node_(1) setdest 683.51 320.57 6.35"
$ns_ at 45.0 "$node_(10) setdest 905.83 384.62 15.57"
$ns_ at 45.0 "$node_(11) setdest 741.87 508.59 13.17"
$ns_ at 45.0 "$node_(12) setdest 744.04 418.77 9.88"
$ns_ at 45.0 "$node_(13) setdest 661.07 200.11 16.89"
$ns_ at 45.0 "$node_(14) setdest 577.87 219.37 11.51"
$ns_ at 45.0 "$node_(15) setdest 752.85 725.84 6.30"
#trayectoria 16
$ns_ at 45.0 "$node_(16) setdest 220.98 168.64 0.00"
$ns_ at 45.0 "$node_(2) setdest 491.45 460.37 19.84"
$ns_ at 45.0 "$node_(3) setdest 406.77 543.51 6.76"
$ns_ at 45.0 "$node_(4) setdest 438.47 346.18 13.63"
$ns_ at 45.0 "$node_(5) setdest 416.44 484.19 5.22"
$ns_ at 45.0 "$node_(6) setdest 410.54 383.41 18.15"
$ns_ at 45.0 "$node_(7) setdest 698.08 406.01 24.15"
$ns_ at 45.0 "$node_(8) setdest 404.56 211.14 9.28"
$ns_ at 45.0 "$node_(9) setdest 645.34 327.28 11.29"
$ns_ at 46.0 "$node_(0) setdest 414.32 537.2 8.07"
$ns_ at 46.0 "$node_(1) setdest 675.79 321.53 7.79"
$ns_ at 46.0 "$node_(10) setdest 899.94 400.16 17.10"
$ns_ at 46.0 "$node_(11) setdest 727.83 510.65 14.19"
$ns_ at 46.0 "$node_(12) setdest 739.04 420.65 5.38"
$ns_ at 46.0 "$node_(13) setdest 643.16 205.6 18.74"
$ns_ at 46.0 "$node_(14) setdest 565.09 221.52 12.95"
$ns_ at 46.0 "$node_(15) setdest 748.74 717.96 8.88"
$ns_ at 46.0 "$node_(16) setdest 222.29 169.11 1.38"
$ns_ at 46.0 "$node_(2) setdest 473.96 460.9 17.49"
$ns_ at 46.0 "$node_(3) setdest 397.82 542.35 9.02"
$ns_ at 46.0 "$node_(4) setdest 428.16 345.4 10.34"
$ns_ at 46.0 "$node_(5) setdest 413.71 479.09 6.11"
$ns_ at 46.0 "$node_(6) setdest 410.75 397.64 14.23"
$ns_ at 46.0 "$node_(7) setdest 721.99 401.99 24.26"
$ns_ at 46.0 "$node_(8) setdest 416.89 211.85 10.95"
$ns_ at 46.0 "$node_(9) setdest 633.68 329.47 11.87"
$ns_ at 47.0 "$node_(0) setdest 416.96 544.36 7.87"
$ns_ at 47.0 "$node_(1) setdest 666.81 323.22 9.14"
$ns_ at 47.0 "$node_(10) setdest 887.61 406.81 14.48"
$ns_ at 47.0 "$node_(11) setdest 714.33 512.64 13.64"
$ns_ at 47.0 "$node_(12) setdest 738.84 425.87 5.60"
$ns_ at 47.0 "$node_(13) setdest 622.97 210.46 20.76"
$ns_ at 47.0 "$node_(14) setdest 550.23 223.19 14.96"
$ns_ at 47.0 "$node_(15) setdest 743.56 708.03 11.20"
$ns_ at 47.0 "$node_(16) setdest 225.99 170.42 3.93"
#trayectoria 17
$ns_ at 47.0 "$node_(17) setdest 679.24 301.14 0.00"
$ns_ at 47.0 "$node_(2) setdest 460.92 461.29 13.05"
$ns_ at 47.0 "$node_(3) setdest 387.19 540.98 10.73"
$ns_ at 47.0 "$node_(4) setdest 422.34 344.95 5.84"
$ns_ at 47.0 "$node_(5) setdest 408.71 477.4 5.31"
$ns_ at 47.0 "$node_(6) setdest 410.9 407.67 10.03"
$ns_ at 47.0 "$node_(7) setdest 745.89 397.61 24.29"
$ns_ at 47.0 "$node_(8) setdest 423.33 218.8 8.27"
$ns_ at 47.0 "$node_(9) setdest 622.15 331.54 11.71"
$ns_ at 48.0 "$node_(0) setdest 424.66 546.76 8.24"
$ns_ at 48.0 "$node_(1) setdest 656.37 325.19 10.62"
$ns_ at 48.0 "$node_(10) setdest 875.41 404.87 12.49"
$ns_ at 48.0 "$node_(11) setdest 700.68 514.64 13.79"
$ns_ at 48.0 "$node_(12) setdest 740.83 432.94 7.35"
$ns_ at 48.0 "$node_(13) setdest 600.43 215.57 23.12"
$ns_ at 48.0 "$node_(14) setdest 532.85 224.72 17.45"
$ns_ at 48.0 "$node_(15) setdest 737.41 696.25 13.29"
$ns_ at 48.0 "$node_(16) setdest 231.89 172.62 6.29"
$ns_ at 48.0 "$node_(17) setdest 678.23 299.3 2.10"
$ns_ at 48.0 "$node_(2) setdest 452.09 461.57 8.84"
$ns_ at 48.0 "$node_(3) setdest 374.91 539.29 12.39"
$ns_ at 48.0 "$node_(4) setdest 415.09 345.02 7.28"
$ns_ at 48.0 "$node_(5) setdest 403.11 475.72 5.62"
$ns_ at 48.0 "$node_(6) setdest 410.98 413.29 5.62"
$ns_ at 48.0 "$node_(7) setdest 769.22 392.92 23.80"
$ns_ at 48.0 "$node_(8) setdest 426.45 225.49 7.27"
$ns_ at 48.0 "$node_(9) setdest 610.97 333.55 11.36"
$ns_ at 49.0 "$node_(1) setdest 644.8 327.38 11.78"
$ns_ at 49.0 "$node_(10) setdest 866.9 404.24 8.39"
$ns_ at 49.0 "$node_(11) setdest 687.23 516.62 13.59"
$ns_ at 49.0 "$node_(12) setdest 743.34 441.84 9.25"
$ns_ at 49.0 "$node_(13) setdest 576.34 219.63 24.43"
$ns_ at 49.0 "$node_(14) setdest 512.89 225.94 20.00"
$ns_ at 49.0 "$node_(15) setdest 730.52 683.04 14.90"
$ns_ at 49.0 "$node_(16) setdest 239.56 175.7 8.25"
$ns_ at 49.0 "$node_(17) setdest 676.44 296.05 3.71"
$ns_ at 49.0 "$node_(2) setdest 447.75 461.75 4.34"
$ns_ at 49.0 "$node_(3) setdest 360.2 536.9 14.91"
$ns_ at 49.0 "$node_(4) setdest 410.5 350.09 7.23"
$ns_ at 49.0 "$node_(5) setdest 396.53 471.43 7.50"
$ns_ at 49.0 "$node_(6) setdest 412.4 421.07 8.05"
$ns_ at 49.0 "$node_(7) setdest 792.47 388.24 23.72"
$ns_ at 49.0 "$node_(8) setdest 432.27 228.51 7.01"
$ns_ at 49.0 "$node_(9) setdest 599.82 335.59 11.33"
$ns_ at 50.0 "$node_(1) setdest 632.75 329.64 12.26"
$ns_ at 50.0 "$node_(10) setdest 861.31 398.94 7.19"
$ns_ at 50.0 "$node_(11) setdest 673.4 518.65 13.98"
$ns_ at 50.0 "$node_(12) setdest 746.42 452.76 11.34"
$ns_ at 50.0 "$node_(13) setdest 552.69 222.95 23.89"
$ns_ at 50.0 "$node_(14) setdest 490.96 226.86 21.95"
$ns_ at 50.0 "$node_(15) setdest 722.98 668.59 16.30"
$ns_ at 50.0 "$node_(16) setdest 248.66 179.4 9.81"
$ns_ at 50.0 "$node_(17) setdest 673.48 290.76 6.06"
#trayectoria 18
$ns_ at 50.0 "$node_(18) setdest 834.03 400.87 0.00"
$ns_ at 50.0 "$node_(2) setdest 441.77 462.81 6.12"
$ns_ at 50.0 "$node_(3) setdest 346.06 534.38 14.36"
$ns_ at 50.0 "$node_(4) setdest 410.15 357.26 7.20"
$ns_ at 50.0 "$node_(5) setdest 389.63 463.7 9.92"
$ns_ at 50.0 "$node_(6) setdest 418.43 424.92 7.48"
$ns_ at 50.0 "$node_(7) setdest 813.5 384.01 21.46"
$ns_ at 50.0 "$node_(8) setdest 441.25 229.01 9.00"
$ns_ at 50.0 "$node_(9) setdest 589.0 337.59 11.01"
$ns_ at 51.0 "$node_(1) setdest 620.87 331.78 12.07"
$ns_ at 51.0 "$node_(10) setdest 855.71 397.4 6.11"
$ns_ at 51.0 "$node_(11) setdest 662.04 520.32 11.48"
$ns_ at 51.0 "$node_(12) setdest 749.93 465.2 12.93"
$ns_ at 51.0 "$node_(13) setdest 527.86 225.15 24.94"
$ns_ at 51.0 "$node_(14) setdest 469.99 226.91 20.98"
$ns_ at 51.0 "$node_(15) setdest 714.39 652.66 18.10"
$ns_ at 51.0 "$node_(16) setdest 259.41 183.78 11.60"
$ns_ at 51.0 "$node_(17) setdest 669.42 283.49 8.32"
$ns_ at 51.0 "$node_(18) setdest 832.74 401.13 1.32"
$ns_ at 51.0 "$node_(2) setdest 435.16 468.25 8.56"
$ns_ at 51.0 "$node_(3) setdest 332.13 531.59 14.21"
$ns_ at 51.0 "$node_(4) setdest 410.28 366.16 8.90"
$ns_ at 51.0 "$node_(5) setdest 386.28 453.95 9.83"
$ns_ at 51.0 "$node_(6) setdest 426.24 427.96 8.49"
$ns_ at 51.0 "$node_(7) setdest 830.14 380.73 16.96"
$ns_ at 51.0 "$node_(8) setdest 452.42 229.61 11.18"
$ns_ at 51.0 "$node_(9) setdest 577.61 339.69 11.58"
$ns_ at 52.0 "$node_(1) setdest 608.92 333.92 12.14"
$ns_ at 52.0 "$node_(10) setdest 847.14 398.6 8.65"
$ns_ at 52.0 "$node_(11) setdest 655.13 521.34 6.98"
$ns_ at 52.0 "$node_(12) setdest 753.61 478.23 13.54"
$ns_ at 52.0 "$node_(13) setdest 503.18 226.3 24.71"
$ns_ at 52.0 "$node_(14) setdest 453.33 226.46 16.66"
$ns_ at 52.0 "$node_(15) setdest 704.56 635.4 19.86"
$ns_ at 52.0 "$node_(16) setdest 272.32 189.04 13.93"
$ns_ at 52.0 "$node_(17) setdest 664.49 274.62 10.15"
$ns_ at 52.0 "$node_(18) setdest 829.84 401.71 2.95"
$ns_ at 52.0 "$node_(2) setdest 425.94 475.22 11.04"
$ns_ at 52.0 "$node_(3) setdest 318.23 528.52 14.24"
$ns_ at 52.0 "$node_(4) setdest 410.45 377.31 11.16"
$ns_ at 52.0 "$node_(5) setdest 385.89 443.87 10.17"
$ns_ at 52.0 "$node_(6) setdest 434.54 434.45 10.69"
$ns_ at 52.0 "$node_(7) setdest 842.39 378.44 12.46"
$ns_ at 52.0 "$node_(8) setdest 465.6 230.01 13.19"
$ns_ at 52.0 "$node_(9) setdest 566.39 341.76 11.41"
$ns_ at 53.0 "$node_(1) setdest 596.14 336.27 12.99"
$ns_ at 53.0 "$node_(10) setdest 840.54 399.62 6.69"
$ns_ at 53.0 "$node_(11) setdest 646.89 522.54 8.32"
$ns_ at 53.0 "$node_(12) setdest 757.14 490.75 13.01"
$ns_ at 53.0 "$node_(13) setdest 481.51 226.99 21.69"
$ns_ at 53.0 "$node_(14) setdest 441.17 225.79 12.18"
$ns_ at 53.0 "$node_(15) setdest 695.33 618.34 19.40"
$ns_ at 53.0 "$node_(16) setdest 287.17 195.09 16.01"
$ns_ at 53.0 "$node_(17) setdest 658.58 263.44 12.64"
$ns_ at 53.0 "$node_(18) setdest 825.48 402.57 4.44"
$ns_ at 53.0 "$node_(2) setdest 412.6 477.76 13.22"
$ns_ at 53.0 "$node_(3) setdest 304.15 525.06 14.49"
$ns_ at 53.0 "$node_(4) setdest 410.64 389.88 12.57"
$ns_ at 53.0 "$node_(5) setdest 390.51 434.17 10.40"
$ns_ at 53.0 "$node_(6) setdest 441.85 444.43 12.96"
$ns_ at 53.0 "$node_(7) setdest 850.67 377.05 8.39"
$ns_ at 53.0 "$node_(8) setdest 481.14 230.2 15.55"
$ns_ at 53.0 "$node_(9) setdest 557.61 343.13 8.89"
$ns_ at 54.0 "$node_(1) setdest 583.94 338.53 12.41"
$ns_ at 54.0 "$node_(10) setdest 835.58 400.56 5.05"
$ns_ at 54.0 "$node_(11) setdest 637.08 523.96 9.92"
$ns_ at 54.0 "$node_(12) setdest 759.45 498.94 8.51"
$ns_ at 54.0 "$node_(13) setdest 464.19 226.78 17.31"
$ns_ at 54.0 "$node_(14) setdest 433.51 225.37 7.68"
$ns_ at 54.0 "$node_(15) setdest 686.06 600.88 19.77"
$ns_ at 54.0 "$node_(16) setdest 304.39 202.1 18.57"
$ns_ at 54.0 "$node_(17) setdest 653.01 252.92 11.90"
$ns_ at 54.0 "$node_(18) setdest 818.65 403.93 6.97"
#trayectoria 19
$ns_ at 54.0 "$node_(19) setdest 776.27 506.88 0.00"
$ns_ at 54.0 "$node_(2) setdest 397.59 472.27 15.57"
$ns_ at 54.0 "$node_(3) setdest 290.26 521.24 14.42"
$ns_ at 54.0 "$node_(4) setdest 410.83 402.71 12.84"
$ns_ at 54.0 "$node_(5) setdest 399.79 425.35 11.99"
$ns_ at 54.0 "$node_(6) setdest 440.11 461.1 15.03"
$ns_ at 54.0 "$node_(7) setdest 854.93 376.24 4.33"
$ns_ at 54.0 "$node_(8) setdest 499.2 229.66 18.06"
$ns_ at 54.0 "$node_(9) setdest 553.24 343.43 4.39"
$ns_ at 55.0 "$node_(1) setdest 572.27 340.68 11.87"
$ns_ at 55.0 "$node_(10) setdest 828.59 401.95 7.13"
$ns_ at 55.0 "$node_(11) setdest 625.52 525.61 11.68"
$ns_ at 55.0 "$node_(12) setdest 761.09 503.15 4.52"
$ns_ at 55.0 "$node_(13) setdest 451.39 226.36 12.81"
$ns_ at 55.0 "$node_(14) setdest 423.9 225.39 9.62"
$ns_ at 55.0 "$node_(15) setdest 676.55 582.96 20.29"
$ns_ at 55.0 "$node_(16) setdest 322.06 207.38 18.49"
$ns_ at 55.0 "$node_(17) setdest 647.09 241.73 12.66"
$ns_ at 55.0 "$node_(18) setdest 809.83 405.68 8.99"
$ns_ at 55.0 "$node_(19) setdest 777.61 506.69 1.36"
$ns_ at 55.0 "$node_(2) setdest 387.69 459.01 16.07"
$ns_ at 55.0 "$node_(3) setdest 276.22 516.19 14.93"
$ns_ at 55.0 "$node_(4) setdest 410.95 411.05 8.34"
$ns_ at 55.0 "$node_(5) setdest 406.79 422.02 7.69"
$ns_ at 55.0 "$node_(6) setdest 431.96 472.03 12.88"
$ns_ at 55.0 "$node_(7) setdest 859.02 373.08 5.39"
$ns_ at 55.0 "$node_(8) setdest 519.21 228.91 20.03"
$ns_ at 55.0 "$node_(9) setdest 547.22 343.82 6.03"
$ns_ at 56.0 "$node_(10) setdest 819.07 403.85 9.71"
$ns_ at 56.0 "$node_(11) setdest 611.72 527.57 13.93"
$ns_ at 56.0 "$node_(12) setdest 765.73 507.18 6.38"
$ns_ at 56.0 "$node_(13) setdest 440.11 225.73 11.29"
$ns_ at 56.0 "$node_(14) setdest 413.78 227.97 10.61"
$ns_ at 56.0 "$node_(15) setdest 667.38 565.68 19.56"
$ns_ at 56.0 "$node_(16) setdest 340.86 211.72 19.26"
$ns_ at 56.0 "$node_(17) setdest 641.34 230.85 12.30"
$ns_ at 56.0 "$node_(18) setdest 799.44 407.75 10.60"
$ns_ at 56.0 "$node_(19) setdest 780.92 506.23 3.34"
$ns_ at 56.0 "$node_(2) setdest 385.4 447.39 11.57"
$ns_ at 56.0 "$node_(3) setdest 262.92 511.29 14.18"
$ns_ at 56.0 "$node_(4) setdest 411.01 414.94 3.89"
$ns_ at 56.0 "$node_(5) setdest 413.47 417.46 8.14"
$ns_ at 56.0 "$node_(6) setdest 421.99 477.05 10.51"
$ns_ at 56.0 "$node_(7) setdest 863.14 367.04 7.39"
$ns_ at 56.0 "$node_(8) setdest 539.36 227.37 20.22"
$ns_ at 56.0 "$node_(9) setdest 538.74 344.38 8.49"
$ns_ at 57.0 "$node_(10) setdest 808.75 405.9 10.52"
$ns_ at 57.0 "$node_(11) setdest 598.24 529.48 13.61"
$ns_ at 57.0 "$node_(12) setdest 771.26 507.67 5.63"
$ns_ at 57.0 "$node_(13) setdest 433.33 225.36 6.79"
$ns_ at 57.0 "$node_(14) setdest 408.6 237.88 11.74"
$ns_ at 57.0 "$node_(15) setdest 657.85 547.72 20.33"
$ns_ at 57.0 "$node_(16) setdest 359.49 216.02 19.10"
$ns_ at 57.0 "$node_(17) setdest 636.97 222.57 9.37"
$ns_ at 57.0 "$node_(18) setdest 787.27 410.16 12.40"
$ns_ at 57.0 "$node_(19) setdest 785.56 505.6 4.69"
$ns_ at 57.0 "$node_(2) setdest 389.74 435.51 12.55"
$ns_ at 57.0 "$node_(3) setdest 249.32 506.28 14.48"
$ns_ at 57.0 "$node_(4) setdest 411.02 415.64 0.70"
$ns_ at 57.0 "$node_(5) setdest 414.13 409.69 7.94"
$ns_ at 57.0 "$node_(6) setdest 415.14 479.42 7.30"
$ns_ at 57.0 "$node_(7) setdest 871.9 362.98 9.87"
$ns_ at 57.0 "$node_(8) setdest 559.38 225.52 20.09"
$ns_ at 57.0 "$node_(9) setdest 527.92 345.13 10.84"
$ns_ at 58.0 "$node_(10) setdest 796.08 408.41 12.92"
$ns_ at 58.0 "$node_(11) setdest 585.03 531.36 13.34"
$ns_ at 58.0 "$node_(12) setdest 776.38 506.87 5.18"
$ns_ at 58.0 "$node_(13) setdest 425.01 225.35 8.34"
$ns_ at 58.0 "$node_(14) setdest 408.19 249.12 11.26"
$ns_ at 58.0 "$node_(15) setdest 648.2 529.59 20.54"
$ns_ at 58.0 "$node_(16) setdest 373.88 219.34 14.76"
$ns_ at 58.0 "$node_(17) setdest 634.71 218.26 4.87"
$ns_ at 58.0 "$node_(18) setdest 772.67 413.06 14.89"
$ns_ at 58.0 "$node_(19) setdest 792.61 504.64 7.11"
$ns_ at 58.0 "$node_(2) setdest 400.83 424.93 14.47"
$ns_ at 58.0 "$node_(3) setdest 235.77 500.83 14.62"
$ns_ at 58.0 "$node_(4) setdest 411.02 415.89 0.25"
$ns_ at 58.0 "$node_(5) setdest 413.99 399.9 9.80"
$ns_ at 58.0 "$node_(6) setdest 413.28 485.56 6.72"
$ns_ at 58.0 "$node_(7) setdest 883.6 362.51 11.76"
$ns_ at 58.0 "$node_(8) setdest 579.24 222.38 20.12"
$ns_ at 58.0 "$node_(9) setdest 517.25 345.93 10.70"
$ns_ at 59.0 "$node_(10) setdest 781.84 411.24 14.52"
$ns_ at 59.0 "$node_(11) setdest 571.67 533.28 13.50"
$ns_ at 59.0 "$node_(12) setdest 783.25 505.91 6.94"
$ns_ at 59.0 "$node_(13) setdest 414.76 227.56 10.65"
$ns_ at 59.0 "$node_(14) setdest 408.5 262.07 12.95"
$ns_ at 59.0 "$node_(15) setdest 638.42 511.59 20.48"
$ns_ at 59.0 "$node_(16) setdest 384.13 221.71 10.52"
$ns_ at 59.0 "$node_(17) setdest 634.4 217.67 0.67"
$ns_ at 59.0 "$node_(18) setdest 756.69 416.24 16.29"
$ns_ at 59.0 "$node_(19) setdest 801.59 503.41 9.06"
$ns_ at 59.0 "$node_(2) setdest 415.71 424.52 14.91"
#Generar el intercambio de datos entre 10 pares de vehiculos (CBR por 60 segundos)
#intercambio 0-1
set udp [new Agent/UDP]
$udp set class_ 1
set null [new Agent/Null]
$ns_ attach-agent $node_(0) $udp
$ns_ attach-agent $node_(1) $null
$ns_ connect $udp $null
$udp set fid_ 1

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 0.0 "$cbr start"
$ns_ at 60.0  "$cbr stop"
#intercambio 2-3
set udp [new Agent/UDP]
$udp set class_ 2
set null [new Agent/Null]
$ns_ attach-agent $node_(2) $udp
$ns_ attach-agent $node_(3) $null
$ns_ connect $udp $null
$udp set fid_ 2

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 6.0 "$cbr start"
$ns_ at 66.0  "$cbr stop"
#intercambio 4-5
set udp [new Agent/UDP]
$udp set class_ 3
set null [new Agent/Null]
$ns_ attach-agent $node_(4) $udp
$ns_ attach-agent $node_(5) $null
$ns_ connect $udp $null
$udp set fid_ 3

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 12.0 "$cbr start"
$ns_ at 72.0  "$cbr stop"
#intercambio 6-7
set udp [new Agent/UDP]
$udp set class_ 4
set null [new Agent/Null]
$ns_ attach-agent $node_(6) $udp
$ns_ attach-agent $node_(7) $null
$ns_ connect $udp $null
$udp set fid_ 4

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 17.0 "$cbr start"
$ns_ at 77.0  "$cbr stop"
#intercambio 8-9
set udp [new Agent/UDP]
$udp set class_ 5
set null [new Agent/Null]
$ns_ attach-agent $node_(8) $udp
$ns_ attach-agent $node_(9) $null
$ns_ connect $udp $null
$udp set fid_ 5

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 23.0 "$cbr start"
$ns_ at 83.0  "$cbr stop"
#intercambio 10-11
set udp [new Agent/UDP]
$udp set class_ 6
set null [new Agent/Null]
$ns_ attach-agent $node_(10) $udp
$ns_ attach-agent $node_(11) $null
$ns_ connect $udp $null
$udp set fid_ 6

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 28.0 "$cbr start"
$ns_ at 88.0  "$cbr stop"
#intercambio 12-13
set udp [new Agent/UDP]
$udp set class_ 7
set null [new Agent/Null]
$ns_ attach-agent $node_(12) $udp
$ns_ attach-agent $node_(13) $null
$ns_ connect $udp $null
$udp set fid_ 7

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 31.0 "$cbr start"
$ns_ at 91.0  "$cbr stop"
#intercambio 14-15
set udp [new Agent/UDP]
$udp set class_ 8
set null [new Agent/Null]
$ns_ attach-agent $node_(14) $udp
$ns_ attach-agent $node_(15) $null
$ns_ connect $udp $null
$udp set fid_ 8

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 36.0 "$cbr start"
$ns_ at 96.0  "$cbr stop"
#intercambio 16-17
set udp [new Agent/UDP]
$udp set class_ 9
set null [new Agent/Null]
$ns_ attach-agent $node_(16) $udp
$ns_ attach-agent $node_(17) $null
$ns_ connect $udp $null
$udp set fid_ 9

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 42.0 "$cbr start"
$ns_ at 102.0  "$cbr stop"
#intercambio 18-19
set udp [new Agent/UDP]
$udp set class_ 10
set null [new Agent/Null]
$ns_ attach-agent $node_(18) $udp
$ns_ attach-agent $node_(19) $null
$ns_ connect $udp $null
$udp set fid_ 10

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512     
$cbr set rate_ 500Kb
$cbr attach-agent $udp
$ns_ at 47.0 "$cbr start"
$ns_ at 107.0  "$cbr stop"
#Procedimiento para finalizar la simulacion
for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $opt(stop).0 "$node_($i) reset";
}

$ns_ at $opt(stop).0002 "puts \"NS EXITING...\" ; $ns_ halt"
$ns_ at $opt(stop).0001 "stop"

proc stop {} {
    global ns_ tracefd namtrace
    $ns_ flush-trace
    close $tracefd
    close $namtrace
}
#Iniciar la simulacion
puts "Los patos no prodecen eco y nadie sabe por que..."

$ns_ run
