FROM python:3.12-slim@sha256:9c1d9ed7593f2552a4ea47362ec0d2ddf5923458a53d0c8e30edf8b398c94a31
WORKDIR /app/OpenManus
RUN apt-get update && apt-get install -y --no-install-recommends git curl && rm -rf /var/lib/apt/lists/* && (command -v uv >/dev/null 2>&1 || pip install --no-cache-dir uv)
COPY . .
RUN uv pip install --system --prerelease=allow -r requirements.txt
EXPOSE 5000
CMD ["python", "-u", "main.py", "--prompt", "Initialize OpenManus"]
