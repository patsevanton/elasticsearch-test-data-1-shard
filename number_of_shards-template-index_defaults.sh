curl -XPUT "http://localhost:9200/_template/index_defaults" -H 'Content-Type: application/json' -d'
{
  "template": "*", 
  "settings": {
    "number_of_shards": 1
  }
}'

