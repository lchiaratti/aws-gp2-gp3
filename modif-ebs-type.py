import boto3

session = boto3.Session(profile_name="default")


def describe_volume(region):
    print(f"entrando na região {region}")
    ec2_client = session.client("ec2", region_name=region)
    response = ec2_client.describe_volumes()

    for volume in response["Volumes"]:
        volume_id = volume["VolumeId"]
        volume_type = volume["VolumeType"]

        if volume_type == "gp3":
            print(f"id:{volume_id} e o type:{volume_type} ")
            print("Volume é do tipe gp3")
        else:
            print(f"id:{volume_id} e o type:{volume_type} ")
            print("Volume é do tipe gp2")


regions = ["us-east-1", "sa-east-1"]

for region in regions:
    describe_volume(region)
