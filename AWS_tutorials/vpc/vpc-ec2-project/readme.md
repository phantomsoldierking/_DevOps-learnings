Specifies a virtual private cloud (VPC).

To add an IPv6 CIDR block to the VPC, see AWS::EC2::VPCCidrBlock.

For more information, see Virtual private clouds (VPC) in the Amazon VPC User Guide.

Syntax

To declare this entity in your AWS CloudFormation template, use the following syntax:

JSON

{
  "Type" : "AWS::EC2::VPC",
  "Properties" : {
      "CidrBlock" : String,
      "EnableDnsHostnames" : Boolean,
      "EnableDnsSupport" : Boolean,
      "InstanceTenancy" : String,
      "Ipv4IpamPoolId" : String,
      "Ipv4NetmaskLength" : Integer,
      "Tags" : [ Tag, ... ]
    }
}
YAML

Type: AWS::EC2::VPC
Properties:
  CidrBlock: String
  EnableDnsHostnames: Boolean
  EnableDnsSupport: Boolean
  InstanceTenancy: String
  Ipv4IpamPoolId: String
  Ipv4NetmaskLength: Integer
  Tags: 
    - Tag
Properties

CidrBlock
The IPv4 network range for the VPC, in CIDR notation. For example, 10.0.0.0/16. We modify the specified CIDR block to its canonical form; for example, if you specify 100.68.0.18/18, we modify it to 100.68.0.0/18.

You must specify eitherCidrBlock or Ipv4IpamPoolId.

Required: Conditional

Type: String

Update requires: Replacement

EnableDnsHostnames
Indicates whether the instances launched in the VPC get DNS hostnames. If enabled, instances in the VPC get DNS hostnames; otherwise, they do not. Disabled by default for nondefault VPCs. For more information, see DNS attributes in your VPC.

You can only enable DNS hostnames if you've enabled DNS support.

Required: No

Type: Boolean

Update requires: No interruption

EnableDnsSupport
Indicates whether the DNS resolution is supported for the VPC. If enabled, queries to the Amazon provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of the VPC network range "plus two" succeed. If disabled, the Amazon provided DNS service in the VPC that resolves public DNS hostnames to IP addresses is not enabled. Enabled by default. For more information, see DNS attributes in your VPC.

Required: No

Type: Boolean

Update requires: No interruption

InstanceTenancy
The allowed tenancy of instances launched into the VPC.

default: An instance launched into the VPC runs on shared hardware by default, unless you explicitly specify a different tenancy during instance launch.

dedicated: An instance launched into the VPC runs on dedicated hardware by default, unless you explicitly specify a tenancy of host during instance launch. You cannot specify a tenancy of default during instance launch.

Updating InstanceTenancy requires no replacement only if you are updating its value from dedicated to default. Updating InstanceTenancy from default to dedicated requires replacement.

Required: No

Type: String

Allowed values: default | dedicated | host

Update requires: Some interruptions

Ipv4IpamPoolId
The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. For more information, see What is IPAM? in the Amazon VPC IPAM User Guide.

You must specify eitherCidrBlock or Ipv4IpamPoolId.

Required: Conditional

Type: String

Update requires: Replacement

Ipv4NetmaskLength
The netmask length of the IPv4 CIDR you want to allocate to this VPC from an Amazon VPC IP Address Manager (IPAM) pool. For more information about IPAM, see What is IPAM? in the Amazon VPC IPAM User Guide.

Required: No

Type: Integer

Update requires: Replacement

Tags
The tags for the VPC.

Required: No

Type: Array of Tag

Update requires: No interruption

Return values

Ref
When you pass the logical ID of this resource to the intrinsic Ref function, Ref returns the ID of the VPC.

For more information about using the Ref function, see Ref.

Fn::GetAtt
The Fn::GetAtt intrinsic function returns a value for a specified attribute of this type. The following are the available attributes and sample return values.

For more information about using the Fn::GetAtt intrinsic function, see Fn::GetAtt.

CidrBlock
The primary IPv4 CIDR block for the VPC. For example, 10.0.0.0/16.

CidrBlockAssociations
The association IDs of the IPv4 CIDR blocks for the VPC. For example, [ vpc-cidr-assoc-0280ab6b ].

DefaultNetworkAcl
The ID of the default network ACL for the VPC. For example, acl-814dafe3.

DefaultSecurityGroup
The ID of the default security group for the VPC. For example, sg-b178e0d3.

Ipv6CidrBlocks
The IPv6 CIDR blocks for the VPC. For example, [ 2001:db8:1234:1a00::/56 ].

VpcId
The ID of the VPC.

Examples

Create a VPC with an IPv4 CIDR block
Create a VPC with an IPv4 CIDR block and an IPv6 CIDR block
Create a VPC with an IPv4 CIDR block
The following example specifies a VPC with an IPv4 address.

JSON

{
   "Resources": {
       "myVPC" : {
           "Type" : "AWS::EC2::VPC",
           "Properties" : {
               "CidrBlock" : "10.0.0.0/16",
               "EnableDnsSupport" : "true",
               "EnableDnsHostnames" : "true",
               "Tags" : [ 
                   {"Key" : "stack", "Value" : "production"} 
               ]
           }
       }
   }
}
YAML

Resources:
  myVPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: 10.0.0.0/16
      EnableDnsSupport: 'true'
      EnableDnsHostnames: 'true'
      Tags:
       - Key: stack
         Value: production
Create a VPC with an IPv4 CIDR block and an IPv6 CIDR block
The following example specifies a VPC with an IPv4 address range and an IPv6 address range.

JSON

{
   "Resources": {
       "myVPC" : {
           "Type" : "AWS::EC2::VPC",
           "Properties" : {
               "CidrBlock" : "10.0.0.0/16",
               "EnableDnsSupport" : "true",
               "EnableDnsHostnames" : "true",
               "Tags" : [ 
                   {"Key" : "stack", "Value" : "production"} 
               ]
           }
       },
       "ipv6CidrBlock": {
           "Type": "AWS::EC2::VPCCidrBlock",
           "Properties": {
                "VpcId": {
                    "Ref": "myVPC"
                },
                "AmazonProvidedIpv6CidrBlock": true
            }
       }
   }
}
YAML

Resources:
  myVPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: 10.0.0.0/16
      EnableDnsSupport: 'true'
      EnableDnsHostnames: 'true'
      Tags:
       - Key: stack
         Value: production
  ipv6CidrBlock:
    Type: AWS::EC2::VPCCidrBlock
    Properties:
      VpcId: !Ref myVPC
      AmazonProvidedIpv6CidrBlock: true
