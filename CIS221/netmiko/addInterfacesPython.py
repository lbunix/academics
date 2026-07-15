from netmiko import ConnectHandler

vyOS_Router = {
    'device_type': 'vyos',
    'ip': '192.168.101.216',
    'port': 22,
    'username': 'vyos',
    'password': 'vyos',
}

conn = ConnectHandler(**vyOS_Router)

config_edit = [
    "set interfaces ethernet eth3 description 'EXTERNAL - VIA netmiko'",
    "set interfaces ethernet eth4 description 'INTERNAL - VIA netmiko'",
    "set interfaces loopback lo description 'LOOPBACK - VIA netmiko'",
]

interfaces = conn.send_command('show interfaces')
print('------ CURRENT INTERFACE CONFIGURATIONS ------')
print(interfaces)

print('')

config_change = conn.send_config_set(config_edit)
print('------ SENDING CONFIGURATION CHANGES ------')
print(config_change)

commit = conn.commit()
print(commit)

save = conn.send_command_timing("save")
print(save)

conn.exit_config_mode()

print('')

interfaces2 = conn.send_command('show interfaces')
print('------ POST-CHANGE INTERFACES CONFIGURATIONS ------')
print(interfaces2)

print('')

print('Terminating Connection')
print('')

conn.disconnect()
