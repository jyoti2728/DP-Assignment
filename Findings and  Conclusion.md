# Strategy

### Sampling down AIS data

* **Cargo Vessels** : Since we are required to study on cargo vessels, filter out by putting the vesseltype codes. The reference for cargo vessels type code can be found in VesselTypeCodes2018.pdf file.
  By Doing this the data would signigicantly reduce from millions to hunderds of rows.

| Date  | Total mmsi | Total Cargo mmsi |
| ------------- | ------------- | ------------- |
| 01/01/2020  | 7,040,389  | 408,934  |
| 02/01/2020  | 6,981,827  |  398,911  |

*  **Bounding box** : To f
