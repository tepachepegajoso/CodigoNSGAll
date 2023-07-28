"""
Esta es la version de prueba del analizador de trazas

"""
def calculate_pdr(trace_file):
	with open(trace_file, 'r') as file:
		lines=file.readlines()
	total_packets = 0
	received_packets = 0
	lost_packets = 0
	
	for line in lines:
		if 'AGT' in line:
			columns = line.split()
			event = columns[0]
			packet_type = columns[3]
			total_packets += 1

			if event == 'r' and packet_type != '-':
				received_packets += 1
			elif event == 'D' and packet_type != '-':
				lost_packets += 1
	pdr = received_packets/total_packets
	return pdr
def calculate_nrl(trace_file):
	with open(trace_file, 'r') as file:
		lines = file.readlines()
	total_routes = 0
	active_routes = 0
	routing_packet_count = 0
	data_packet_count = 0

	for line in lines:
		if 'RTR' in line:
			columns = line.split()

			event = columns[0]
			route_state = columns[0]

			routing_packet_count += 1

			if route_state == 'r':
				data_packet_count += 1
	nrl = data_packet_count/routing_packet_count
	return nrl
def calculate_e2ed(trace_file):

	with open(trace_file, 'r') as file:
		lines = file.readlines()
	
	packet_delays = {}
	total_delays = 0
	packet_count = 0
	for line in lines:
		columns = line.split() 
		if 'r' in columns[0]:
			

			event = columns[0]
			timestamp = float(columns[1])
			source = columns[3]
			destination = columns[5]

			if event == 'r':
				packet_key = f'{source}_{destination}'
				if packet_key not in packet_delays:
					packet_delays[packet_key] = timestamp

		elif 's' in columns[0]:
			event = columns[0]
			timestamp = float(columns[1])
			source = columns[3]
			destination = columns[5]

			if event == 's':
				packet_key = f'{source}_{destination}'
				if packet_key in packet_delays:
					packet_delay = timestamp - packet_delays[packet_key]
					total_delays += packet_delay
					packet_count += 1
	if packet_count > 0:
		e2ed = total_delays/packet_count
		return e2ed



		
