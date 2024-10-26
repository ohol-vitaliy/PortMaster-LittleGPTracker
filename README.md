LittleGPTracker dockerfile for PortMaster

# Run steps
```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker build . --platform linux/arm64 --rm -t piggy_build
docker run --name piggy_container piggy_build
docker cp piggy_container:/root/LittleGPTracker/projects/lgpt-port.elf lgpt
```
