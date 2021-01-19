
# BEGIN vme.cmd ---------------------------------------------------------------

##### Motors

# OMS VME driver setup parameters:
#     (1)cards, (2)base address(short, 16-byte boundary),
#     (3)interrupt vector (0=disable or  64 - 255), (4)interrupt level (1 - 6),
#     (5)motor task polling rate (min=1Hz,max=60Hz)
#omsSetup(2, 0xFC00, 180, 5, 10)

# OMS VME58 driver setup parameters:
#     (1)cards, (2)base address(short, 4k boundary),                  
#     (3)interrupt vector (0=disable or  64 - 255), (4)interrupt level (1 - 6),
#     (5)motor task polling rate (min=1Hz,max=60Hz)
#oms58Setup(1, 0x1000, 190, 5, 10)

# Highland V544 driver setup parameters:
#     (1)cards, (2)base address(short, 4k boundary),
#     (3)interrupt vector (0=disable or  64 - 255), (4)interrupt level (1 - 6),
#     (5)motor task polling rate (min=1Hz,max=60Hz)
#v544Setup(0, 0xDD00, 0, 5, 10)

### Scalers: Joerger VSC8/16
## AL: new record to account for dark currenct
dbLoadRecords("mx_scaler16.db","P=18ID:,S=scaler2,OUT=#C0 S0 @,DTYP=Joerger VSC8/16,FREQ=10000000")
#dbLoadRecords("$(STD)/stdApp/Db/scaler.db","P=18ID:,S=scaler2,OUT=#C0 S0 @,DTYP=Joerger VSC8/16,FREQ=10000000")
# Joerger VSC setup parameters:
#     (1)cards, (2)base address(ext, 256-byte boundary),
#     (3)interrupt vector (0=disable or  64 - 255)
VSCSetup(1, 0xB0000000, 200)

# Joerger VS
# scalerVS_Setup(int num_cards, /* maximum number of cards in crate */
#       char *addrs,            /* address (0x800-0xf800, 2048-byte (0x800) boundary) */
#       unsigned vector,        /* valid vectors(64-255) */
#       int intlevel)
##!##scalerVS_Setup(1, 0x8000, 180, 5)
#devScaler_VSDebug=20
##!##dbLoadRecords("$(STD)/stdApp/Db/scaler32.db","P=18ID:,S=scaler3,OUT=#C0 S0 @, DTYP=Joerger VS, FREQ=10000000")

# Heidenhain IK320 VME encoder interpolator
#dbLoadRecords("$(VME)/vmeApp/Db/IK320card.db","P=18ID:,sw2=card0:,axis=1,switches=41344,irq=3")
#dbLoadRecords("$(VME)/vmeApp/Db/IK320card.db","P=18ID:,sw2=card0:,axis=2,switches=41344,irq=3")
#dbLoadRecords("$(VME)/vmeApp/Db/IK320group.db","P=18ID:,group=5")

### Struck SIS3820 multichannel scaler
###   (formerly 7201 (same as SIS 3806 multichannel scaler))

#iocsh "st_SIS3801.iocsh"
iocsh "st_SIS3820.iocsh"

# subArray records for the Struck 3820.  They are used to make it possible
# to read out individual measurements from Struck scaler channels.
# (Added by W. Lavender, 2018-09-30)
#<vme-sis3820-meas.cmd

# VMI4116 setup parameters: 
#     (1)cards, (2)base address(short, 36-byte boundary), 
#devAoVMI4116Debug = 20
#VMI4116_setup(1, 0xff00)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=1,S=0,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=2,S=1,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=3,S=2,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=4,S=3,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=5,S=4,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=6,S=5,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=7,S=6,DTYP=VMIVME-4116,H=65536,L=0", std)
#dbLoadRecords("$(VME)/vmeApp/Db/VME_DAC.db", "P=18ID:,D=2,C=0,N=8,S=7,DTYP=VMIVME-4116,H=65536,L=0", std)

# vme test record
dbLoadRecords("$(VME)/vmeApp/Db/vme.db", "P=18ID:,Q=vme1")

# Hewlett-Packard 10895A Laser Axis (interferometer)
#dbLoadRecords("$(VME)/vmeApp/Db/HPLaserAxis.db", "P=18ID:,Q=HPLaser1, C=0")
# hardware configuration
# example: devHP10895LaserAxisConfig(ncards,a16base)
#devHPLaserAxisConfig(2,0x1000)

# Acromag AVME9440 setup parameters:
# devAvem9440Config (ncards,a16base,intvecbase)
devAvme9440Config(1,0x2800,0x78)

### Acromag general purpose Digital I/O (18ID:bi0-bi15 and 18ID:bo0-15)
### BioCAT custom db files included in the substitutions file
### - Channels 0--15 can provide digital output
### - Channels 0--7 are scanned in I/O interrupt mode
### - Channels 8--15 are scanned in passive mode
### - Channels 16--31 provide digital output readback
dbLoadTemplate("digital_O.substitutions")
dbLoadTemplate("digital_I_0-7.substitutions")
dbLoadTemplate("digital_I_8-15.substitutions")
dbLoadTemplate("digital_I_readback.substitutions")

#dbLoadRecords("$(VME)/vmeApp/Db/Acromag_16IO.db", "P=18ID:, A=1, C=0")

# Bunch-clock generator
#dbLoadRecords("$(VME)/vmeApp/Db/BunchClkGen.db","P=18ID:")
#dbLoadRecords("$(VME)/vmeApp/Db/BunchClkGenA.db", "UNIT=18ID")
# hardware configuration
# example: BunchClkGenConfigure(intCard, unsigned long CardAddress)
#BunchClkGenConfigure(0, 0x8c00)

### GP307 Vacuum Controller
#dbLoadRecords("$(VME)/vmeApp/Db/gp307.db","P=18ID:")

# Machine Status Link (MSL) board (MRD 100)
#####################################################
# devAvmeMRDConfig( base, vector, level )
#    base   = base address of card
#    vector = interrupt vector
#    level  = interrupt level
# For Example
#    devAvmeMRDConfig(0xA0000200, 0xA0, 5)
#####################################################
#  Configure the MSL MRD 100 module.....
#devAvmeMRDConfig(0xB0000200, 0xA0, 5)    
#dbLoadRecords("$(VME)/vmeApp/Db/msl_mrd100.db","C=0,S=01,ID1=01,ID2=01us")

# Allen-Bradley 6008 scanner
#abConfigNlinks 1
#abConfigVme 0,0xc00000,0x60,5
#abConfigAuto

# APS quad electrometer
#<quadEM.cmd

# END vme.cmd -----------------------------------------------------------------
