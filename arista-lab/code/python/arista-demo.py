from netmiko import ConnectHandler

# Define the devices to connect to
devices = [
    {
        'device_type': 'arista_eos',
        'ip': '192.168.123.21',
        'username': 'admin',
        'password': 'admin',
    },
    {
        'device_type': 'arista_eos',
        'ip': '192.168.123.11',
        'username': 'admin',
        'password': 'admin',
    }
]

# Connect to each device and execute commands
for device in devices:
    print(f"Connecting to {device['ip']}")
    net_connect = ConnectHandler(**device)

    # Enter Privileged EXEC mode
    net_connect.enable()
    
    # Execute the command and get the output
    output = net_connect.send_command('show running-config')

    # Disconnect from the device
    net_connect.disconnect()

    # Write output to a file
    filename = f"running-config-{device['ip']}.txt"
    with open(filename, 'w') as file:
        file.write(output)

    print(f"Running config of {device['ip']} written to {filename}\n")

print("Done!")
