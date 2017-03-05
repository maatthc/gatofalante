STATSD_REQUEST_METRICS = {
  "request.success"               => 200,
  "request.redirect"              => 302,
  "request.bad_request"           => 400,
  "request.not_found"             => 404,
  "request.too_many_requests"     => 429,
  "request.internal_server_error" => 500,
  "request.bad_gateway"           => 502
}.freeze

STATSD_TAGS = ["env:#{Rails.env}"].freeze

StatsD.prefix              = "GatoFalante"
StatsD.default_sample_rate = 1
# Sets up a UDP backend. First argument is the UDP address to send StatsD packets to, 
# # second argument specifies the protocol variant (i.e. `:statsd`, `:statsite`, or `:datadog`
StatsD.backend = StatsD::Instrument::Backends::UDPBackend.new("localhost:8125", :datadog)

StatsDMonitor.extend(StatsD::Instrument)
StatsDMonitor.statsd_measure(:call, "request.duration", tags: STATSD_TAGS)


STATSD_REQUEST_METRICS.each do |name, code|
  StatsDMonitor.statsd_count_if(:call, name, tags: STATSD_TAGS) do |status, _env, _body|
    status.to_i == code
  end
end
