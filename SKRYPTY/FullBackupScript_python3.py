#!/usr/bin/env python3
# author azaz1
# mod for python lareq
#ExtraMenu=AZAZ1 Image Backup Script: /usr/lib/enigma2/python/Plugins/Extensions/s4aUpdater//ExtraMenu/FullBackupScript_python3.py
ver = '2023-09-22'

import os
import sys
import subprocess
import shutil
import time
from datetime import datetime
import tarfile
sys.path.append('/usr/lib/enigma2/python')
try:
    import boxbranding
except ModuleNotFoundError:
    print('UNSUPPORTED SYSTEM')
    sys.exit(1)

czas_start = int(time.time())

getBoxType = boxbranding.getMachineMake()
getBrandOEM = boxbranding.getBrandOEM()
getImageVersion = boxbranding.getImageVersion()
getImageDistro = boxbranding.getImageDistro()
getMachineMtdKernel = boxbranding.getMachineMtdKernel()
getMachineMtdRoot = boxbranding.getMachineMtdRoot()
getMachineKernelFile = boxbranding.getMachineKernelFile()
getMachineRootFile = boxbranding.getMachineRootFile()
getImageFolder = boxbranding.getImageFolder()
getOEVersion = boxbranding.getOEVersion () # "OE-Alliance 5.3"
getImageBuild = boxbranding.getImageBuild () #"20230907"
getMachineName = boxbranding.getMachineName () #"Ustym 4K PRO"
getMachineMKUBIFS = boxbranding.getMachineMKUBIFS() 

BUILD = f'/media/hdd/images/build/{getImageFolder}'
ROOTSUB = '/tmp/bi/RootSubdir'
#getMachineMKUBIFS=-m 2048 -e 126976 -c 4096<
os.makedirs(BUILD, exist_ok=True)
os.makedirs(ROOTSUB, exist_ok=True)

with open(f"{BUILD}/info", "w") as file:
    file.write(f"{getMachineName}\n")
    file.write(f"{getImageDistro} {getImageVersion}\n")
    file.write(f"{getImageBuild}\n")
    file.write(f"{getOEVersion}\n")
    file.close

print('CREATING FULL IMAGE BACKUP OF CURRENT SYSTEM')

if getMachineMKUBIFS == '':
    subprocess.run(['mount', f'/dev/{getMachineMtdRoot}', ROOTSUB])
    # Create a tar archive, excluding specific directories
    EXCLUDE_FILES = ['./var/nmbd', './.resizerootfs', './.resize-rootfs','./.resize-linuxrootfs','./.resize-userdata','./var/lib/samba/private/msg.sock','./var/lib/samba/msg.sock/*', './run/chrony/chronyd.sock', './run/avahi-daemon/socket']
    def filter_function(tarinfo):
        if tarinfo.name in EXCLUDE_FILES:
            return None
        else:
            return tarinfo
    with subprocess.Popen(['/bin/tar', '-cf', f'{BUILD}/rootfs.tar', '-C', '/tmp/bi/RootSubdir/linuxrootfs1', '--exclude', './var/nmbd', '--exclude', './.resizerootfs', '--exclude', './.resize-rootfs', '--exclude', './.resize-linuxrootfs', '--exclude', './.resize-userdata', '--exclude', './var/lib/samba/private/msg.sock', '--exclude', './var/lib/samba/msg.sock/*', '--exclude', './run/chrony/chronyd.sock', '--exclude', './run/avahi-daemon/socket', '.'], stdout=subprocess.PIPE, stderr=subprocess.PIPE) as tar_process:
        tar_process.communicate()

    subprocess.run(['/usr/bin/bzip2', f'{BUILD}/rootfs.tar'])    
else:
    print('UFS Partition backup')
    source_partition = "ubi0_0"
    subprocess.run(['dd', f'if=/dev/{source_partition}', f'of={BUILD}/{getMachineRootFile}'])

print("Create: kerneldump")
subprocess.run(['dd', f'if=/dev/{getMachineMtdKernel}', f'of={BUILD}/{getMachineKernelFile}'])
print('Creating backup image')
data = datetime.now().strftime("%Y-%m-%d-%H%M")

subprocess.run(['7za', 'a', '-r', '-bt', '-bd', f'/media/hdd/images/{getImageDistro}-{getImageVersion}-{getBoxType}-backup-{data}_usb.zip', f'/hdd/images/build/*'])
#subprocess.run(['sync'])
print(f'Archive created in:\n/media/hdd/images/{getImageDistro}-{getImageVersion}-{getBoxType}-backup-{data}_usb.zip')

czas_stop = int(time.time())
czas_stop -= czas_start
czas_start = int(czas_stop / 60)
czas_stop -= (czas_start * 60)
czas_stop = int(czas_stop)
print(f"Creation took {czas_start} min and  {czas_stop} sec")

subprocess.run(['umount', ROOTSUB])
shutil.rmtree(BUILD)
shutil.rmtree('/tmp/bi')
shutil.rmtree(f'/media/hdd/images/build')
print("Done")
#subprocess.run(['sync'])
print(f"Version {ver}")