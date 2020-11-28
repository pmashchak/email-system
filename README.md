# README



Run redis server
`redis-server /usr/local/etc/redis.conf`

Run resque queues
`QUEUE=* rake resque:work`

Run whenever scheduler
`bundle exec whenever`
