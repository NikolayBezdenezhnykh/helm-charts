{{/*
Expand the name of the chart.
*/}}
{{- define "stock-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a default fully qualified app name.
*/}}
{{- define "stock-service.fullname" -}}
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
{{- define "stock-service.createSecret" -}}
{{- if not .Values.existingSecret }}
    {{- true -}}
{{- end }}
{{- end }}

{{/*
Get secretName.
*/}}
{{- define "stock-service.secretName" -}}
{{- if .Values.existingSecret }}
    {{- printf "%s" (tpl .Values.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "stock-service.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a configmap object should be created
*/}}
{{- define "stock-service.createConfigMap" -}}
{{- if not .Values.existingConfigMap }}
    {{- true -}}
{{- end }}
{{- end }}

{{/*
Get configMap.
*/}}
{{- define "stock-service.configmap" -}}
{{- if .Values.existingConfigMap }}
    {{- printf "%s" (tpl .Values.existingConfigMap $) -}}
{{- else -}}
    {{- printf "%s" (include "stock-service.fullname" .) -}}
{{- end -}}
{{- end -}}