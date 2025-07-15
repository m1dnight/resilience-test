package org.example;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import org.example.Result;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

// Driver Class
public class Main {
    // Main Method
    public static void main(String[] args) {
        try {
            // Create an HttpServer instance
            HttpServer server = HttpServer.create(new InetSocketAddress(4000), 0);

            // Create a context for a specific path and set the handler
            server.createContext("/", new MyHandler());

            // Start the server
//            System.out.println("using 0 threads");
//            server.setExecutor(null); // Use the default executor
            System.out.println("using 10 threads");
            server.setExecutor(java.util.concurrent.Executors.newFixedThreadPool(10)); // Use the default executor
            server.start();

            System.out.println("Server is running on port 4000");
        } catch (IOException e) {
            System.out.println("Error starting the server: " + e.getMessage());
        }
    }

    // Define a custom HttpHandler
    static class MyHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            // Handle the request
            Result result = new Result("ok");

             ObjectMapper objectMapper = new ObjectMapper();
             String json = objectMapper.writeValueAsString(result);
            exchange.getResponseHeaders().set("Content-Type", "application/json; charset=utf-8");
            exchange.sendResponseHeaders(200, json.length());
            OutputStream os = exchange.getResponseBody();
            os.write(json.getBytes());
            os.close();

        }
    }
}