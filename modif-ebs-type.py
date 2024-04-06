import boto3

session = boto3.Session(profile_name="default")


def describe_volume(region):
    print(f"entrando na região {region}")
    ec2_client = session.client("ec2", region_name=region)
    response = ec2_client.describe_volumes()

    for volume in response["Volumes"]:
        volume_id = volume["VolumeId"]
        volume_type = volume["VolumeType"]

        if volume_type != "gp3":
            try:
                ec2_client.modify_volume(VolumeId=volume_id, VolumeType="gp3")
                print(f"modificando tipo do volume: {volume_id}.")
            except Exception as e:
                print(f"An error occurred while modifying volume {volume_id}: {e}")


regions = ["us-east-1", "sa-east-1"]

for region in regions:
    describe_volume(region)
