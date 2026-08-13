# Autosave monitor sets for DMC (digital motor controllers)
##################################################################################################

# DMC autosave restore configuration
# restore settings in pass 0 so encoder ratio is set correctly for position restore in device support init
set_pass0_restoreFile("all_settings.sav")
# restore positions in pass 0 so motors don't move
set_pass0_restoreFile("all_positions.sav")
# restore kinematic equation character arrays in pass 1
set_pass1_restoreFile("all_kinematics.sav")


##################################################################################################
# Create an autosave monitor set for a DMC instance
##################################################################################################
# Save motor positions every 5 seconds
create_monitor_set("all_positions.req", 5,"P1=$(P1),P2=$(P2),P3=$(P3)")
# Save motor settings every 30 seconds
create_monitor_set("all_settings.req", 30,"IOC=$(IOCPREFIX),P1=$(P1),P2=$(P2),P3=$(P3)")
# Save kinematics every 30 seconds
create_monitor_set("all_kinematics.req", 30,"P1=$(P1),P2=$(P2),P3=$(P3)")
