# Remote Shutter Control
#    Used to 'Open' and 'Close' the shutters using the remote shutter
#    control box.
# Macros:
#   OUT=x where $(P)LJT4:1:DO$(OUT) (physical output PV - see Labjack_T4_1.substitutions)


dbLoadRecords("$(TOP)/labjackApp/Db/rshtr_A.db", "P=18ID:,OUT1=12,OUT2=13")
dbLoadRecords("$(TOP)/labjackApp/Db/rshtr_D.db", "P=18ID:,OUT1=14,OUT2=15")
