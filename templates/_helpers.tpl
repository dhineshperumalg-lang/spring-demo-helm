{{- define "spring-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "spring-demo.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "spring-demo.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "spring-demo.labels" -}}
app.kubernetes.io/name: {{ include "spring-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
