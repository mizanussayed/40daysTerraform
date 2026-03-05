# Create_Snapshot
### task:
- Create a snapshot of an existing volume named devops-vol in us-east-1 region using terraform.

1) The name of the snapshot must be devops-vol-ss.

2) The description must be Devops Snapshot.

3) Make sure the snapshot status is completed before submitting the task.


### Solution: previeus main.tf file
```hcl
resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "devops-vol"
  }
}
```

### Updated main.tf file
```hcl
resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "devops-vol"
  }
}

resource "aws_ebs_snapshot" "devops_snapshot" {
  volume_id = aws_ebs_volume.k8s_volume.id
  description = "Devops Snapshot"
  tags = {
    Name   = "devops-vol-ss"
  }
}
```