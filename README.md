<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains thousands of video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the [Laravel Partners program](https://partners.laravel.com).

### Premium Partners

- **[Vehikl](https://vehikl.com)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel)**
- **[DevSquad](https://devsquad.com/hire-laravel-developers)**
- **[Redberry](https://redberry.international/laravel-development)**
- **[Active Logic](https://activelogic.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## 🚀 Getting Started

### Prerequisites

- PHP **8.2+**
- [Composer](https://getcomposer.org/)
- Laravel **12+**
- [Postman](https://www.postman.com/) (or other API client)
- A access token OAuth2 Bearer

---

### 🛠️ Installation

```bash
composer install
cp .env.example .env
php artisan key:generate
```
---
## Running the Server

To start the Laravel development server, run:

```bash
php artisan serve
```

## Application Ports

By default, each Laravel-based service runs on a different port (address server and port localizated in .env file):

| Service        | Default Port | .env Variable                    |
|----------------|--------------|----------------------------------|
| Authenticator  | `8000`       | `AUTHENTICATOR`                  |
| Authorizator   | `8001`       | `AUTHORIZATHOR`                  |
| Backend API    | `8003`       | — *(Used directly by clients or frontend)*     |

To run each project on a specific port, use the `--port` flag when starting the Laravel server:

```bash
php artisan serve --port=8001
```
---

## 📘 API Documentation

**<font color="black"> Register an user:</font>**

```http
POST /api/user/create
```
<br>

***json request example that your send:***
```json
{
  "name": "your_name",
  "email": "email@example.com",
  "password": "your_password"
}
```
<br>

***json body returned:***
```json
{
    "name": "your_name",
    "email": "email@example.com",
    "updated_at": "2025-06-06T19:06:12.000000Z",
    "created_at": "2025-06-06T19:06:12.000000Z",
    "id": 6
}
```
<br>
<br>

**<font color="black">Login an application:</font>**

```http
POST /oauth/token
```
<br>

***json request example that your send:***
```json
{
  "grant_type": "password",
  "client_id": "your_client_id",
  "client_secret": "your_client_secret",
  "username": "email@example.com",
  "password": "your_password",
  "scope": ""
}
```
<br>

***json body returned:***
```json
{
    "token_type": "Bearer",
    "expires_in": "expiration",
    "access_token": "access_token",
    "refresh_token": "refresh_token"
}
```
<br>
<br>

**<font color="black">Check user</font>**
```php
GET /api/user/check
```
<br>

***Header (JSON)***
```http
Authorization: Bearer your_access_token
```
<br>

***json body returned:***
```json
{
    "id": 1,
    "name": "your_name",
    "email": "email@example.com",
    "password": "password_hash"
}
```
<br>

| Code     | Meaning  |
| -------- | -------  |
| 200      |Success (returns token)|
| 401      | Unauthorized (invalid token)|
