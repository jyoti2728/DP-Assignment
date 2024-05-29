# Strategy

### Sampling down AIS data

* **Cargo Vessels** : Since we are required to study on cargo vessels, filter out by putting the vesseltype codes. The reference for cargo vessels type code can be found in VesselTypeCodes2018.pdf file.
  By Doing this the data would signigicantly reduce from millions to hunderds of rows.

| Date  | Total mmsi | Total Cargo mmsi |
| ------------- | ------------- | ------------- |
| 01/01/2020  | 7,040,389  | 408,934  |
| 02/01/2020  | 6,981,827  |  398,911  |

*  **Bounding box** : To further sample down the cargo vessels data, create the bounding box that will capture on thoso vessels which were near the Long Beach Port.
   **How to decide the height and widht of box?**
     1) Start with plotting all the ports coordinates to observe the proximity of one port with another so that we do not include the demand of other ports.

    The green one is the Long Beach Port and black ones are other ports whose harbor use is not defined.
    ![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/714961b4-3ac0-4996-b204-d3ecd7d6d305)

    If we zoom it a little bit to clearly see the bounding box boundaries:
    ![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/c8586d33-f0c9-4384-b6e6-5f287540b636)

