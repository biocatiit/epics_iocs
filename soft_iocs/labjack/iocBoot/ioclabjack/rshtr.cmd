# Remote Shutter Control
#    Used to 'Open' and 'Close' the shutters using the remote shutter
#    control box.
# Macros:
#   $(P)$(OUT) should provide labjack speification, e.g. 18ID:LJT4:1:Bo12
#   physical output PV - see Labjack_T4_1.substitutions)


dbLoadRecords("$(TOP)/labjackApp/Db/rshtr_A.db", "P1=18ID:,P=18ID:LJT4:1:,OUT1=Bo12,OUT2=Bo13")
dbLoadRecords("$(TOP)/labjackApp/Db/rshtr_D.db", "P1=18ID:,P=18ID:LJT4:1:,OUT1=Bo14,OUT2=Bo15")
