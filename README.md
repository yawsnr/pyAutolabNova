# PyAutolabNova

PyAutolabNova has progressed to its Alpha stage, marking a significant advancement from the pre-Alpha version. In this release, I've implemented basic functionalities for connecting to and controlling Autolab devices. Users can now set the mode, current range, and bandwidth, as well as toggle the cell on and off. I've also enhanced the error handling and connection process. While I've temporarily removed some non-functioning methods like apply_current and record_signals, the current version allows for basic electrochemistry experiments. As an Alpha release, the software may have limitations, but it's now ready for early adopters to explore. I welcome any feedback as I continue to develop and expand PyAutolabNova's capabilities. For the latest updates and enhancements, please refer to the documentation or repository.

## Current version
See changelog for detailed changes for each release

This is a Python package for interfacing with Metrohm Autolab instruments. It provides a high-level API for controlling and data acquisition from Autolab potentiostats.

## Installation

You can install PyAutolabNova using pip: 

```
pip install pyautolabnova
```


## Requirements

- Windows operating system
- Python 3.7 or higher
- Metrohm Autolab SDK 2.1 installed

## Usage
Please ensure the Autolab software is closed before using this package. Otherwise, you will encounter an 'Access Denied' error because the Autolab software maintains an exclusive lock on the USB device, preventing the Python script from accessing it through the SDK.


Here's a basic example of how to use PyAutolabNova:

```
from pyautolabnova.base import pyautolabnova as pal

pal.connect()
# Perform operations
pal.disconnect()

```

## Disclaimer
This package is not officially associated with or endorsed by Metrohm Autolab. Use at your own risk.
