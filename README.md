# marlin build

This is specifically for the SKR Mini V2.0.

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

This will setup marlin in the current directory and pull in the default configuration.

# enable bl touch

You can enable bl touch by running the following:

```
make enable-bltouch
```

Please note, follow the link in references for the auto bed leveling guide.

You must follow the `Measure NOZZLE_TO_PROBE_OFFSET` section.


# building the firmware

```
make build
```

The firmware will be in the current path at `marlin/.pio/build/STM32F103RC_btt/firmware.bin`

# references

- ender 3 guide: `https://www.reddit.com/r/ender3/comments/h8y1ia/marlin_20x_guide_skr_mini_e3_v20_ender_3`
- auto bed leveling guide: `https://www.reddit.com/r/3Dprinting/comments/hx6ab3/bed_leveling_bltouch_inductive_sensor/`
