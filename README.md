# ESP32-CAM POC

# API Endpoints Documentation

## GET /
This endpoint retrieves a list of items from the server. It returns a JSON array containing the items.

### Example GET Request
```
    curl http://127.0.0.1:5000/ -H "Authorization: Bearer your-secret-token"
```

## POST /
This endpoint send data to the server.

### Example POST Request
```
    curl -X POST http://127.0.0.1:5000/ \
        -H "Authorization: Bearer your-secret-token" \
        -H "Content-Type: application/json" \
        -d '{"name": "Alice", "message": "Hello!"}'
```

# ESP32-CAM HINTS

You need to press the IO0 button, unplug it, wait 10 seconds, and then plug it back in. After that, do the upload.

Reference: https://www.makerhero.com/blog/utilize-esp32-cam-como-leitor-de-qr-code/

Important:
Versions 2.0.0 and higher of the core are not compiling with the library (which had its last update in 2019). It worked up to version 1.0.6 of the ESP32 core.

Success!