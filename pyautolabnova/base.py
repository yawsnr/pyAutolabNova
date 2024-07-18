import os
import sys
import clr
from pathlib import Path

class Base:
    def __init__(self):
        self.autolab = None
        self.sdk_path = R"C:\Program Files\Metrohm Autolab\Autolab SDK 2.1"
        self.sdk = os.path.join(self.sdk_path, "EcoChemie.Autolab.Sdk.dll")
        self.adx_path = os.path.join(self.sdk_path, "Hardware Setup Files", "Adk.x")
        self.hdw_path = os.path.join(self.sdk_path, "Hardware Setup Files", "PGSTAT302N", "HardwareSetup.FRA32M.xml")

    def connect(self):
        sys.path.append(self.sdk_path)
        clr.AddReference(Path(self.sdk).stem)
        from EcoChemie.Autolab.Sdk import Instrument
        self.autolab = Instrument()
        self.autolab.AutolabConnection.EmbeddedExeFileToStart = self.adx_path
        self.autolab.set_HardwareSetupFile(self.hdw_path)
        self.autolab.Connect()
        print("Connected to AUTOLAB successfully.")

    def disconnect(self):
        if self.autolab:
            try:
                self.autolab.Disconnect()
                print("Disconnected from AUTOLAB.")
            except Exception as e:
                print(f"Error during disconnection: {str(e)}")

    def __del__(self):
        self.disconnect()