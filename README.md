## Nodejs and Terraform Project

## Hands-on
### Part-01
=> Running without Dockerfile
1. npm install
2. node code.js

=> Running using Dockerfile

-> Build docker Image using Dockerfile
1. `docker build -t http-project:0.0.1 .`
![image](https://github.com/user-attachments/assets/0e26a81c-f177-413b-9503-167db8c9c322)


-> Run docker Image in iteractive terminal mode
1. `docker run -it -p 3000:3000 --name http-container http-project:0.0.1`
   ![image](https://github.com/user-attachments/assets/8be4273d-83a4-4fa9-87b3-e091b0247098)

   To run in detached mode run use flag -d.

### Part-02
1. First use `terraform init` command to Initialise and download our resource we mentioned in main.tf file
![image](https://github.com/user-attachments/assets/656baebd-3113-4f83-843c-bf1ba3d942be)

2. Following that use `terraform validate` command -> This will find any syntax error or any variable we're missing out referring to and etc.
![image](https://github.com/user-attachments/assets/46de964f-7b56-4cbf-bb83-32c479b770b3)

3. Now use `terraform plan` command, this will show the plan also throw error if you haven't exposed the variables.
   It will look something like this. In our case.
![image](https://github.com/user-attachments/assets/9be44436-1a0e-4d30-b238-8c24a9caa2c4)

4. Finally, use `terraform --auto-approve` command and let the terraform do it's magic.
![image](https://github.com/user-attachments/assets/767858b7-c8cb-40fe-90f9-f9737373c92d)

When we go to our http://publicIP:3000/list-bucket-content. We will be seeing 
![image](https://github.com/user-attachments/assets/90bf3114-7f98-4e5e-bea2-066e6de27689)

Assumptions:
1. S3 Bucket Unblocking access for account and bucket(our bucket. Named "list-bucket-content)


## Part - 1

### File Structure
![image](https://github.com/user-attachments/assets/1e22934f-ae8b-4f3c-a09f-83d739f85df1)

- Please refer code.js file inside the Part-1 directory to maintain the flow of understanding the project
- Response you'll get once you run npm install -> node code.js command
![image](https://github.com/user-attachments/assets/605b2a80-3186-42ff-b618-3183d6fa919b)


## Part - 2

### Assumptions
- Create an EC2 Instance and deploy on it.
- Use default VPC, and create a Security Group with required ports to expose.

### Understanding Part-2
- Refer to main.tf file inside the Part-2 directory while understanding it you'll have to refer to variables.tf and userdata.sh
- I have made a video of 18 minutes and 58 seconds. I have attached it in the end of the this README file go through it for better understanding.
- Then output.tf -> Once, the infrastructure is provisioned, Terraform will show us the value of these parameters.

### S3 Bucket and API Response
- The following API Response is coming from http://<public-ip>:3000/list-bucket-content
![image](https://github.com/user-attachments/assets/1a2ae2dd-87aa-4844-bd8b-ecb6b311a0d7)

Yeah so that's all I can recollect about the project for now, will edit this file if something comes up in my mind.

Here's the drive link to the video: https://drive.google.com/file/d/1uAVb9GIHaHHw-PFhbLSOok189CddQuoe/view?usp=sharing

Thank you for reading.

Warm Regards,
Devarsh
