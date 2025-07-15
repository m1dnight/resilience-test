package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Response struct {
	Response string
}

func index(c *gin.Context) {

	response := Response{"ok"}
	c.IndentedJSON(http.StatusOK, response)
}

func main() {
	router := gin.Default()

	router.GET("/", index)

	err := router.Run(fmt.Sprintf("%s:%s", "0.0.0.0", "4000"))
	if err != nil {
		log.Fatal("failed to start server.")
		return
	}
}
