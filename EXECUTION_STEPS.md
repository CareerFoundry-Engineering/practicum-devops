## Provision Infrastructure
* Configure account credentials on your machine.
* Set the AWS profile name as `personal-account`.
* Navigate to the `infra` folder present at the root of the repository.
* Go to `environments` -> `dev-env`. Entire infra for this task is present over here. Including the Terraform state bucket and the DynamoDB used for the state-locking.
* Run Terragrunt init, plan and apply to provision the infrastructure on AWS.

## App Deployment
Most of the dependent libraries will be installed on the EC2 Instance through user-data. Other AWS resources, apart from the EC2 instances, do not need any special manual configurations.

### Frontend Instance

* Post the infrastructure proivsioning we will have to perform the following few steps -
  * Edit the `server` block of the `nginx.conf` file  to contain the following location - 
     ```   
     location / {
        proxy_pass http://127.0.0.1:8080;
    }
  * Go to the React app directory and run the following command - `sed -i 's/localhost/<BACKEND_INSTANCE_ID>/g' .env`
  * Serve the build files by running the following command - `pm2 serve dist 8080 -spa`

### Backend Instance

* Clone the repository and navigate inside the `api` directory
* Run the following commands to build the Docker images and start the API and Database container - 
   ```
    make build
    make prepare
    make up
Once all of these have been followed the application will be up and running.