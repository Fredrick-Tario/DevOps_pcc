import socket
import platform
import os
import shutil
import psutil
from datetime import datetime

try:
    hostname = socket.gethostname()
    operating_system = platform.system()
    os_version = platform.version()
    cpu_count = os.cpu_count()

    # 1024 bytes raised to 3 since gb format
    memory = psutil.virtual_memory()
    total_mem= memory.total / (1024 ** 3)

    disk = shutil.disk_usage("D:\\")
    available_disk= disk.free / (1024 ** 3)

    current_time = datetime.now()
    formatted_time = current_time.strftime("%Y-%m-%d %H:%M:%S")

    print("SYSTEM INFORMATION REPORT")
    print("-------------------------")
    print(f"Hostname: {hostname}")
    print(f"Operating System: {operating_system}")
    print(f"OS Version: {os_version}")
    print(f"CPU Count: {cpu_count}")
    print(f"Total Memory: {total_mem:.2f} GB")
    print(f"Available Disk Space: {available_disk:.2f} GB")
    print(f"Current Date and Time: {formatted_time}")

except Exception as error:
    print("Unable to retrieve system information.")
    print(f"Error: {error}")
    
    