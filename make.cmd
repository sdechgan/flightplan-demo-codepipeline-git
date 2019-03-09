REM Invoke FlightPlan
@ECHO OFF
pipenv sync
pipenv run flightplan "%1"
