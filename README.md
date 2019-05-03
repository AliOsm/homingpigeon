# Homing Pigeon

Simple web application allows you to monitor your experiments results remotly.

## Usage

First of all you need to register for a new account on the [application](https://homingpigeon.herokuapp.com) and confirm your email. Then using your account, create a new pigeon and get the pigeon `token`.

For Python users you can use this [library](https://github.com/AliOsm/homingpigeon-python) which is allow you to use the application in one line of code.

For other languages, simply you can make a `GET` request to the following URL using the pigeon `token`:

```
https://homingpigeon.herokuapp.com/:token:?information=:your_text:
```
