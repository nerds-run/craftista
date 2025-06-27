{{/*
Common NetworkPolicy template for all services
Usage:
{{ include "craftista.networkpolicy" (dict "service" "frontend" "port" 3030 "context" $) }}
*/}}
{{- define "craftista.networkpolicy" -}}
{{- $serviceName := .service -}}
{{- $serviceValues := index .context.Values $serviceName -}}
{{- $port := .port -}}
{{- $context := .context -}}
{{- if and $serviceValues.enabled $context.Values.networkPolicy.enabled -}}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  labels:
    {{- include "craftista.serviceLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
spec:
  podSelector:
    matchLabels:
      {{- include "craftista.serviceSelectorLabels" (dict "service" $serviceName "context" $context) | nindent 6 }}
  policyTypes:
    {{- toYaml $context.Values.networkPolicy.policyTypes | nindent 4 }}
  ingress:
    - from:
        - podSelector:
            matchLabels:
              {{- include "craftista.selectorLabels" $context | nindent 14 }}
      ports:
        - port: {{ $port }}
          protocol: TCP
  egress:
    # Allow DNS
    - to:
        - namespaceSelector: {}
      ports:
        - port: 53
          protocol: UDP
        - port: 53
          protocol: TCP
    # Allow access to other services
    - to:
        - podSelector:
            matchLabels:
              {{- include "craftista.selectorLabels" $context | nindent 14 }}
    # Allow access to PostgreSQL if enabled
    {{- if $context.Values.postgresql.enabled }}
    - to:
        - podSelector:
            matchLabels:
              app.kubernetes.io/name: postgresql
              app.kubernetes.io/instance: {{ $context.Release.Name }}
      ports:
        - port: 5432
          protocol: TCP
    {{- end }}
{{- end }}
{{- end }}