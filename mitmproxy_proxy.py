# redirect_proxy.py
from mitmproxy import http

TARGET_HOST = "api.anthropic.com"
TARGET_SCHEME = "https"

def request(flow: http.HTTPFlow) -> None:
    # Проверяем, что запрос идёт на 127.0.0.1 (или localhost)
    if flow.request.host in ("0.0.0.0"):
        original_path = flow.request.path
        flow.request.scheme = TARGET_SCHEME
        flow.request.host = TARGET_HOST

        # Сохраняем исходный путь (включая query string)
        flow.request.path = original_path

        print(f"Перенаправлено: {flow.request.method} http://0.0.0.0{original_path} → {TARGET_SCHEME}://{TARGET_HOST}{original_path}")
