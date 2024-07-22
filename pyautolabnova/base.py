import os
import sys
import clr
from pathlib import Path

class PyAutolabNova:
    def __init__(self):
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
        if self.instrument is None:
            self._initialize_instrument()
        self.instrument.AutolabConnection.EmbeddedExeFileToStart = str(self.adk_path)
        self.instrument.set_HardwareSetupFile(str(self.hardware_setup_path))
        try:
            self.instrument.Connect()
            self.is_connected = True
            print("Connected to AUTOLAB successfully.")
        except Exception as e:
            if "Access is denied" in str(e):
                print("Error: Unable to connect to AUTOLAB.")
                print("Please ensure that Nova software is closed and no other application is using the instrument.")
                print("If the problem persists, try disconnecting and reconnecting the USB cable, or restarting your computer.")
            else:
                print(f"An unexpected error occurred while connecting to AUTOLAB: {str(e)}")
            self.is_connected = False
            

    def disconnect(self):
        if self.instrument is not None and self.is_connected:
            try:
                self.instrument.Disconnect()
                self.is_connected = False
                print("Disconnected from AUTOLAB.")
            except Exception as e:
                print(f"Error during disconnection: {str(e)}")

    def __del__(self):
        self.disconnect()

# Create a single instance of PyAutolabNova
try:
    pyautolabnova = PyAutolabNova()
    print("PyAutolabNova initialized successfully.")
except Exception as e:
    print(f"Failed to initialize PyAutolabNova: {e}")
    pyautolabnova = None