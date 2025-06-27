{{/*
Common service template for all services
Usage:
{{ include "craftista.service" (dict "service" "frontend" "port" 3030 "context" $) }}
*/}}
{{- define "craftista.service" -}}
{{- $serviceName := .service -}}
{{- $serviceValues := index .context.Values $serviceName -}}
{{- $port := .port -}}
{{- $context := .context -}}
{{- if $serviceValues.enabled -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  labels:
    {{- include "craftista.serviceLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
spec:
  type: {{ $serviceValues.service.type }}
  ports:
  - port: {{ $serviceValues.service.port }}
    targetPort: http
    protocol: TCP
    name: http
    {{- if and (eq $serviceValues.service.type "NodePort") $serviceValues.service.nodePort }}
    nodePort: {{ $serviceValues.service.nodePort }}
    {{- end }}
  selector:
    {{- include "craftista.serviceSelectorLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
{{- end }}
{{- end }}