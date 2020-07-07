bin/magento setup:install \
  --db-host=db \
  --db-name=magento \
  --db-user=magento \
  --db-password=magento \
  --base-url=https://localhost/ \
  --admin-firstname=John \
  --admin-lastname=Smith \
  --admin-email=john.smith@gmail.com \
  --admin-user=john.smith \
  --admin-password=password123 \
  --language=en_US \
  --currency=USD \
  --timezone=America/New_York \
  --use-rewrites=1

bin/magento setup:config:set --no-interaction --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0

bin/magento setup:config:set --no-interaction  --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1

bin/magento setup:config:set --no-interaction --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=4 --session-save-redis-db=2
