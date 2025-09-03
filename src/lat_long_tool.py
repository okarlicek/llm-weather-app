import requests
from dotenv import load_dotenv
import os

load_dotenv()

url = "https://geocode.maps.co/search?q={place}&api_key={YOUR_SECRET_API_KEY}"

url = url.format(
    place="praha žižkov baranova",
    YOUR_SECRET_API_KEY=os.getenv("GEOCODE_APY_KEY"),
)


if __name__ == "__main__":
    print(url)
    response = requests.get(url)
    response.raise_for_status()

    print(response.json())