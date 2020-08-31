GENERATED_FILE = geothermal_davies2013_v1.nc
GRID_FILE = ocean_hgrid.nc
DATA_FILE = convert_Davies_2013/ggge20271-sup-0003-Data_Table1_Eq_lon_lat_Global_HF.nc
MD5_FILE = check.md5

all: check

# Interpolate geothermal data to ocean model grid
geothermal_davies2013_v1.nc: $(DATA_FILE) | $(GRID_FILE)
	python regrid_geothermal.py

# Fetch/create model grid file (super-grid)
$(GRID_FILE):
	cp /archive/Raphael.Dussin/datasets/OM4p125/OM4p125_grid_20200824_noiceshelves_unpacked/$@ $@

# Fetch/create geothermal data file
$(DATA_FILE): | convert_Davies_2013
	cd $|; make
convert_Davies_2013:
	git clone https://github.com/adcroft/$@.git

# Create md5 checksums file only if missing
$(MD5_FILE): | $(GRID_FILE) $(DATA_FILE) $(GENERATED_FILE)
	md5sum $| > $@

# Check that md5 checksums match after creating netcdf file
check: $(GENERATED_FILE) | $(MD5_FILE)
	md5sum -c $(MD5_FILE)

# Remove intermediate/generated files
clean:
	-rm -f $(GRID_FILE) $(DATA_FILE) $(GENERATED_FILE)
