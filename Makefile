# Invoke FlightPlan

build:
	pipenv sync && pipenv run flightplan build

install:
	pipenv sync && pipenv run flightplan install
