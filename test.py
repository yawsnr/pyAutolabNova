from pyautolabnova.base import pyautolabnova as pal

try:
    pal.connect()
    
    # Step 1: Autolab control
    pal.autolab_control(mode='galvanostatic', current_range='1ma', bandwidth='highspeed')
    
    # Step 2: Cell on
    pal.set_cell_on()
    
    
    
    # Last step: Cell off
    pal.set_cell_off()

except Exception as e:
    print(f"An error occurred: {str(e)}")

finally:
    pal.disconnect()