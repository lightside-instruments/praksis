# Company

* Web site: *[Lightside Instruments AS](https://lightside-instruments.com)*

# Project

## System overview

Reliabile sensor monitoring network on the edge independent of centralized connection and cloud based services based on NETCONF/YANG network managed sensor devices and independent monitoring orchestrators.

The system should demonstrate resilience through redundancy 2x sensor devices and 2x orchestrators.
Down time on 1x orchestrator and 1x sensor should not cause downtime of the system.

The orchestrators should keep records of the measured sensor data and generate alarm when alarm thresholds are crossed. Data collection of data flows and alarm handling (e.g. Node-RED needs NETCONF Connector), There should be visualization (e.g. Grafana) displaying the timeseries data.

The system is to be installed and demonstrated in the laser cutter room where monitoring of temperature, humidity and toxic gas (e.g. Chlorine (CL2)) concentrations is important. Also a digital sensor for simulation of sensor events in the process of validation and testing should be implemented. Triggering this event should be done with independent device that also implements a NETCONF/YANG interface.


<tt>


Device #1                        Orchestrator #1
+-----------------+              +---------+
|  o  1 2 3 4 5 6 |              |         |
+-----------------+       _      |         |
                         \ /     +---------+
                          x
Device #2                /_\     Orchestrator #2
+-----------------+              +---------+
|  o  1 2 3 4 5 6 |              |         |
+-----------------+              |         |
                                 +---------+

</tt>

## Details

repo: [Spark4pi-sensors](https://github.com/Slenderman00/spark4pi-sensors)\
A project description can be found [here](https://github.com/Slenderman00/spark4pi-sensor-project-plan/blob/085f62d7cc909bd49f87859c767897c551bc6023/Report.pdf)

Model defined network management platform for sensors with NETCONF/YANG interface:
- 6x sensor interfaces
    - Sensors interface [Sensirion](https://sensirion.com/products/sensor-evaluation)
        - [STS3x-DIS](https://sensirion.com/media/documents/1DA31AFD/65D613A8/Datasheet_STS3x_DIS.pdf)
    - SEK-bridge [Sensirion](https://sensirion.com/products/catalog/SEK-SensorBridge)
- Power Over Ethernet
- Ethernet Interface
- 1U form factor
- Processing
    - Raspberry Pi or Custom board

# Tasks
- Administration
    - [x] Installation of Debian Raspberry Pi (Christian 1 hour)
    - [x] Installation of Ubuntu 24 on laptop (Christian 1 hour)
- IETF Hackathon 122 (remote) 15 - 16 March 2025
    - [ ] Register as remote participants https://registration.ietf.org/122/new/hackathon_remote/
    - [x] Running testsuite and releasing yuma123-2.14
    - [x] Debian packaging of yuma123-2.14
- Cybersecurity
    - Quantitative analysis of NETCONF and YANG security
    - Pros and cons of NETCONF/SSH and recommended encryption algorithms (RFC6241)
    - Pros and cons using upstream Debian package repository (optional)
    - Automated tests in python (optional)
    - Build Server (optional)
    - Compare NETCONF with MODBUS
- Programming
    - Orchestrator: node-red flow with NETCONF <get> and NETCONF yangcli automated <edit> functionality
      - [x] Node JS yangrpc bindings
    - Timeseries XPATH
    - Select standard model or implement model in YANG for the device (ietf-hardware.yang vs. lsi-sensors.yang)
    - Implement ietf-alarms.yang both for device and orchestrator
    - Implement API for controlling the board and sensors
    - Implement NETCONF/YANG interface
      - [x] Implementation of lsi-thermometer.yang added thermometers-get-raspberry-pi-i2c-sts3x shell script (Joar,Christian 1 hour)
      - [x] Implementation of lsi-lights.yang
    - Yuma123 CI github action
- Hardware
    - Finish board design for [spark4pi-sensors](https://github.com/Slenderman00/spark4pi-sensors)

- Demo Rack
    - [ ] 2x DIN rail mounting brackets for Raspberry Pi
    - [ ] 2x DIN rail mounting brackets for Display
    - [ ] 2x I2C sensor boards
    - [ ] 1x mounting rail for PoE Switch
    - [ ] Alarm light



# Topology:
 [Orchestrator Node Node-Red/Graphana - 10.0.0.?]  [Alarm Light Node - 10.0.0.15] [Sensor Node 1 - 10.0.0.?] [Sensor Node 2 - 10.0.0.?]


# Used yangcli commands:

Alarm RGB LED light node:
 replace /lights/light[name='main'] -- red=255 green=0 blue=0
