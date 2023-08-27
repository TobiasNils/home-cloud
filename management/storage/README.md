#  Using local path provisioner

Install with ```kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.24/deploy/local-path-storage.yaml```, 

Then kustomize with `kubectl apply --kustomize  management/storage/`.