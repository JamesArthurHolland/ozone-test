package main

import (
    "fmt"
    "log"
    "net/http"
    "os"
)

func main() {
    // TODO hashing testline DELETE AFTER
    name := os.Getenv("SERVICE")
    port := os.Getenv("PORT")

    if name == "" || port == "" {
        log.Fatalln("PORT or SVC_NAME env var not set")
    }

    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {

        fmt.Printf("Logging for %s.", name)
        w.WriteHeader(http.StatusOK)
        msg := fmt.Sprintf("Runnable %s is OK", name)
        w.Write([]byte(msg))
    })

    addr := fmt.Sprintf(":%s", port)
    http.ListenAndServe(addr, nil)
}