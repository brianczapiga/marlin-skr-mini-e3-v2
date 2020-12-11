# marlin build

This is specifically for the SKR Mini E3 V2.0.

Once the Docker image is built, subsequent compiles should be relatively quick.

Please note that by default the `.gitignore` will cause git to ignore the `marlin` (source) directory. This may be significant if you fork this repository and expect to track changes made to your own configuration.

# requirements

- docker
- linux or macos (not made for windows)
- make

# setup

```
make docker-build
make clone
make default-config
```

This will:

- build the docker image (containing the arduino-cli and platformio)
- clone the marlin source in the current directory
- pull in the default configuration from BTT.

# enable bl touch

You can enable bl touch by running the following:

```
make enable-bltouch
```

Follow the link in references for the auto bed leveling guide.

You must follow the `Measure NOZZLE_TO_PROBE_OFFSET` section.

# further notes

The master branch is cloned by default, you may wish to checkout a different branch (bug fix for instance)

The source and config are only pulled during setup (above, when using the respective Makefile targets.)

# building the firmware

```
make build
```

The firmware will be in the current path at `marlin/.pio/build/STM32F103RC_btt/firmware.bin`

# references

- ender 3 guide: `https://www.reddit.com/r/ender3/comments/h8y1ia/marlin_20x_guide_skr_mini_e3_v20_ender_3`
- auto bed leveling guide: `https://www.reddit.com/r/3Dprinting/comments/hx6ab3/bed_leveling_bltouch_inductive_sensor/`
