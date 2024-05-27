# DP-Assignment
**Analyzing the demand of cargo vessels at Long Beach Port** 

The Port of Long Beach is one of the busiest ports in the United States and is currently in need for smarter yard management to keep up with the expected increase in cargo volume. One of the first steps to effectively managing yard resources is to understand the variance of demand at the port.

Datasets can be downloaded directly from:
1. AIS Data (AIS_2020_01_01.zip and AIS_2020_01_02.zip): https://coast.noaa.gov/htdata/CMSP/AISDataHandler/2020/index.html
2. Port coordinates: https://msi.nga.mil/api/publications/download?type=view&key=16920959/SFH00000/UpdatedPub150.csv
3. AIS data dictionary may be found in: https://coast.noaa.gov/data/marinecadastre/ais/data-dictionary.pdf

We have two data sets:
1)	AIS_2020_01_01.zip and AIS_2020_01_02.zip, which contains vessel tracking data for the entire US continental region, for the 1st and 2nd of January 2020
2)	UpdatedPub150.csv, which contains the coordinates of marine ports.

## Prequisites 

### Tools and DataBase(wth versions)
* **Postgres - pgAdmin 4(PostgreSQL 16.3, compiled by Visual C++ build 1938, 64-bit)** :  Open Source management tool for Postgres. To store the tables.
* **Anaconda - Jupyter Notebook(7.0.8)** : Notebook System for Data analysis

### Python(3.11.7) Libraries
* **psycopg2(2.9.9 (dt dec pq3 ext lo64))** : is a Python library used to connect to PostgreSQL databases and perform SQL operations from within Python code.
* **gmplot(1.4.1)** : Gmplot is a Python library used to generate Google Maps plots using matplotlib, allowing users to visualize geographic data on interactive Google Maps.
* **pandas(2.1.4)** : Pandas is a Python library used for data manipulation and analysis, providing easy-to-use data structures and functions to work with structured data like tables or spreadsheets.
* **numpy(1.26.4)** : NumPy is a Python library used for numerical computing, providing support for large, multi-dimensional arrays and matrices, along with a collection of mathematical functions to operate on these arrays efficiently.
* **IPython(8.20.0)** : An interactive Python environment that offers enhanced features for coding, debugging, and presenting Python code
* **gc(3.11.7)** : The gc (garbage collector) module provides an interface to the garbage collection mechanism in Python, allowing control over the automatic memory management system.
* **warnings(3.11.7)** : The warnings module provides a flexible way to handle warning messages in Python code, allowing developers to control how warnings are displayed or handled during runtime.
* **plotly(5.9.0)** : Plotly.express is a high-level interface for creating interactive visualizations with Plotly, providing a simple and intuitive API for generating a wide range of plots and charts with minimal code.

## Usage
- Start with SQL Script to create user, define roles and then creating the schema and uploading the data into table.
  Refer this [SQL Script](https://github.com/jyoti2728/DP-Assignment/blob/main/DP_Assignment.sql) for complete steps.
- For further analysis to find if there is any variance with demand from the 1st of January and the 2nd of January. Refer
