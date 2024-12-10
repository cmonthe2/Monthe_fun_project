from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route('/weather', methods=['GET'])
def weather():
    latitude = request.args.get('latitude')
    longitude = request.args.get('longitude')
    if not latitude or not longitude:
        return jsonify({"error": "Missing latitude or longitude"}), 400

    response = requests.get("https://api.open-meteo.com/v1/forecast", params={
        "latitude": latitude,
        "longitude": longitude,
        "current_weather": True
    })
    return jsonify(response.json())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
