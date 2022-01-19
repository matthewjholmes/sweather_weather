## Sweather Weather
A back-end application that exposes an API to support user-facing application to plan road trips. The API exposed will allow front-end developers to show users the current weather as well as the forecasted weather when they arrive at their destination.

The goal of this project was to deploy a service-oriented architecture to expose an API that satisfied the front-end team’s requirements.

Main learning goals:
Expose an API that aggregates data from multiple external APIs
Expose an API that requires an authentication token
Expose an API for CRUD functionality
Determine completion criteria based on the needs of other developers
Research, select, and consume an API based on your needs as a developer

### Prerequisites
Rails 5.2.6
Ruby 2.7.2

API key from Open Weather
API key from Mapquest
API key from Unsplash

### Installation
Fork & clone this repo

Run bundle install to install gem packages

Run rails db:{drop,create,migrate} to set up the database

Run bundle exec figaro install then add your API keys to the config/application.yml file as: OPEN_WEATHER_API_KEY for Open Weather, MAPQUEST_API_KEY for MapSuest, and UNSPLASH_ACCESS_KEY for Unsplash

Run rails s and navigate to localhost:3000 to consume Whether, Sweater's API endpoints

### Endpoints

_Retrieve weather for a city._

Request GET /api/v1/forecast?location=<location>

Sample Request:

`GET /api/v1/forecast?location=denver,co`

Sample Response:

```
  {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current": {
                "datetime": "2022-01-19T13:35:18.000-07:00",
                "sunrise": "2022-01-19T07:17:15.000-07:00",
                "sunset": "2022-01-19T17:03:46.000-07:00",
                "temperature": 24.55,
                "feels_like": 18.19,
                "humidity": 88,
                "uvi": 0.81,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04d"
            },
            "daily": [
                {
                    "date": "2022-01-19",
                    "sunrise": "2022-01-19T07:17:15.000-07:00",
                    "sunset": "2022-01-19T17:03:46.000-07:00",
                    "max_temp": 35.85,
                    "min_temp": 24.55,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-20",
                    "sunrise": "2022-01-20T07:16:43.000-07:00",
                    "sunset": "2022-01-20T17:04:54.000-07:00",
                    "max_temp": 41.63,
                    "min_temp": 25.72,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-01-21",
                    "sunrise": "2022-01-21T07:16:09.000-07:00",
                    "sunset": "2022-01-21T17:06:03.000-07:00",
                    "max_temp": 37.47,
                    "min_temp": 28.87,
                    "conditions": "snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-01-22",
                    "sunrise": "2022-01-22T07:15:33.000-07:00",
                    "sunset": "2022-01-22T17:07:13.000-07:00",
                    "max_temp": 37.09,
                    "min_temp": 25.95,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-01-23",
                    "sunrise": "2022-01-23T07:14:55.000-07:00",
                    "sunset": "2022-01-23T17:08:23.000-07:00",
                    "max_temp": 43.21,
                    "min_temp": 30.02,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly": [
                {
                    "time": "01:00 PM",
                    "temperature": 25.21,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "02:00 PM",
                    "temperature": 24.55,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "03:00 PM",
                    "temperature": 25.5,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "04:00 PM",
                    "temperature": 26.37,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "05:00 PM",
                    "temperature": 26.65,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "06:00 PM",
                    "temperature": 26.67,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "07:00 PM",
                    "temperature": 26.51,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "08:00 PM",
                    "temperature": 26.35,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                }
            ]
        }
    }
}
  ```
  
Background image for the city
Request GET /api/v1/backgrounds?location=<location>

Sample Request:

`GET /api/v1/backgrounds?location=denver,co`

Sample Response:

  ```
{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
}
  ```
  
User Registration
Request POST /api/v1/users

Sample Request Body:

```
  {
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
  ```
  
Sample Response:

  ```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
Login
Request POST /api/v1/sessions

Sample Request Body:
  
```
  {
  "email": "whatever@example.com",
  "password": "password"
}
  
 ```
  
Sample Response:

  ```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
  
Road Trip
  
Request POST /api/v1/road_trip

Sample Request Body:

```
  {
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
  ```
  
Sample Response:

```
  {
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
  ```

Contact:
Matt Holmes

Project Link

Acknowledgements

API from Open Weather

API from Map Quest

API from Unsplash

