{{/* Generate basic labels */}}
{{- define "mycharts.labels" }}
  labels:
    generator: helm
    date: {{ now  | htmlDate }}
    chart: {{ .Chart.Name }}
    version: {{ .Chart.Version }}
{{- end }}

{{- define "mycharts.app" }}
app_name: {{ .Chart.Name }}
app_version: {{ .Chart.Version }}
{{- end }}
