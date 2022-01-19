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
Retrieve weather for a city
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

GET /api/v1/forecast?location=bend,or

Sample Response:

{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "bend,or",
            "description": "Horseshoe Bend during daytime",
            "image_urls": {
                "raw": "https://images.unsplash.com/photo-1483086451546-5a971a934123?ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=200"
            },
            "credit": {
                "name": "Des Récits",
                "self": "https://api.unsplash.com/users/desrecits",
                "html": "https://unsplash.com/@desrecits",
                "photos": "https://api.unsplash.com/users/desrecits/photos",
                "portfolio": "https://api.unsplash.com/users/desrecits/portfolio"
            }
        }
    }
}
User Registration
Request POST /api/v1/users

Sample Request:

{
  "email": "missfrizbeethemouse@pets.com",
  "password": "***************ries",
  "password_confirmation":  "***************ries"
}
Sample Response:

{
    "data": {
        "id": "10",
        "type": "users",
        "attributes": {
            "email": "missfrizbeethemouse@pets.com",
            "api_key": "****************************fO9x"
        }
    }
}
Login
Request POST /api/v1/sessions

Sample Request:

{
  "email": "tedthedog@pets.com",
  "password": "**************wels"
}
Sample Response:

{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "tedthedog@pets.com",
            "api_key": "****************************RPhR"
        }
    }
}
Road Trip
Request POST /api/v1/road_trip

Sample Request:

{
  "origin": "Denver,CO",
  "destination": "Bend,OR",
  "api_key": "****************************dXIp"
}
Sample Response:

{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Bend,OR",
            "travel_time": "16:13:11",
            "weather_at_eta": {
                "temperature": 55.51,
                "conditions": "overcast clouds"
            }
        }
    }
}
Roadmap
See the open issues for a list of proposed features (and known issues).

Contact
Leigh Cepriano Pulzone - Linkedin - GitHub - Email

Project Link

Acknowledgements
Project Board

API from Open Weather

API from Map Quest

API from Unsplash

Photographer Attribution Guidelines
