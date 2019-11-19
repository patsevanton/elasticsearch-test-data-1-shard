curl -XPUT "http://localhost:9200/_xpack/rollup/job/access_logs" -H 'Content-Type: application/json' -d'
{
  "index_pattern": "access_logs",
  "rollup_index": "access_logs_rollup",
  "cron": "*/30 * * * * ?",
  "page_size": 1000,
  "groups" : {
    "date_histogram": {
      "field": "datetime",
      "interval": "1h",
      "delay": "10d"
    },
    "terms": {
      "fields": ["url.keyword"]
    }
  },
  "metrics": [
    {
      "field": "bytes",
      "metrics": ["min", "max", "sum"]
    }
  ]
}'
