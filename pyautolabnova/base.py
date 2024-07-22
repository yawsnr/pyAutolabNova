import os
import sys
import clr
from pathlib import Path

class PyAutolabNova:
    def __init__(self):
        self.instrument = None
        self.is_connected = False
        
        # Get the directory of the current file (base.py)
        current_dir = Path(__file__).parent.absolute()
        self.resources_path = current_dir / "resource_files"
        
        # Add the resources path to sys.path and the DLL search path
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
        
        try:
            clr.AddReference(str(self.sdk_dll))
            from EcoChemie.Autolab.Sdk import Instrument
            self.instrument = Instrument()
            print(f"Instrument type: {type(self.instrument)}")
        except Exception as e:
            print(f"Error initializing instrument: {e}")
            raise RuntimeError(f"Failed to load the SDK and create Instrument: {e}")

    def connect(self):
        if self.instrument is None:
            self._initialize_instrument()
        self.instrument.AutolabConnection.EmbeddedExeFileToStart = str(self.adk_path)
        self.instrument.set_HardwareSetupFile(str(self.hardware_setup_path))
        self.instrument.Connect()
        self.is_connected = True
        print("Connected to AUTOLAB successfully.")

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