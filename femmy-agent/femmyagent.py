# Import some library
import os
from flask import Flask, request, jsonify

# Setting up the flask framework
application = Flask(__name__)

# A route to test the api server
@application.route('/', methods=['GET'])
def index():
	return 'It\'s works'

# A route to test the api server
@application.route('/test', methods=['GET'])
def test():
        return 'Another works'

# A route to create a filter
@application.route('/api/v1/create_filter', methods=['GET'])
def create_filter():
	query_parameters = request.args.get
	filter_name = query_parameters('filter_name')
	filter_content = query_parameters('filter_content')
	filename = '/etc/fail2ban/filter.d/'+filter_name+'.conf'
	content = open(filename, "w")
	content.write(filter_content)
	return 'success', 200

# A route to edit a filter
@application.route('/api/v1/edit_filter', methods=['GET'])
def edit_filter():
	query_parameters = request.args.get
	filter_name = query_parameters('filter_name')
	filter_content = query_parameters('filter_content')
	filename = '/etc/fail2ban/filter.d/'+filter_name+'.conf'
	with open(filename) as f:
		file_str = f.read()
	file_str = filter_content
	with open(filename, "w") as f:
		f.write(file_str)
	return 'success', 200

# A route to create a jail
@application.route('/api/v1/create_jail', methods=['GET'])
def create_jail():
	query_parameters = request.args.get
	jail_name = query_parameters('jail_name')
	port_service = query_parameters('port_service')
	filter_name = query_parameters('filter_name')
	filter_type = query_parameters('filter_type')
	find_time = query_parameters('find_time')
	max_retry = query_parameters('max_retry')
	ban_time = query_parameters('ban_time')
	log_path = query_parameters('log_path')
	find_time = int(find_time) * 60 # now, its on second
	ban_time = int(ban_time) * 60 #now, its on second
	with open("/etc/fail2ban/jail.d/"+jail_name+'.conf', "a") as jail_local:
		jail_local.write("["+jail_name+"]"+'\n')
		jail_local.write("enabled = true"+'\n')
		jail_local.write("port = "+port_service+'\n')
		jail_local.write("filter = "+filter_name+'\n')
		jail_local.write('action = iptables-multiport[name='+jail_name+', port=\"'+port_service+'\", protocol=tcp]'+'\n')
		jail_local.write('         femmy-agent'+'\n')
		jail_local.write('logpath = '+log_path+'\n')
		jail_local.write('maxretry = '+max_retry+'\n')
		jail_local.write('findtime = '+str(find_time)+'\n')
		jail_local.write('bantime = '+str(ban_time)+'\n')
	os.system('systemctl restart fail2ban')
	return 'success', 200

# A route to edit a jail
@application.route('/api/v1/edit_jail', methods=['GET'])
def edit_jail():
	query_parameters = request.args.get
	jail_name = query_parameters('jail_name')
	find_time = query_parameters('find_time') # in minutes, must be converted
	max_retry = query_parameters('max_retry')
	ban_time = query_parameters('ban_time') # in minutes, must  be converted
	find_time = int(find_time) * 60 # now, its on second
	ban_time = int(ban_time) * 60 #now, its on second
	current = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "r")
	line = current.readlines()
	line[7] = 'maxretry = '+max_retry+'\n'
	line[8] = 'findtime = '+str(find_time)+'\n'
	line[9] = 'bantime = '+str(ban_time)+'\n'
	new = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "w")
	new.writelines(line)
	os.system('systemctl restart fail2ban')
	return 'success', 200

# A route to enable a jail
@application.route('/api/v1/enable_jail', methods=['GET'])
def enable_jail():
	query_parameters = request.args.get
	jail_name = query_parameters('jail_name')
	current = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "r")
	line = current.readlines()
	line[1] = "enabled = true"+'\n'
	new = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "w")
	new.writelines(line)
	os.system('systemctl restart fail2ban')
	return 'success', 200

# A route to disable a jail
@application.route('/api/v1/disable_jail', methods=['GET'])
def disable_jail():
	query_parameters = request.args.get
	jail_name = query_parameters('jail_name')
	current = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "r")
	line = current.readlines()
	line[1] = "enabled = false"+'\n'
	new = open("/etc/fail2ban/jail.d/"+jail_name+".conf", "w")
	new.writelines(line)
	os.system('systemctl restart fail2ban')
	return 'success', 200

# A route to trust an ip
@application.route('/api/v1/trust_ip', methods=['GET'])
def trust_ip():
	query_parameters = request.args.get
	ip = query_parameters('ip')
	jail_name = query_parameters('jail_name')
	command = 'fail2ban-client set '+jail_name+' addignoreip '+ip
	os.system(command)
	return 'success', 200

# A route to ban an ip
@application.route('/api/v1/ban_ip', methods=['GET'])
def ban_ip():
	query_parameters = request.args.get
	ip = query_parameters('ip')
	jail_name = query_parameters('jail_name')
	command = 'fail2ban-client set '+jail_name+' banip '+ip
	os.system(command)
	return 'success', 200

# A route to untrust an ip
@application.route('/api/v1/untrust_ip', methods=['GET'])
def untrust_ip():
	query_parameters = request.args.get
	ip = query_parameters('ip')
	jail_name = query_parameters('jail_name')
	command = 'fail2ban-client set '+jail_name+' delignoreip '+ip
	os.system(command)
	return 'success', 200

# A route to unban an ip
@application.route('/api/v1/unban_ip', methods=['GET'])
def unban_ip():
	query_parameters = request.args.get
	ip = query_parameters('ip')
	jail_name = query_parameters('jail_name')
	command = 'fail2ban-client set '+jail_name+' unbanip '+ip
	os.system(command)
	return 'success', 200

# Start the API Server
if __name__ == "__main__":
	application.run(host='0.0.0.0')
