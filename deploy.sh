#!/usr/bin/env bash
set -e

echo "🚀 Starting deployment..."

# Navigate to app directory
cd /var/www/html

echo "📦 Installing composer dependencies..."
composer install --no-dev --optimize-autoloader

echo "🔑 Generating application key..."
php artisan key:generate --force

echo "⚙️ Caching configuration..."
php artisan config:cache

echo "🛣️ Caching routes..."
php artisan route:cache

echo "📊 Running database migrations..."
php artisan migrate --force

echo "🧹 Clearing caches..."
php artisan cache:clear
php artisan view:clear

echo "✅ Deployment complete!"

# Start PHP-FPM and NGINX
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
