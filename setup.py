from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="pyautolabnova",
    version="0.0.1a1",
    author="Dr. Yaw Ofosu Ansong Snr",
    author_email="yaw.srr@gmail.com",
    description="A python package for interfacing with Metrohm Autolab instruments",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yawsnr/pyautolabnova",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Operating System :: Microsoft :: Windows",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
    ],
    python_requires=">=3.7",
    install_requires=[
        "pythonnet>=3.0.0"
    ],
)