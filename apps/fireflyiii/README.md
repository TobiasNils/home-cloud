# Firefly iii 

_Finance suite._

## Installation

Adapt secrets in `kustomization.yaml`, then deploy with   
`kubectl apply --kustomize apps/fireflyiii/`,   
followed by 
`kubectl apply -f apps/fireflyiii/ingress-firefly-iii.yaml` and    
`kubectl apply -f apps/fireflyiii/ingress-firefly-iii-importer.yaml`.

