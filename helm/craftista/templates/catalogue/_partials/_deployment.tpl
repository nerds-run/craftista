{{/*
Common deployment template for all services
Usage:
{{ include "craftista.deployment" (dict "service" "frontend" "port" 3030 "context" $) }}
*/}}
{{- define "craftista.deployment" -}}
{{- $serviceName := .service -}}
{{- $serviceValues := index .context.Values $serviceName -}}
{{- $port := .port -}}
{{- $context := .context -}}
{{- if $serviceValues.enabled -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
  labels:
    {{- include "craftista.serviceLabels" (dict "service" $serviceName "context" $context) | nindent 4 }}
spec:
  {{- if not $serviceValues.autoscaling.enabled }}
  replicas: {{ $serviceValues.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "craftista.serviceSelectorLabels" (dict "service" $serviceName "context" $context) | nindent 6 }}
  template:
    metadata:
      annotations:
        checksum/config: {{ include (print $context.Template.BasePath "/" $serviceName "/configmap.yaml") $context | sha256sum }}
      labels:
        {{- include "craftista.serviceSelectorLabels" (dict "service" $serviceName "context" $context) | nindent 8 }}
    spec:
      {{- with $context.Values.global.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "craftista.serviceAccountName" $context }}
      containers:
      - name: {{ $serviceName }}
        image: {{ include "craftista.image" (dict "image" $serviceValues.image "context" $context) }}
        imagePullPolicy: {{ $serviceValues.image.pullPolicy }}
        ports:
        - name: http
          containerPort: {{ $port }}
          protocol: TCP
        livenessProbe:
          httpGet:
            path: {{ .healthPath | default "/health" }}
            port: http
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: {{ .healthPath | default "/health" }}
            port: http
          initialDelaySeconds: 5
          periodSeconds: 5
        resources:
          {{- toYaml $serviceValues.resources | nindent 10 }}
        securityContext:
          allowPrivilegeEscalation: false
          readOnlyRootFilesystem: false
          runAsNonRoot: true
          runAsUser: 1001
          capabilities:
            drop:
              - ALL
        {{- if $serviceValues.config }}
        envFrom:
        - configMapRef:
            name: {{ include "craftista.serviceName" (dict "service" $serviceName "context" $context) }}
        {{- end }}
        {{- if .env }}
        env:
        {{- toYaml .env | nindent 8 }}
        {{- end }}
      {{- with $context.Values.global.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $context.Values.global.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $context.Values.global.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      securityContext:
        runAsNonRoot: true
        runAsUser: 1000
        fsGroup: 1000
        seccompProfile:
          type: RuntimeDefault
{{- end }}
{{- end }}