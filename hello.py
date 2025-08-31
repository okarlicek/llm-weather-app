import os

from dotenv import load_dotenv
from pydantic import BaseModel, Field
from pydantic_ai import Agent

load_dotenv()

MODEL: str = os.environ.get("MODEL")


class Greeting(BaseModel):
    name: str = Field(description="The name of the person to greet.")
    greeting: str = Field(description="The greeting to the person.")


agent = Agent(MODEL, output_type=Greeting)


if __name__ == "__main__":
    result = agent.run_sync("Wish a good day to Ondřej.")
    print(result.output)
    print(result.output.greeting)
    print(result.usage())
