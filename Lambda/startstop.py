import boto3
import datetime

def lambda_handler(event, context):
    ec2 = boto3.resource('ec2')
    instance_id = 'INSTANCE_ID' # Replace INSTANCE_ID with your instance ID
    instance = ec2.Instance(instance_id)
    instance_state = instance.state['Name']

    # Check if it's between 11pm and 8am in the current timezone
    current_time = datetime.datetime.now().time()
    if current_time >= datetime.time(23, 0) or current_time < datetime.time(8, 0):
        if instance_state == 'running':
            instance.stop()
            instance.wait_until_stopped()
            return 'Instance stopped successfully'
        elif instance_state == 'stopped':
            return 'Instance is already stopped'
        else:
            return f'Instance is in {instance_state} state and cannot be started or stopped'
    else:
    if current_time >= datetime.time(8, 0) or current_time < datetime.time(23, 0):
    if instance_state == 'stopped':
        instance.start()
        instance.wait_until_started()
        return 'Instance started successfully'
    elif instance_state == 'started':
        return 'Instance is already started'
