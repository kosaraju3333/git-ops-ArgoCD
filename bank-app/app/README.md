To configure AWS secretmanger ON EKS 
Follow below link : https://github.com/aws/secrets-store-csi-driver-provider-aws

1: Install secrete store CSI driver (Provided my Kubernets)
2: Install AWS secrets-store-csi-provider-aws


```bash
eksctl create iamserviceaccount --name bank-app-service-account --region="$REGION" --cluster "$CLUSTERNAME" --namespace bank-app --attach-policy-arn "$POLICY_ARN" --approve --override-existing-serviceaccounts
```

For Sync:
```bash
Check if syncSecret is enabled or not but running below command:
helm get values csi-secrets-store -n kube-system

helm upgrade  -n kube-system csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --set syncSecret.enabled=true --reuse-values

restart:
kubectl rollout restart daemonset csi-secrets-store-secrets-store-csi-driver -n kube-system
```
