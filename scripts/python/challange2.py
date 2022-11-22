import boto3
region = 'us-east-1'

ec2 = boto3.client('ec2', region_name=region)
instancesFullDetails = ec2.describe_instances().get("Reservations")
findInSearch1 = 'InstanceId'
findInSearch2 = 'PrivateIpAddress'
instanceIds = []

for instanceDetail in instancesFullDetails:
    groupInstances = instanceDetail['Instances']
    for instance in groupInstances:
        instanceId = instance['InstanceId']
        instanceIds.append(instanceId)

instanceCount = len(instanceIds)

for instanceDetails in instancesFullDetails:
    for i in range(0,instanceCount):
        for instance in instanceDetails["Instances"]:
            result1 = instance[findInSearch1]
            result2 = instance[findInSearch2]

print(result1, result2)