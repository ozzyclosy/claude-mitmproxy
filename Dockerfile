# Используем официальный образ mitmproxy (на базе Python)
FROM mitmproxy/mitmproxy:10.4

# Устанавливаем зависимости, если они нужны (опционально)
# RUN pip install --no-cache-dir some-package

# Копируем ваш прокси-скрипт в контейнер
COPY mitmproxy_proxy.py /app/mitmproxy_proxy.py

# Устанавливаем рабочую директорию
WORKDIR /app

# Открываем порт 80 (HTTP)
EXPOSE 80

# Запускаем mitmproxy в режиме transparent proxy (без веб-интерфейса)
# --ssl-insecure — отключает проверку SSL-сертификатов
# --no-web-open-browser — отключает попытку открыть браузер (не нужен в контейнере)
CMD ["mitmproxy", "-s", "mitmproxy_proxy.py", "--listen-port", "80", "--ssl-insecure", "--no-web-open-browser"]
