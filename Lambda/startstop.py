import boto3
import datetime

def lambda_handler(event, context):
    ec2 = boto3.resource('ec2')
    instance_id = 'i-092264cf2d6b32574'  # Replace INSTANCE_ID with your instance ID
    instance = ec2.Instance(instance_id)
    instance_state = instance.state['Name']
    print ({instance_state})
    print ({instance})

    # Check if it's between 11pm and 8am in the current timezone
    current_time = datetime.datetime.now().time()
    print ({current_time})

    #time_change = datetime.timedelta(hours=-5)
    #current_time = local_time + time_change

    if current_time >= datetime.time(3, 0) or current_time < datetime.time(13, 0):
        if instance_state == 'running':
            instance.stop()
            instance.wait_until_stopped()
            print (f'Instance stopped successfully {current_time}')
        #elif instance_state == 'stopped':
            #return f'Instance is already stopped {current_time}'
        else:
            if instance_state == 'stopped':
                instance.start()
                instance.wait_until_running()
                print (f'Instance started successfully {current_time}')
        #elif instance_state == 'running':
            #return f'Instance is already started {current_time}'
            else:
                print (f'Instance is in {instance_state} state and cannot be started or stopped {current_time}')
