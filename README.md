# Selskapet

* Web site: *[Lightside Instruments AS](https://lightside-instruments.com)*

# Prosjektet

## System overview

Reliabile sensor monitoring netowork on the edge independent of centralized connection and cloud based services based on NETCONF/YANG network managed sensor devices and independent monitoring orchestrators.

The system should demonstrate resilience through redundancy 2x sensor devices and 2x orchestrators.
Down time on 1x orchestrator and 1x sensor should not cause downtime of the system.

<tt>


Device #1                        Orchestrator #1
+-----------------+              +---------+
|  o  1 2 3 4 5 6 |              |         |
+-----------------+              |         |
                                 +---------+

Device #2                        Orchestrator #2
+-----------------+              +---------+
|  o  1 2 3 4 5 6 |              |         |
+-----------------+              |         |
                                 +---------+

</tt>

## Details

repo: [Spark4pi-sensors](https://github.com/Slenderman00/spark4pi-sensors)\
An implementation overview can be found [here](https://github.com/Slenderman00/spark4pi-sensor-project-plan/blob/main/Spark4pi-sensors-impementational-overview.pdf)

Model defined network management platform for sensors with NETCONF/YANG interface:
- 6x sensor interfaces
    - Sensors interface [Sensirion](https://sensirion.com/products/sensor-evaluation)
    - SEK-bridge [Sensirion](https://sensirion.com/products/catalog/SEK-SensorBridge)
- Power Over Ethernet
- Ethernet Interface
- 1U form factor
- Processing
    - Raspberry Pi or Custom board

# Oppgaver

- Cybersecurity
    - Pros and cons of NETCONF/SSH and recommended encryption algorithms (RFC6241)
    - Pros and cons using upstream Debian package repository (optional)
    - Automated tests in python (optional)
    - Build Server (optional)
- Programming
    - Select standard model or implement model in YANG for the device (ietf-hardware.yang vs. lsi-sensors.yang)
    - Implement ietf-alarms.yang both for device and orchestrator
    - Implement API for controlling the board and sensors
    - Implement NETCONF/YANG interface
- Hardware
    - Finish board design for [spark4pi-sensors](https://github.com/Slenderman00/spark4pi-sensors)
