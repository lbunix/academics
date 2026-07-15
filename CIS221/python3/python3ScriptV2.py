from netmiko import ConnectHandler

vyOS_router={
"host": "192.168.101.216",
"port": 22,
"username": "vyos",
"password": "vyos",
"device_type": "vyos",
}

conn = ConnectHandler(**vyOS_router)

output=conn.send_command('show interfaces')
print('------ Interfaces ------')
print(output)

print('Terminating connection')
conn.disconnect()
