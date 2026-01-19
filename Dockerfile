FROM mitmproxy/mitmproxy:10.4

WORKDIR /app

# Копируем ваш скрипт (убедитесь, что он НЕ называется mitmproxy.py!)
COPY mitmproxy_proxy.py .

EXPOSE 80

# Запускаем mitmdump (НЕ mitmproxy!)
CMD ["mitmdump", "-s", "mitmproxy_proxy.py", "--listen-port", "80", "--ssl-insecure"]
