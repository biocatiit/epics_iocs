
# BEGIN industryPack.cmd ------------------------------------------------------

# This configures the Industry Pack Support

# First carrier
# OLD CONFIG
# slot a: IP-Octal (serial RS-232)
# slot b: IP-EP201 (softGlue)
# slot c: Ip330 (A/D converter)
# slot d: Dac128V (D/A converter)

#NEW CONFIG
# slot a: IP-448
# slot b: empty
# slot c: empty
# slot d: Ip330

###############################################################################
# Initialize IP carrier
# ipacAddCarrier(ipac_carrier_t *pcarrier, char *cardParams)
#   pcarrier   - pointer to carrier driver structure
#   cardParams - carrier-specific init parameters

# Select for MVME162 or MVME172 CPU board IP carrier.
#ipacAddMVME162("A:l=3,3 m=0xe0000000,64;B:l=3,3 m=0xe0010000,64;C:l=3,3 m=0xe0020000,64;D:l=3,3 m=0xe0030000,64")

# Select for SBS VIPC616-01 version IP carrier.
# ipacAddVIPC616_01("<a16 address>, <a32 address>")
# (fixed 8 MB of a32 memory per module)
#    OR
# ipacAddVIPC616_01("<a16 address>, <a24 address>, <size (kB) of a24 per module>")
#
#ipacAddVIPC616_01("0x3000,0xa0000000")
#ipacAddVIPC616_01("0x3400,0xa2000000")

# Select for Tews TVME-200 (also sold by SBS as VIPC626) version IP carrier.
# Config string is hex values of the six rotary switches on the board.
# In this example, the card is at a16 address 0x3000 ("30"), uses the default
# interrupt assignment ("1"), uses the 32-bit address space for module memory
# ("f"), and maps that memory to A32 address 0xa000000 ("a0")
#ipacAddTVME200("301fa0")
#ipacAddTVME200("341fa2")
ipacAddTVME200("602F90")

# Print out report of IP modules
ipacReport(2)

# Note: the SBS Octal-232 modules are configured in serial.cmd
# and the SBS IP-488 modules are configured in gpib.cmd
# 2017-09-28 Commented out by William Lavender since GPIB support is now being
#            handled by the MX Prologix driver running off of fiend.
###< gpib.cmd

# Systran DAC128V
#< dac128V.cmd

# Analog I/O (Acromag IP330 ADC)
< ip330.cmd

# SBS IpUnidig digital I/O
#< ipUnidig.cmd

#< softGlue.cmd
#< softGlue_C.cmd
# END industryPack.cmd --------------------------------------------------------
