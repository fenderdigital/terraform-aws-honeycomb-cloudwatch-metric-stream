# Required variables
variable "name" {
  type = string
  # required, no default
}

variable "honeycomb_dataset_name" {
  type = string
}

variable "honeycomb_api_key" {
  type = string
  sensitive = true
}


# Optional variables for customer configuration
variable "tags" {
  type = map(string)
  default = {}
}

variable "namespace_include_filter" {
  type = list(string)
  # TODO: does default null satisfy type list(string), or do we need to go with
  # type any? (sigh)
  #
  # Also, if this is list(string), we need to map it to: s -> { namespace = s };
  # or we could use list(object{namespace=string})
  #
  # This variable needs testing. (And should be consistent with the
  # namespace_exclude_filter below.)
  default = null
}

variable "namespace_exclude_filter" {
  type = list(string)
  default = null
}

variable "s3_buffer_size" {
  type = number
  default = 10
}

variable "s3_buffer_interval" {
  type = number
  default = 400
}

variable "s3_compression_format" {
  type = string
  default = "GZIP"
}

variable "http_buffering_size" {
  type = number
  default = 15
}

variable "http_buffering_interval" {
  type = number
  default = 600
}

variable "http_content_encoding" {
  type = string
  default = "GZIP"
}

variable "s3_backup_mode" {
  type = string
  default = "FailedDataOnly"
}


# Optional variables you are unlikely to modify
variable "honeycomb_api_base_url" {
  type = string
  default = "https://api.honeycomb.io/1/kinesis_events"
}

variable "output_format" {
  type = string
  default = "opentelemetry0.7"
}
