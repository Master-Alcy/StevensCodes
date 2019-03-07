# Redis

1. not only SQL
2. FAST
   1. C
   2. In Ram
3. caching
4. Should be used internally

## cli

* EXPIRE key time
* TTL key
* SETX key time value
* PERSIST key
  * stop expire
* MSET key1 val1 key2 val2
* APPEND key1 val2 => key1 => val1 + val2
* RENAME key name