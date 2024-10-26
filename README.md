![Piggy](piggy.png)

Dockerfile to easily build [LittleGPTracker](https://github.com/djdiskmachine/LittleGPTracker) binary 
for [PortMaster](https://github.com/PortsMaster/PortMaster-New/tree/main/ports/littlegptracker)

### Run steps
```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker build . --platform linux/arm64 --rm -t piggy_build
docker run --name piggy_container piggy_build
docker cp piggy_container:/root/LittleGPTracker/projects/lgpt-port.elf lgpt
```

Put the resulting `lgpt` file in the port directory
