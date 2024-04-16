# Pobierz oficjalny obraz Python w wersji 3.9 jako bazowy obraz
FROM python:3.9

# Ustaw katalog roboczy na '/app'
WORKDIR /app

# Skopiuj pliki 'requirements.txt' do katalogu roboczego w kontenerze
COPY requirements.txt .

# Zainstaluj zależności Pythona
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj resztę plików aplikacji do katalogu roboczego w kontenerze
COPY . .

# Ustaw zmienne środowiskowe, jeśli są wymagane
# ENV VARIABLE_NAME value

# Określ port, na którym aplikacja będzie nasłuchiwać
EXPOSE 5000

# Uruchom aplikację po uruchomieniu kontenera
CMD [ "python", "app.py" ]
