# Python 3 server example
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import time

hostName = "localhost"
serverPort = 4000

# class MyServer(BaseHTTPRequestHandler):
#     def do_GET(self):
        # response = {'response': "ok"}
        # response_str = json.dumps(response)

#         self.send_response(200)
#         self.send_header("Content-type", "application/json")
#         self.end_headers()
#         self.wfile.write(bytes(response_str, "utf-8"))

# if __name__ == "__main__":
#     webServer = HTTPServer((hostName, serverPort), MyServer)
#     print("Server started http://%s:%s" % (hostName, serverPort))

#     try:
#         webServer.serve_forever()
#     except KeyboardInterrupt:
#         pass

#     webServer.server_close()
#     print("Server stopped.")

from aiohttp import web

async def handle(request):
    response = {'response': "ok"}
    response_str = json.dumps(response)
    headers = {'Content-Type': 'application/json'}
    return web.Response(text=response_str , headers=headers)

app = web.Application()
app.add_routes([web.get('/', handle),
                web.get('/{name}', handle)])

if __name__ == '__main__':
    web.run_app(app, port=4000)