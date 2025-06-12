## 🚀 Getting Started

### Prerequisites

- PHP **8.2+**
- [Composer](https://getcomposer.org/)
- Laravel **12+**
- [Postman](https://www.postman.com/) (or other API client)

---

### 🛠️ Installation

```bash
composer install
cp .env.example .env
php artisan key:generate
```
---
## Running Laravel Migrations

To create the necessary database tables, run the following command:

```bash
php artisan migrate
```
## Database Structure (Created by Migrations)

The following table  will be created when you run the migrations:

### `users`
> ⚠️ This is the default `users` table provided by Laravel.  
> For more details, refer to the official documentation:  
> [https://laravel.com/docs/12.x/migrations](https://laravel.com/docs/12.x/migrations)

## Database Seeders

After running the migrations, you can populate the database with default data using Laravel seeders.

### Users Seeder

This seeder inserts a default user into the `users` table:

| ` User Seeder `     | infos  |
| -------- | -------  |
| name      |user1|
| email     |user1@email.com|
| password  |123456|

These permissions are commonly used in RESTful APIs to control access to actions such as listing, creating, viewing, updating, and deleting resources.

### Run the Seeders

To execute the seeders and populate the database:

```bash
php artisan db:seed
```

## Running the Server

To start the Laravel development server, run:

```bash
php artisan serve
```

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
| Code     | Meaning  |
| -------- | -------  |
| 200      |Success (returns token)|
| 400      |Bad Request (error: could not create a user)|

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
| Code     | Meaning  |
| -------- | -------  |
| 200      |Success (returns token)|
| 400      |Bad Request (error: unsupported_grant_type)|
| 400      |Bad Request (error: invalid_grant)|
| 401      |Unauthorized (error: invalid_client)|

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
---
# Postman Collection
> [Download authenticator API collection](docs/Authenticator.postman_collection.json)
