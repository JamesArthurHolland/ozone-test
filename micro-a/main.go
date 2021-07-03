package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {

        w.WriteHeader(http.StatusOK)
        msg := fmt.Sprintf("Runnable MICRO-A is OK")
        log.Println("logging")
        w.Write([]byte(msg))
    })

    addr := fmt.Sprintf(":%s", "8081")
    http.ListenAndServe(addr, nil)
}