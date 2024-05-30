# Strategy

### Sampling down AIS data

* **Cargo Vessels** : Since we are required to study on cargo vessels, filter out by putting the vesseltype codes. The reference for cargo vessels type code can be found in [VesselTypeCodes2018.pdf](https://github.com/jyoti2728/DP-Assignment/blob/main/VesselTypeCodes2018.pdf) file.
  By Doing this the data would signigicantly reduce from millions to hunderds of rows.

| Date  | Total mmsi | Total Cargo mmsi |
| ------------- | ------------- | ------------- |
| 01/01/2020  | 7,040,389  | 408,934  |
| 02/01/2020  | 6,981,827  |  398,911  |

*  **Bounding box** : To further sample down the cargo vessels data, create the bounding box that will capture on those vessels which were near the Long Beach Port.
   **How to decide the height and width of box?**
     1) Start with plotting all the ports coordinates to observe the proximity of one port with another so that we do not include the demand of other ports.

    The green one is the Long Beach Port and black ones are other ports whose **harbor use** are not defined.
    ![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/714961b4-3ac0-4996-b204-d3ecd7d6d305)

    If we zoom it a little bit to clearly see the bounding box boundaries:
    ![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/c8586d33-f0c9-4384-b6e6-5f287540b636)

   #### After few simulation , the approporiate height and width that encompass the Long Beach Port and cargo vessels throughout the day
    * *height=0.0485* 
    * *width=0.0966*
 
    *For illustartion purpose , plotted just few samples from the entire data to show cargo vessels that were near Long Beach Port throughout the day*
    ![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/611f34a1-8659-41b0-bcb3-c611fae66a49)
  
  ### Demand variance between 1<sup>st</sup> Jan 2020 to 2<sup>nd</sup> Jan 2020
  The appoporiate temporal resolution to illustrate the demand variation that port experienced throughout the day is by plotting a line chart.  
![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/8e7be69a-928d-40ad-8f7e-c44c20e50a4f)

### It is clearly visible from the plot that there is large variance in demand from 1st Jan to 2nd Jan

### To check this statistcally, use paired t-test for determining whether there is a significant difference in demand between January 1st and January 2nd

**Null Hypothesis** :There's no difference in the mean number of vessels between January 1st and January 2nd.

*Results* : Paired t-test:

P-value: 8.85843279270694e-05

**Reject the null hypothesis. There is a statistically significant difference in demand.**

### **why there is demand variation?** 
_Assumption is that, this could be a holiday effect. January 1st is New Year's Day, a public holiday in the United States. So, there might be reduced operational activities at ports due to closures or reduced working hour that delayed all operations until after the holiday, leading to lower demand for cargo vessels on January 1st compared to other days._

To support this, if we look demand for 3rd and 4th Jan 2020 with same filters.
![image](https://github.com/jyoti2728/DP-Assignment/assets/170928275/bc93f535-61d6-40e9-88bd-1122cc37eafd)

We can cleary see there is no demand shift from 2nd Jan to 4th Jan and there have almost similar demand throughout the day.

