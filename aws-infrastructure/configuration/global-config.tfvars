# NEED CONFIGURATION:

terraform_deployment_bucket = "<SET STATE BUCKET HERE>" # e.g: kad-ap-southeast-2-terraform

# from https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
aws_region = "<SET AWS REGION HERE>" # e.g: ap-southeast-2

#From readme file (prerequisites). Done as part of the CLI installation. If you followed the configuration it might have created a profile called `default`
aws_profile = "<SET AWS PROFILE HERE>" # e.g: default

/*
    This is important to allow access to AWS resources ONLY from your local machine. You can find your public IP by googling "my ip". Or click on the link below
    https://www.google.com/search?q=my+ip&rlz=1C1GCEV_enNZ831NZ832&oq=my+ip&aqs=chrome..69i57j0l6j69i60.823j0j7&sourceid=chrome&ie=UTF-8

    p.s: don't forget the "/32" in the end. This sets the IP range to only this specific IP
*/
machine_public_ip_address = "<SET PUBLIC IP HERE>" # e.g: 219.88.157.20/32
