## Nodejs and Terraform Project

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
