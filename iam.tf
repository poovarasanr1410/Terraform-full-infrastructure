resource "aws_iam_role" "iam-roles" {
  name = "iam-roles"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach CloudWatchFullAccess policy
resource "aws_iam_policy_attachment" "cloudwatch_full_access" {
  name       = "CloudWatchFullAccessAttachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  roles      = [aws_iam_role.iam-roles.name]
}

# Attach AmazonEC2FullAccess policy
resource "aws_iam_policy_attachment" "ec2_full_access" {
  name       = "AmazonEC2FullAccessAttachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  roles      = [aws_iam_role.iam-roles.name]
}

# Attach AmazonSSMFullAccess policy
resource "aws_iam_policy_attachment" "ssm_full_access" {
  name       = "AmazonSSMFullAccessAttachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  roles      = [aws_iam_role.iam-roles.name]
}

# Attach AmazonEC2RoleforSSM policy
resource "aws_iam_policy_attachment" "ec2_role_for_ssm" {
  name       = "AmazonEC2RoleforSSMAttachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  roles      = [aws_iam_role.iam-roles.name]
}

# Attach CloudWatchAgentAdminPolicy policy
resource "aws_iam_policy_attachment" "cloudwatch_agent_admin_policy" {
  name       = "CloudWatchAgentAdminPolicyAttachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
  roles      = [aws_iam_role.iam-roles.name]
}

# Attach CloudWatchAgentServerPolicy policy
resource "aws_iam_policy_attachment" "cloudwatch_agent_server_policy" {
  name       = "CloudWatchAgentServerPolicyAttachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  roles      = [aws_iam_role.iam-roles.name]
}
#Attach AmazonSSMManagedInstanceCore policy
resource "aws_iam_role_policy_attachment" "ssm_role_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.iam-roles.name
}

resource "aws_iam_instance_profile" "instance_role_profile" {
  name = "ssm-instance-profile"  # Provide a unique name for the instance profile
  role = aws_iam_role.iam-roles.id
}