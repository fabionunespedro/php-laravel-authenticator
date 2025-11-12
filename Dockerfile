FROM php:8.3-cli

# Evita perguntas durante a instalação
ARG DEBIAN_FRONTEND=noninteractive

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    vim \
    curl \
    libzip-dev \
    zip \
    && docker-php-ext-install zip pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*


# Instala o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Define o diretório de trabalho
WORKDIR /app

# Copia todos os arquivos do projeto para dentro do container
COPY . .

# Corrige permissões automaticamente (sem travar build se não existir ainda)
RUN mkdir -p storage bootstrap/cache && \
    chmod -R 777 storage bootstrap/cache || true

# Copia o script de inicialização
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Porta do servidor embutido do Laravel
EXPOSE 8000

# Usa o entrypoint personalizado
ENTRYPOINT ["entrypoint.sh"]
