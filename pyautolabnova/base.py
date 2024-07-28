import os
import sys
import clr
import time
from pathlib import Path
from System import Enum

class PyAutolabNova:
    '''
    PyAutolabNova: A Python interface for Autolab potentiostat/galvanostat devices.
    
    This class provides methods to initialize, connect, and control Autolab devices.
    It uses the Autolab SDK to communicate with the hardware.
    '''

    def __init__(self):
        '''
        Initialize the PyAutolabNova instance.
        
        This method sets up the necessary paths and files for the Autolab SDK.
        It also initializes the instrument object.
        '''
        self.instrument = None
        self.is_connected = False
        
        # Try to find the resource_files directory
        possible_paths = [
            Path(__file__).parent / "resource_files",
            Path(sys.prefix) / "Lib" / "site-packages" / "pyautolabnova" / "resource_files",
            Path.home() / ".pyautolabnova" / "resource_files"
        ]
        
        self.resources_path = next((p for p in possible_paths if p.exists()), None)
        
        if self.resources_path is None:
            raise FileNotFoundError("Could not find resource_files directory")
        
        sys.path.append(str(self.resources_path))
        os.environ['PATH'] = f"{str(self.resources_path)};{os.environ['PATH']}"
        
        self.sdk_dll = self.resources_path / "EcoChemie.Autolab.Sdk.dll"
        self.adk_path = self.resources_path / "Hardware Setup Files" / "Adk.x"
        self.hardware_setup_path = self.resources_path / "Hardware Setup Files" / "PGSTAT302N" / "HardwareSetup.FRA32M.xml"
        
        self._initialize_instrument()
        
    def _initialize_instrument(self):
        '''
        Initialize the Autolab instrument object.
        
        This method checks for required files and creates an instance of the Instrument class.
        '''
        required_files = [self.sdk_dll, self.adk_path, self.hardware_setup_path]
        if not all(f.exists() for f in required_files):
            raise FileNotFoundError(f"Required files not found. Please check the following paths:\n"
                                    f"SDK DLL: {self.sdk_dll}\n"
                                    f"ADK: {self.adk_path}\n"
                                    f"Hardware Setup: {self.hardware_setup_path}")
        
        clr.AddReference(str(self.sdk_dll))
        from EcoChemie.Autolab.Sdk import Instrument
        self.instrument = Instrument()

    def connect(self):
        '''
        Connect to the Autolab device.
        
        This method establishes a connection with the Autolab hardware.
        It sets up the necessary files and attempts to connect to the device.
        '''
        if self.instrument is None:
            self._initialize_instrument()
        self.instrument.AutolabConnection.EmbeddedExeFileToStart = str(self.adk_path)
        self.instrument.set_HardwareSetupFile(str(self.hardware_setup_path))
        try:
            self.instrument.Connect()
            self.is_connected = True
            print("Connected to AUTOLAB successfully.")
        except Exception as e:
            print(f"An unexpected error occurred while connecting to AUTOLAB: {str(e)}")
            self.is_connected = False

    def disconnect(self):
        '''
        Disconnect from the Autolab device.
        
        This method safely disconnects from the Autolab hardware and resets the connection status.
        '''
        if self.instrument is not None and self.is_connected:
            try:
                self.instrument.Disconnect()
                self.is_connected = False
                print("Disconnected from AUTOLAB.")
            except Exception as e:
                print(f"Error during disconnection: {str(e)}")
            finally:
                self.instrument = None
                self.is_connected = False

    def autolab_control(self, mode, current_range, bandwidth):
        '''
        Set up the Autolab control parameters.
        
        Args:
            mode (str): 'potentiostatic' or 'galvanostatic'
            current_range (str): e.g., '1a', '100ma', '10ma', etc.
            bandwidth (str): 'highstability', 'highspeed', or 'ultrahighspeed'
        
        This method configures the Autolab device with the specified mode, current range, and bandwidth.
        '''
        if not self.is_connected:
            raise RuntimeError("Not connected to AUTOLAB. Please connect first.")
        
        # Set mode
        mode_map = {
            'potentiostatic': self.instrument.Ei.EIMode.Potentiostatic,
            'galvanostatic': self.instrument.Ei.EIMode.Galvanostatic
        }
        self.instrument.Ei.Mode = mode_map[mode.lower()]
        print(f"Mode set to: {mode}")

        # Set current range
        range_map = {
            '1a': self.instrument.Ei.EICurrentRange.CR07_1A,
            '100ma': self.instrument.Ei.EICurrentRange.CR08_100mA,
            '10ma': self.instrument.Ei.EICurrentRange.CR09_10mA,
            '1ma': self.instrument.Ei.EICurrentRange.CR10_1mA,
            '100ua': self.instrument.Ei.EICurrentRange.CR11_100uA,
            '10ua': self.instrument.Ei.EICurrentRange.CR12_10uA,
            '1ua': self.instrument.Ei.EICurrentRange.CR13_1uA,
            '100na': self.instrument.Ei.EICurrentRange.CR14_100nA,
            '10na': self.instrument.Ei.EICurrentRange.CR15_10nA
        }
        self.instrument.Ei.CurrentRange = range_map[current_range.lower()]
        print(f"Current range set to: {current_range}")

        # Set bandwidth
        bandwidth_map = {
            'highstability': self.instrument.Ei.EIBandwidth.High_Stability,
            'highspeed': self.instrument.Ei.EIBandwidth.High_Speed,
            'ultrahighspeed': self.instrument.Ei.EIBandwidth.UltraHigh_Speed
        }
        self.instrument.Ei.Bandwidth = bandwidth_map[bandwidth.lower()]
        print(f"Bandwidth set to: {bandwidth}")

    def set_cell_on(self):
        '''
        Turn on the Autolab cell.
        
        This method enables the cell in the Autolab device.
        '''
        if not self.is_connected:
            raise RuntimeError("Not connected to AUTOLAB. Please connect first.")
        
        self.instrument.Ei.CellOnOff = self.instrument.Ei.EICellOnOff.On
        print("Cell turned on.")

    def set_cell_off(self):
        '''
        Turn off the Autolab cell.
        
        This method disables the cell in the Autolab device.
        '''
        if not self.is_connected:
            raise RuntimeError("Not connected to AUTOLAB. Please connect first.")
        
        self.instrument.Ei.CellOnOff = self.instrument.Ei.EICellOnOff.Off
        print("Cell turned off.")

    # def apply_current(self, current):
    #     '''
    #     Apply a specified current to the Autolab device.
    #     
    #     Args:
    #         current (float): The current to apply in Amperes.
    #     
    #     This method is currently not implemented due to issues with the hardware response.
    #     '''
    #     # Implementation pending

    # def record_signals(self, duration, interval):
    #     '''
    #     Record signals from the Autolab device for a specified duration and interval.
    #     
    #     Args:
    #         duration (float): The total duration to record in seconds.
    #         interval (float): The time interval between readings in seconds.
    #     
    #     Returns:
    #         list: A list of tuples containing (time, current, potential) readings.
    #     
    #     This method is currently not implemented due to issues with the hardware response.
    #     '''
    #     # Implementation pending

    def __del__(self):
        '''
        Destructor for the PyAutolabNova class.
        
        This method ensures that the connection to the Autolab device is properly closed
        when the PyAutolabNova object is destroyed.
        '''
        self.disconnect()

# Create a single instance of PyAutolabNova
try:
    pyautolabnova = PyAutolabNova()
    print("PyAutolabNova initialized successfully.")
except Exception as e:
    print(f"Failed to initialize PyAutolabNova: {e}")
    pyautolabnova = None