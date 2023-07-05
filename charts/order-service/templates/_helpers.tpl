{{/*
Expand the name of the chart.
*/}}
{{- define "order-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a default fully qualified app name.
*/}}
{{- define "order-service.fullname" -}}
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
Return true if a secret object should be created
*/}}
{{- define "order-service.createSecret" -}}
{{- if not .Values.existingSecret }}
    {{- true -}}
{{- end }}
{{- end }}

{{/*
Get secretName.
*/}}
{{- define "order-service.secretName" -}}
{{- if .Values.existingSecret }}
    {{- printf "%s" (tpl .Values.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "order-service.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a configmap object should be created
*/}}
{{- define "order-service.createConfigMap" -}}
{{- if not .Values.existingConfigMap }}
    {{- true -}}
{{- end }}
{{- end }}

{{/*
Get configMap.
*/}}
{{- define "order-service.configmap" -}}
{{- if .Values.existingConfigMap }}
    {{- printf "%s" (tpl .Values.existingConfigMap $) -}}
{{- else -}}
    {{- printf "%s" (include "order-service.fullname" .) -}}
{{- end -}}
{{- end -}}