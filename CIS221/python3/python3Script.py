from netmiko import ConnectHandler

connection = ConnectHandler(
host='192.168.101.216', port='22', username='vyos', password='vyos', device_type='vyos'
)

output=connection.send_command('show interfaces')
print(output)

print('Terminating connection')
connection.disconnect()
