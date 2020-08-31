[![Build Status](https://travis-ci.org/adcroft/OM4_025_preprocessing_geothermal.svg?branch=master)](https://travis-ci.org/adcroft/OM4_025_preprocessing_geothermal)
[![DOI](https://zenodo.org/badge/91632880.svg)](https://zenodo.org/badge/latestdoi/91632880)

## What this repository is for

The python script regrid_geothermal.py interpolates the Davies 2013 geothermal heat
flow data to GFDL's OM4 0.125 degree grid. This repository documents (via a Makefile)
the process of fetching and interpolating the data and includes tests for reproducibility
and posterity.

## Usage

```bash
make
```

## What happens

- Fetches [another repository](https://github.com/adcroft/convert_Davies_2013) that
  downloads the supplemental material from Davies 2013 and converts the data to
  portable netcdf format.
- Fetches the OM4 0.125 degree grid (this is generated in a specific environment which is
  not yet running under Travis so is currently downloaded from an ftp server).
- Interpolates the data and writes a new netcdf file.
- Checks the md5sum of generated files match.

## References

- Davies, J. Huw, 2013: Global map of solid Earth surface heat flow. Geochemistry, Geophysics, Geosystems, 14 (10), pp 4608--4622. [doi:10.1002/ggge.20271](http://dx.doi.org/10.1002/ggge.20271)
- https://github.com/adcroft/convert_Davies_2013
- https://github.com/NOAA-GFDL/MOM6-examples/tree/dev/master/ice_ocean_SIS2/OM4_025/preprocessing
