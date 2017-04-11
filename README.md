# vpc
# For more information refer 
# http://jeremievallee.com/2016/07/27/aws-vpc-ansible/
# http://www.tivix.com/blog/using-ansible-create-aws-instances/
# https://github.com/arbabnazar/ansible-aws-roles/blob/master/roles/ec2instance/tasks/main.yml

ansible-playbook -i inventory playbook.yml -e@var.yml
