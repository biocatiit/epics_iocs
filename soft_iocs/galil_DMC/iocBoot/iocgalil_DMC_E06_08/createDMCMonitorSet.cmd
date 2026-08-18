##################################################################################################
# Create an autosave monitor set for a DMC instance
##################################################################################################
# Save motor positions every 5 seconds
create_monitor_set("all_positions.req", 5,"P1=$(P1),P2=$(P2),P3=$(P3)")
# Save motor settings every 30 seconds
create_monitor_set("all_settings.req", 30,"IOC=$(IOCPREFIX),P1=$(P1),P2=$(P2),P3=$(P3)")
# Save kinematics every 30 seconds
create_monitor_set("all_kinematics.req", 30,"P1=$(P1),P2=$(P2),P3=$(P3)")
