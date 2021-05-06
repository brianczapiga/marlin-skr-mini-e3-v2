# build docker container
docker-build:
	docker build -t marlin-build -f Dockerfile.marlin-build .

clone:
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build git clone https://github.com/MarlinFirmware/Marlin.git /marlin

#extract-configs:	docker-build
	# copy configs to `pwd`/config
	#docker run -it --rm -v`pwd`:/local marlin-build cp -r /config /local

default-config:
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build cp /config/Configuration.h /config/Configuration_adv.h /config/_Bootscreen.h /config/_Statusscreen.h /marlin/Marlin
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sed -i '/default_envs/s/.*/default_envs = STM32F103RC_btt_512k/' /marlin/platformio.ini

enable-bltouch:
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sed -i '/BLTOUCH/s/\/\///' /marlin/Marlin/Configuration.h
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sed -i '/XY_PROBE_SPEED/s/.*/\#define XY_PROBE_SPEED \(100*60\)/' /marlin/Marlin/Configuration.h
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sed -i '/BLTOUCH_SET_5V_MODE/s/\/\///' /marlin/Marlin/Configuration_adv.h
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sed -i '/BLTOUCH_DELAY/s/.*/\#define BLTOUCH_DELAY 500/' /marlin/Marlin/Configuration.h
	@echo consider modifying Configuration.h for Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN and AUTO_BED_LEVELING_BILINEAR
	@echo also you must set NOZZLE_TO_PROBE_OFFSET

interact:
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build /bin/bash

build:
	@rm -f marlin/.pio/build/STM32F103RC_btt/firmware.*
	docker run -it --rm -v`pwd`/marlin:/marlin marlin-build sh -c '(cd /marlin;/root/.platformio/penv/bin/platformio run)'
	cp marlin/.pio/build/STM32F103RC_btt/firmware.bin .
