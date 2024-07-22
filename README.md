# PyAutolabNova

This is the pre-Alpha release of PyAutolabNova. If you're seeing this package, you came here too early. This pre-Alpha release is to reserve the package name. Please check back in about a months time when this package will be able to perform basic functionalities like running basic electrochmeistry experiment. 

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
Please ensure the Autolab software is close before using this script otherwise you will run into an Access Denied but from the Autolab software maintaining an exclusive lock on the USB device, preventing the Python script from accessing it through the SDK.


Here's a basic example of how to use PyAutolabNova:

```
from pyautolabnova import Base

base = Base()
base.connect()
# Perform operations here
base.disconnect()

```

## Disclaimer
This package is not officially associated with or endorsed by Metrohm Autolab. Use at your own risk.
