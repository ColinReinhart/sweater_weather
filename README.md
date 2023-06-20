# Sweater Weather API
This project was built as part of a final assessment for advancing to the next tier at [Turing School of Software and Design](https://turing.edu/).

The core goals of this project are to:
  - Expose an API that aggregates data from multiple external APIs
  - Expose an API that requires an authentication token
  - Expose an API for CRUD functionality
  - Determine completion criteria based on the needs of other developers
  - Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

Once the setup instructions below have been completed you will be able to make API calls to:
  - Retrieve precise weather info for a specified location
  - Register/create a user (also creates an API key that will be needed later)
  - Authenticate a user and retrieve that user's API key
  - Return a Json for a 'Road Trip' with origin, destination, time to destination, and weather for the anticipated arrival time at the destination


## Prereqs
Built with:
  - Ruby 2.7.4
  - Rails 5.2.8.1
  - RSpec 3.11

APIs used:
  - [OpenWeather Docs](https://openweathermap.org/api/one-call-3) [(Sign up for a free key here)](https://home.openweathermap.org/users/sign_up)
  - [MapQuest Docs](https://developer.mapquest.com/documentation) [(Sign up for a free key here)](https://developer.mapquest.com/user/login/sign-up)


## Setup
1. Ensure that you have the prerequisites or equivalent
2. Clone this repo and navigate to the root folder `cd sweater-weather`
3. Run `bundle install`
4. Run `bundle exec figaro install`
5. Open the file `./config/application.yml` and add the following lines into the file:
  ```ruby
  maps_api: your bare key goes here, no quotes
  weather_api: your bare key goes here, no quotes
  yelp_api: your bare key goes here, no quotes
  ```
6. Run `rails db:{drop,create,migrate,seed}`
7. (Optional) To run the test suite, run `bundle exec rspec`
8. Run `rails s`

You should now be able to hit the API endpoints using Postman or a similar tool.
Default host is `http://localhost:3000`
## Endpoints

### Retrieve Precise Weather Info
#### GET /api/v1/forecast
- Required Params
  - `location`
    - This can be in an address format or city/state. ex. 'denver,co',
- Example Request
  - `GET http://localhost:3000/api/v1/forecast?location=denver,co`
  ```ruby
  GET /api/v1/forecast?location=denver,co
  Content-Type: application/json
  Accept: application/json
  ```
- Example Response
  - Returns 5 days and 8 hours of weather data
  ```ruby
      {
        "data": {
            "id": null,
            "type": "forecast",
            "attributes": {
                "current_weather": {
                    "date": "Jun 21,  1:18 AM",
                    "sunrise": "Jun 20,  5:31 PM",
                    "sunset": "Jun 21,  8:31 AM",
                    "temperature": 83.14,
                    "feels_like": 80.87,
                    "humidity": 24,
                    "uvi": 10.42,
                    "visibility": 10000,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                "hourly_weather": [
                    {
                        "time": "Jun 20,  7:00 PM",
                        "temp": 83.14,
                        "conditions": "overcast clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 20,  8:00 PM",
                        "temp": 83.75,
                        "conditions": "overcast clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 20,  9:00 PM",
                        "temp": 84.79,
                        "conditions": "broken clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 20, 10:00 PM",
                        "temp": 84.83,
                        "conditions": "broken clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 20, 11:00 PM",
                        "temp": 84.33,
                        "conditions": "broken clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 21, 12:00 AM",
                        "temp": 83.08,
                        "conditions": "broken clouds",
                        "icon": "04d"
                    },
                    {
                        "time": "Jun 21,  1:00 AM",
                        "temp": 81.14,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "Jun 21,  2:00 AM",
                        "temp": 77.95,
                        "conditions": "clear sky",
                        "icon": "01d"
                    }
                ],
                "daily_weather": [
                    {
                        "date": "Jun 20,  7:00 PM",
                        "sunrise": "Jun 20, 11:31 AM",
                        "sunset": "Jun 21,  2:31 AM",
                        "max_temp": 84.83,
                        "min_temp": 63.72,
                        "conditions": "overcast clouds",
                        "icon": "04d"
                    },
                    {
                        "date": "Jun 21,  7:00 PM",
                        "sunrise": "Jun 21, 11:32 AM",
                        "sunset": "Jun 22,  2:31 AM",
                        "max_temp": 88.84,
                        "min_temp": 63.72,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "date": "Jun 22,  7:00 PM",
                        "sunrise": "Jun 22, 11:32 AM",
                        "sunset": "Jun 23,  2:31 AM",
                        "max_temp": 77.86,
                        "min_temp": 59.14,
                        "conditions": "heavy intensity rain",
                        "icon": "10d"
                    },
                    {
                        "date": "Jun 23,  7:00 PM",
                        "sunrise": "Jun 23, 11:32 AM",
                        "sunset": "Jun 24,  2:31 AM",
                        "max_temp": 89.01,
                        "min_temp": 58.41,
                        "conditions": "light rain",
                        "icon": "10d"
                    },
                    {
                        "date": "Jun 24,  7:00 PM",
                        "sunrise": "Jun 24, 11:32 AM",
                        "sunset": "Jun 25,  2:31 AM",
                        "max_temp": 84.13,
                        "min_temp": 58.66,
                        "conditions": "clear sky",
                        "icon": "01d"
                    }
                ]
            }
        }
    }
  ```

### Register/create a user (also creates an API key that will be needed later)
#### POST /api/v1/users
- Required Params
  - N/A (Send required data in the body of the request as displayed in the example below)
- Example Request
  - `POST http://localhost:3000/api/v1/users`
  ```ruby
  POST /api/v1/users
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "email": "email@gmail.com",
    "password": "password",
    "password_confirmation": "password"
  }
  ```
- Example Response
  ```ruby
  {
      "data": {
          "id": 6,
          "type": "users",
          "attributes": {
              "email": "email@gmail.com",
              "api_key": "a778185030f2a2c9c3039e31e1a670c7"
          }
      }
  }
  ```

### Authenticate a user and retrieve that user's API key
#### POST /api/v1/sessions
- Required Params
  - N/A (Send required data in the body of the request as displayed in the example below)
- Example Request
  - `POST http://localhost:3000/api/v1/sessions`
  ```ruby
  POST /api/v1/sessions
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "email": "email@gmail.com",
    "password": "password"
  }
  ```
- Example Response
  ```ruby
  {
      "data": {
          "id": 6,
          "type": "users",
          "attributes": {
              "email": "email@gmail.com",
              "api_key": "a778185030f2a2c9c3039e31e1a670c7"
          }
      }
  }
  ```


### Return a 'Road Trip' Json
#### POST /api/v1/road_trip
- Required Params
  - N/A (Send required data in the body of the request as displayed in the example below)
  - `POST http://localhost:3000/api/v1/road_trip`
  ```ruby
  POST /api/v1/road_trip
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "9d8832e4850362efbdc1a130f1f11ddf"
  }
  ```
- Example Response
  - Weather provided will be for the arrival time at the destination
  ```ruby
  {
      "data": {
          "id": null,
          "type": "roadtrip",
          "attributes": {
              "start_city": "denver,co",
              "end_city": "pueblo,co",
              "travel_time": "days: 0, hours: 1, minutes: 45",
              "weather_at_eta": {
                  "temperature": 90.45,
                  "conditions": "clear sky"
              }
          }
      }
  }
  ```

  