package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {

        w.WriteHeader(http.StatusOK)
        msg := fmt.Sprintf("Runnable C is OK")
        w.Write([]byte(msg))
    })

    addr := fmt.Sprintf(":%s", "9004")
    http.ListenAndServe(addr, nil)
}