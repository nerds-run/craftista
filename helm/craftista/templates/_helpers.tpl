{{/*
Expand the name of the chart.
*/}}
{{- define "craftista.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "craftista.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "craftista.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "craftista.labels" -}}
helm.sh/chart: {{ include "craftista.chart" . }}
{{ include "craftista.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "craftista.selectorLabels" -}}
app.kubernetes.io/name: {{ include "craftista.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service-specific fullname
*/}}
{{- define "craftista.serviceName" -}}
{{- $serviceName := .service -}}
{{- $context := .context -}}
{{- if $context.Values.fullnameOverride }}
{{- printf "%s-%s" $context.Values.fullnameOverride $serviceName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (include "craftista.fullname" $context) $serviceName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Service-specific labels
*/}}
{{- define "craftista.serviceLabels" -}}
{{- $serviceName := .service -}}
{{- $context := .context -}}
{{ include "craftista.labels" $context }}
app.kubernetes.io/component: {{ $serviceName }}
{{- end }}

{{/*
Service-specific selector labels
*/}}
{{- define "craftista.serviceSelectorLabels" -}}
{{- $serviceName := .service -}}
{{- $context := .context -}}
{{ include "craftista.selectorLabels" $context }}
app.kubernetes.io/component: {{ $serviceName }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "craftista.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "craftista.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get the image registry
*/}}
{{- define "craftista.imageRegistry" -}}
{{- if .Values.global.imageRegistry -}}
{{- .Values.global.imageRegistry -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end }}

{{/*
Get the full image name
*/}}
{{- define "craftista.image" -}}
{{- $registry := include "craftista.imageRegistry" .context -}}
{{- $repository := .image.repository -}}
{{- $tag := .image.tag | default .context.Chart.AppVersion -}}
{{- if $registry -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- else -}}
{{- printf "%s:%s" $repository $tag -}}
{{- end -}}
{{- end }}

{{/*
Return the appropriate apiVersion for ingress
*/}}
{{- define "craftista.ingress.apiVersion" -}}
{{- if semverCompare ">=1.19-0" .Capabilities.KubeVersion.GitVersion -}}
{{- "networking.k8s.io/v1" -}}
{{- else -}}
{{- "networking.k8s.io/v1beta1" -}}
{{- end -}}
{{- end -}}