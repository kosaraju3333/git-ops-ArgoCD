** Install the Secret Store CSI Driver **

helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm repo update

helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver \
  --namespace kube-system \
  --set syncSecret.enabled=true \
  --set enableSecretRotation=true \
  --set rotationPollInterval=2m

Link: https://secrets-store-csi-driver.sigs.k8s.io/getting-started/installation

Install AWS Provider for the CSI Driver

kubectl apply -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml

Create IAM policy to access the AWS Secret Manager
Create ServiceAccount and attach IAM policy 
Link: https://github.com/aws/secrets-store-csi-driver-provider-aws

Create secretProviderClass.yml
