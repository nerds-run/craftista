{{- define "craftista.configmap" -}}
{{- $serviceName := .service -}}
{{- $serviceValues := index .context.Values $serviceName -}}
{{- $context := .context -}}
{{- if $serviceValues.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  labels:
    {{- include "craftista.serviceLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
data:
  {{- with .data }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
{{- end }}
{{- end }}