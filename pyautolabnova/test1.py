# test.py in examples directory
from autolab import Autolab

def test_connection():
    device = Autolab()
    if device.connect():
        print("Connection established.")
    else:
        print("Failed to connect.")

if __name__ == "__main__":
    test_connection()
