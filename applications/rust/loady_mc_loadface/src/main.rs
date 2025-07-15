use axum::{routing::get, Json, Router};

#[derive(serde::Deserialize, serde::Serialize)]
struct Response {
    response: String,
}

#[tokio::main]
async fn main() {
    // build our application with a route
    let app = Router::new().route("/", get(handler));

    // run it
    let listener = tokio::net::TcpListener::bind("0.0.0.0:4000")
        .await
        .unwrap();
    println!("listening on {}", listener.local_addr().unwrap());
    axum::serve(listener, app).await.unwrap();
}

async fn handler() -> Json<Response> {
    let response = Response {
        response: "ok".to_string(),
    };
    Json(response)
    // Html("<h1>Hello, World!</h1>")
}
