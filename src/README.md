# DevOps Challenge Demo Code:

This application will be used as a demo for DevOps Challenges.

You should fork/clone this repository to use as a basis for the challenge.

## Demo application

### Requirements

#### System

- GNU/Linux
- `python` >= 3.7
- `pip` >= 9.0
- `redis` >= 5.0

`>=` means any version of the package, above or equal to the specified version.

#### Application

- `redis-py`
- `tornado`

You can find them in the `requirements.txt` file and their required version number.
You can install them by using:

```bash
pip install -r requirements.txt
```

### :rocket: Starting the Application

The application uses several environment variables.
You can find them all and their default values in the `.env` file. They need to be avaiable at runtime. Here is an overview about the environment variables:

- `ENVIRONMENT` the environment in which the application is run. Likely `PROD` for production or `DEV` for development context.
- `HOST` the hostname on which the application is running. Locally it is `localhost`.
- `PORT` is the port on which the application is running.
- `REDIS_HOST` is the hostname on which redis is running. Locally it is `localhost`.
- `REDIS_PORT` is the port on which to communicate with redis. Normally it is `6379`.
- `REDIS_DB` which redis db should be used. Normally it is `0`.

Application can be found in `hello.py` file. You can start the application by using:

```bash
export $(cat .env | xargs) && python hello.py
```

Although you don't have to export the environment variables that way. :wink:

### Static files

- Static files are located in `static/` folder.
- Templates are located in `template/` folder.

### Executing Tests

Tests can be found in `tests/test.py` file.
You can run the tests by using:

```bash
python tests/test.py
```

## License

Copyright (c) 2019 by the Tradebyte Software GmbH.<br/>
`DevOps-Challenge` is free software, and may be redistributed under the terms specified in the [LICENSE] file.

[license]: /LICENSE

