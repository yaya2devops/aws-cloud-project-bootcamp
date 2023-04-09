import boto3

def lambda_handler(event, context):

    cluster_name = "cruddur"

    ecs = boto3.client('ecs')

    services = ecs.list_services(cluster=cluster_name)

    for service_arn in services['serviceArns']:
        service_name = service_arn.split("/")[-1]
        ecs.update_service(cluster=cluster_name, service=service_name, desiredCount=0)
    
    return "All services stopped in ECS cluster: " + cluster_name
