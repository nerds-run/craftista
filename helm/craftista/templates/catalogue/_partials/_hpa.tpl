{{/*
Common HPA template for all services
Usage:
{{ include "craftista.hpa" (dict "service" "frontend" "context" $) }}
*/}}
{{- define "craftista.hpa" -}}
{{- $serviceName := .service -}}
{{- $serviceValues := index .context.Values $serviceName -}}
{{- $context := .context -}}
{{- if and $serviceValues.enabled $serviceValues.autoscaling.enabled -}}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  labels:
    {{- include "craftista.serviceLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  minReplicas: {{ $serviceValues.autoscaling.minReplicas }}
  maxReplicas: {{ $serviceValues.autoscaling.maxReplicas }}
  metrics:
  {{- if $serviceValues.autoscaling.targetCPUUtilizationPercentage }}
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: {{ $serviceValues.autoscaling.targetCPUUtilizationPercentage }}
  {{- end }}
  {{- if $serviceValues.autoscaling.targetMemoryUtilizationPercentage }}
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: {{ $serviceValues.autoscaling.targetMemoryUtilizationPercentage }}
  {{- end }}
{{- end }}
{{- end }}