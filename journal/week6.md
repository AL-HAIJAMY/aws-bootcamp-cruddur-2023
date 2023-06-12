# Week 6 & 7 — Deploying Containers Fargate

## in this week we will deploy our containers but before that we have to ensure that connections and containers are working fine . also after deployement we need to check some connections from inside the container . so we will create some health checks to check everything in case there is troubleshooting or so . 



## first we added script to check rds connection from our container 
![](assets/rds%20connection%20successful.JPG)

## then after adding an endpoint to the flask app we created a script to check that flask server is running .
![](assets/flask%20server%20running.JPG)

## then we added a cloudwatch log for cruddur . (only for spend considerations we assign it for one day retention ) but in prod it will be forever . 
![](assets/CloudWatch%20Log%20Group%20created.JPG)

## now we can add our cruddur ECS cluster .( new cluster created through cli )

![](assets/cruddur%20ECS%20cluster%20created.JPG)

## after creating the cluster we need to prepare our containers to deploy them to fargate .

![]()
## first we need to Create ECR repo and push image to it . (better to avoid pulling from dockerhub as long as we have our own container registry ECR ) 

![]()

![]()

![]()
## we have three repos . one base image for python and one for flask and one for react .

## using cli we created new repo called cruddur python .(notice untill now we didnt pull from docker or push to ECR . only created the repo in ECR)

![](assets/cruddur-python%20repo%20created.JPG)

## now we can login to the ECR using our own variables stored insted of the default login way and whenn succeeded we can push our containers .

## store our repo address link  in our enviroment as a variable .

## now we can pull down our python container image . 

## tag our pyhton image 

## now we can push the image to ECR  ( now python image is deployed - remember that we have three repos . thie first one is done )

![](assets/python%20image%20pushed%20to%20the%20ECR.JPG)

## now the flask image but first update the python FROM to with our new image address in ECR 

## updated the env flask to debug but for development only . ( remember to set it to zero in production )

## again we have to create a repo for flask and store our repo address link  in our enviroment as a variable .
![](assets/flask%20image%20%20repo%20created.JPG)
## now we build our image then tag it then push it to the ECR 

## now we need to create a new service in the ECS for the container .(remeber task are only for onetime task and then kills it self ) but before we must create new task definition . 

## for the task definition you need to make sure that there is execution role (Iam role)  and task roles defined .but first we need to update all parameters in the parameters store .

## then we need to create role then create role policy then attach the created  policy to the created role . ( remeber 3 steps ).

![](assets/roles%20created.JPG)
## create task roles and and attach policies like cloudwatch and AWSXRAY .
1[](assets/policies%20created.JPG)

## create tasks  definitions with all aws related values .(remember json files)

## we must do it for backend and front end but for now we will do for backend only . 

## register the task definition .

## now ready to create an ECS but first we need create security group and authorize to use it in the ECS creation . (exporting the default vpc then authorizing it)

## create a service for the backend and register it . 

## same steps to create frondend services and tasks . 

## store our parameters in parameter store 

![](assets/parameters%20stored%20in%20parameter%20store.JPG)

## we so some checks using our health scripts 

![](assets/flask%20server%20running.JPG)

![](assets/ip%20address%20test%201.JPG)

![](assets/ip%20address%20test%202.JPG)

## we refactor the bin directory and add some scripts to engage with the cli smoothly . now we can build the image and push it , then deploy it . when there is a change in the task defination we can register it again .

### NOTE:- at the end of this week i faced a problem with localhost postgres . the app is working in local environment  but with connecting to aws db , while the localhost one is refusing to connect . 

![](assets/connection%20failed%20localhost.JPG)





