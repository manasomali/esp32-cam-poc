from flask import Flask, request, jsonify
from dotenv import load_dotenv
import os
from typing import Tuple, Any

app = Flask(__name__)

load_dotenv()

API_TOKEN: str | None = os.getenv("API_TOKEN")

received_data: list[dict[str, Any]] = []


def verify_token() -> Tuple[dict[str, str], int] | None:
    token: str | None = request.headers.get("Authorization")
    if token != f"Bearer {API_TOKEN}":
        return jsonify({"error": "Unauthorized"}), 401


@app.route("/", methods=["POST"])
def receive_post() -> Tuple[str, int]:
    auth_response = verify_token()
    if auth_response:
        return auth_response

    data: dict | None = request.json
    if data:
        received_data.append(data)
        print(f"Received data: {data}")
        return "Data received", 200
    return "No data sent", 400


@app.route("/", methods=["GET"])
def get_data() -> Tuple[dict, int]:
    return jsonify(received_data), 200


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
