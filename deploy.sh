echo "Pre-Build Steps:"
echo "authenticating with AWS ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 112356928409.dkr.ecr.us-east-1.amazonaws.com

echo "Build Steps:"
echo "building image..."
docker build --platform=linux/amd64 -t 112356928409.dkr.ecr.us-east-1.amazonaws.com/react-docker-aws:latest .

echo "Post-Build Steps:"
echo "pushing image to AWS ECR..."
docker push 112356928409.dkr.ecr.us-east-1.amazonaws.com/react-docker-aws:latest

aws ecs update-service --desired-count 0 --force-new-deployment --service react-sv-2 --cluster react-cluster-2

aws ecs update-service --desired-count 1 --force-new-deployment --service react-sv-2 --cluster react-cluster-2
