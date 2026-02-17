from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            pod_ip = socket.gethostbyname(socket.gethostname())
            self.wfile.write(f"Hello from pod with IP: {pod_ip}".encode())
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == "__main__":
    server_address = ("0.0.0.0", 8080)
    httpd = HTTPServer(server_address, SimpleHandler)
    print("Starting server on port 8080...")
    httpd.serve_forever()
