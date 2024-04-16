FROM python:3.9

# Uaktualnij pip
RUN pip install --upgrade pip

# Ustaw katalog roboczy na /app
WORKDIR /app

# Skopiuj plik requirements.txt do obrazu
COPY requirements.txt .

# Zainstaluj pakiety wymienione w pliku requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj pozostałą zawartość aplikacji do obrazu
COPY . .

# Zwiększ limit ilości wątków
RUN echo "kernel.threads-max=100000" >> /etc/sysctl.conf \
    && sysctl -p

# Uruchom aplikację
CMD ["python", "app.py"]
