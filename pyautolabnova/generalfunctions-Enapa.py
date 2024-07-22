from dll_path_provider import DLLPathProvider

class GeneralFunctions(DLLPathProvider):
    def __init__(self):
        super().__init__()

    def connect(self):
        if not self.instrument:
            print("Instrument class not available.")
            return False
        try:
            self.instrument.AutolabConnection.EmbeddedExeFileToStart = self.adk_path
            self.instrument.set_HardwareSetupFile(self.hardware_setup_file)
            self.instrument.Connect()
            if self.instrument.AutolabConnection.IsConnected:
                print("Connected successfully.")
                return True
            else:
                print("Connection failed.")
                return False
        except Exception as e:
            print(f"[ERROR] Failed to connect: {e}")
            return False
