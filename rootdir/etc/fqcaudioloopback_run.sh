#!/vendor/bin/sh

fqcaudio=`getprop vendor.sys.fqcaudio`
case "$fqcaudio" in
    "11")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'DMIC2'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'DEC7'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'IIR0 INP0 Volume' 84
    ;;
    "10")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'ZERO'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 Volume' 54
    ;;
    "21")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'DMIC4'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'DEC7'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'IIR0 INP0 Volume' 84
    ;;
    "20")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'ZERO'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 Volume' 54
    ;;
    "31")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'DMIC0'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'DEC7'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'IIR0 INP0 Volume' 84
    ;;
    "30")
		/system/bin/tinymix 'ADC MUX7' 'DMIC'
		/system/bin/tinymix 'DMIC MUX7' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'ZERO'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 Volume' 54
    ;;
    "41")
		/system/bin/tinymix 'ADC MUX0' 'AMIC'
		/system/bin/tinymix 'AMIC MUX0' 'ADC2'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'DEC0'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'IIR0'
		/system/bin/tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
		/system/bin/tinymix 'IIR0 INP0 Volume' 84
    ;;
    "40")
		/system/bin/tinymix 'ADC MUX0' 'AMIC'
		/system/bin/tinymix 'AMIC MUX0' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 MUX' 'ZERO'
		/system/bin/tinymix 'RX INT1_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'RX INT2_1 MIX1 INP1' 'ZERO'
		/system/bin/tinymix 'IIR0 INP0 Volume' 54
    ;;
    *)
    ;; #Do nothing
esac
