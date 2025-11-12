#!/bin/sh
set -e

# Garante que o .env exista
    echo "🟡 Criando arquivo .env a partir do .env.example..."
    cp /app/.env.example /app/.env

git config --global --add safe.directory /app

# Instala dependências
echo "🟢 Instalando dependências do Composer..."
composer install --no-interaction --prefer-dist --optimize-autoloader

# Gera a chave do app
echo "🟢 Gerando APP_KEY..."
php artisan key:generate --force || echo "⚠️ Falha ao gerar key (verifique o .env)"

# Ajusta permissões
chmod -R 777 storage bootstrap/cache

# Inicia o servidor Laravel
echo "🚀 Iniciando servidor Laravel em 0.0.0.0:8002..."
exec php artisan serve --host=0.0.0.0 --port=8002
