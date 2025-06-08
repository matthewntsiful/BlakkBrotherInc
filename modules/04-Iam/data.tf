# Create a Data Source for IAM Policy Document
# This policy document is used to create an IAM role for SSM
# It allows EC2 to assume the role
data "aws_iam_policy_document" "ssm_role_policy" {

    # Allow EC2 to assume the role
    statement {
        actions = [
            "sts:AssumeRole",
        ]

        # The Principal is the entity that is allowed to assume the role
        # In this case, it is EC2
        principals {
            type = "Service"
            identifiers = [
                "ec2.amazonaws.com",
            ]
        }
    }

}
